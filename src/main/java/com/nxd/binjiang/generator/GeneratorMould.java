package com.nxd.binjiang.generator;

import org.mybatis.generator.api.GeneratedJavaFile;
import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;
import org.mybatis.generator.api.dom.java.*;
import org.mybatis.generator.api.dom.xml.Attribute;
import org.mybatis.generator.api.dom.xml.Document;
import org.mybatis.generator.api.dom.xml.TextElement;
import org.mybatis.generator.api.dom.xml.XmlElement;

import java.util.List;

public class GeneratorMould extends PluginAdapter {

    @Override
    public boolean validate(List<String> warnings) {
        return true;
    }


    @Override
    public boolean sqlMapDocumentGenerated(Document document, IntrospectedTable introspectedTable) {

        String tableName = introspectedTable.getAliasedFullyQualifiedTableNameAtRuntime();//数据库表名
        XmlElement parentElement = document.getRootElement();
        // 批量删除
        XmlElement batchDeleteElement = new XmlElement("delete");
        batchDeleteElement.addAttribute(new Attribute("id", "batchDelete"));
        batchDeleteElement.addAttribute(new Attribute("parameterType", "String"));
        String key = introspectedTable.getGeneratedKey().getColumn();
        String keyProp = "";
        batchDeleteElement.addElement(
                new TextElement(
                        "delete from " + tableName + "\n    where " + key + " in "
                                + " \n    <foreach item=\"item\" index=\"index\" collection=\"array\" open=\"(\" separator=\",\" close=\")\">\n       #{item}\n    </foreach> "
                ));

        GeneratedJavaFile javaFile = introspectedTable.getGeneratedJavaFiles().get(0);
        String parameterType = javaFile.getCompilationUnit().getType().toString();
        //插入
        XmlElement insertElement = new XmlElement("insert");
        insertElement.addAttribute(new Attribute("id", "insert"));
        insertElement.addAttribute(new Attribute("parameterType", parameterType));
        List<IntrospectedColumn> columns = introspectedTable.getBaseColumns();
        String props = "";
        String updateProps = "";
        String cols = "";
        for (int i = 0; i < columns.size(); i++) {
            String property = columns.get(i).getJavaProperty();
            String col = columns.get(i).getActualColumnName();
            props += "            <if test=\""+property+" != null and "+property+" !=''\">\n"
                    + "                " + col
                    + " , \n            </if>\n";
            if(key.equals(col)){
                keyProp = property;
                continue;
            }
            cols += "            <if test=\""+property+" != null and "+property+" !=''\">\n"
                    + "                #{" + property
                    + "} , \n            </if>\n";


            updateProps += "            <if test=\""+property+" != null and "+property+" !=''\">\n"
                    + "                " + col + " = #{" + property + "} ,"
                    + "\n            </if>\n";
        }
        insertElement.addElement(
                new TextElement(
                        "      insert into " + tableName
                                + "\n        <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">\n"
                                + props
                                + "        </trim>"
                                + "\n        <trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\">\n"
                                + cols
                                + "        </trim>"
                ));

        //修改
        XmlElement updateElement = new XmlElement("update");
        updateElement.addAttribute(new Attribute("id", "update"));
        updateElement.addAttribute(new Attribute("parameterType", parameterType));
        updateElement.addElement(
                new TextElement(
                        "      update " + tableName
                                + "\n          set"
                                + "\n        <trim suffixOverrides=\",\">\n"
                                + updateProps
                                + "        </trim>"
                                + "\n        where " + key + " = #{" + keyProp + "}"
                ));

        parentElement.addElement(batchDeleteElement);
        parentElement.addElement(insertElement);
        parentElement.addElement(updateElement);

        return super.sqlMapDocumentGenerated(document, introspectedTable);
    }

    @Override
    public boolean clientGenerated(Interface interfaze, TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        Method methodBatchDelete = new Method("batchDelete");
//        method.setReturnType(new FullyQualifiedJavaType("List<" + introspectedTable.getFullyQualifiedTable().getDomainObjectName() + ">"));
        methodBatchDelete.setReturnType(new FullyQualifiedJavaType("int"));
        methodBatchDelete.addParameter(new Parameter(new FullyQualifiedJavaType(introspectedTable.getFullyQualifiedTable().getDomainObjectName()), introspectedTable.getFullyQualifiedTable().getDomainObjectName()));
        Method methodInsert = new Method("insert");
//        method.setReturnType(new FullyQualifiedJavaType("List<" + introspectedTable.getFullyQualifiedTable().getDomainObjectName() + ">"));
        methodInsert.setReturnType(new FullyQualifiedJavaType("int"));
        methodInsert.addParameter(new Parameter(new FullyQualifiedJavaType(introspectedTable.getFullyQualifiedTable().getDomainObjectName()), introspectedTable.getFullyQualifiedTable().getDomainObjectName()));
        Method methodUpdate = new Method("update");
//        method.setReturnType(new FullyQualifiedJavaType("List<" + introspectedTable.getFullyQualifiedTable().getDomainObjectName() + ">"));
        methodUpdate.setReturnType(new FullyQualifiedJavaType("int"));
        methodUpdate.addParameter(new Parameter(new FullyQualifiedJavaType(introspectedTable.getFullyQualifiedTable().getDomainObjectName()), introspectedTable.getFullyQualifiedTable().getDomainObjectName()));
        interfaze.addMethod(methodBatchDelete);
//        interfaze.addMethod(methodInsert);
        interfaze.addMethod(methodUpdate);
        interfaze.addAnnotation("@Repository");
        interfaze.addImportedType(new FullyQualifiedJavaType("org.springframework.stereotype.Repository"));
        return super.clientGenerated(interfaze, topLevelClass, introspectedTable);
    }

}
