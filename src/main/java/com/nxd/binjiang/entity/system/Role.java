package com.nxd.binjiang.entity.system;

/**
 * 类名称：Role.java
 * 类描述：
 *
 * @author luhangqi
 * 作者单位：
 * 联系方式：
 * 创建时间：2014年3月10日
 * @version 1.0
 */
public class Role {
    /**
     *
     *
     * @mbg.generated 2017-09-28
     */
    private String roleId;

    /**
     *
     *
     * @mbg.generated 2017-09-28
     */
    private String roleName;

    /**
     *
     *
     * @mbg.generated 2017-09-28
     */
    private String rights;

    /**
     *
     *
     * @mbg.generated 2017-09-28
     */
    private String parentId;

    /**
     *
     *
     * @mbg.generated 2017-09-28
     */
    private String addQx;

    /**
     *
     *
     * @mbg.generated 2017-09-28
     */
    private String delQx;

    /**
     *
     *
     * @mbg.generated 2017-09-28
     */
    private String editQx;

    /**
     *
     *
     * @mbg.generated 2017-09-28
     */
    private String chaQx;

    /**
     *
     *
     * @mbg.generated 2017-09-28
     */
    private String qxId;


    public Role() {
    }

    public Role(String roleId) {
        this.roleId = roleId;
    }

    /**
     *
     * @return ROLE_ID
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     *
     * @param roleId
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    /**
     *
     * @return ROLE_NAME
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     *
     * @param roleName
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    /**
     *
     * @return RIGHTS
     */
    public String getRights() {
        return rights;
    }

    /**
     *
     * @param rights
     */
    public void setRights(String rights) {
        this.rights = rights == null ? null : rights.trim();
    }

    /**
     *
     * @return PARENT_ID
     */
    public String getParentId() {
        return parentId;
    }

    /**
     *
     * @param parentId
     */
    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    /**
     *
     * @return ADD_QX
     */
    public String getAddQx() {
        return addQx;
    }

    /**
     *
     * @param addQx
     */
    public void setAddQx(String addQx) {
        this.addQx = addQx == null ? null : addQx.trim();
    }

    /**
     *
     * @return DEL_QX
     */
    public String getDelQx() {
        return delQx;
    }

    /**
     *
     * @param delQx
     */
    public void setDelQx(String delQx) {
        this.delQx = delQx == null ? null : delQx.trim();
    }

    /**
     *
     * @return EDIT_QX
     */
    public String getEditQx() {
        return editQx;
    }

    /**
     *
     * @param editQx
     */
    public void setEditQx(String editQx) {
        this.editQx = editQx == null ? null : editQx.trim();
    }

    /**
     *
     * @return CHA_QX
     */
    public String getChaQx() {
        return chaQx;
    }

    /**
     *
     * @param chaQx
     */
    public void setChaQx(String chaQx) {
        this.chaQx = chaQx == null ? null : chaQx.trim();
    }

    /**
     *
     * @return QX_ID
     */
    public String getQxId() {
        return qxId;
    }

    /**
     *
     * @param qxId
     */
    public void setQxId(String qxId) {
        this.qxId = qxId == null ? null : qxId.trim();
    }


}
