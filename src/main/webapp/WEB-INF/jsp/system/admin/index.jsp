<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>标题</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/adminlte/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="plugins/pace/pace.min.css">
    <link rel="stylesheet" href="static/adminlte/css/AdminLTE.min.css">
    <link rel="stylesheet" href="static/adminlte/css/skins/skin-moorgen.css">
    <link rel="stylesheet" href="static/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="static/css/index.css"/>
    <link rel="stylesheet" href="static/css/moorgen.css"/>
    <style>
        .sidebar-toggle-div {
            text-align: center;
            padding: 5px;
        }

        body.sidebar-collapse .sidebar-toggle-div.sidebar-toggle {
            transform: rotate(90deg);
            -ms-transform: rotate(90deg); /* IE 9 */
            -moz-transform: rotate(90deg); /* Firefox */
            -webkit-transform: rotate(90deg); /* Safari 和 Chrome */
            -o-transform: rotate(90deg);
        }
    </style>
</head>
<body class="sidebar-mini index_fixed_layout body-main skin-black">
<%--sidebar-mini index_fixed_layout body-main skin-black pace-running--%>
<input type="hidden" name="webSocketUrl" id="webSocketUrl" value="${webSocketUrl}">
<div class="wrapper">
    <%--上方显示栏--%>
    <!-- Main Header -->
    <header class="main-header topBox">

        <!-- Logo -->
        <a href="index.view" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini" style="font-size: 14px">title</span>
            <%--<!-- logo for regular state and mobile devices -->--%>
            <img class="logo-lg logo-img" src="static/images/logo/logo.png" alt="">
            <span class="logo-title">标题</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <%--<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">--%>
            <%--<span class="sr-only">Toggle navigation</span>--%>
            <%--</a>--%>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">

                    <!-- Control Sidebar Toggle Button -->
                    <li>
                        <a><i class="iconfont icon-yonghu" style="padding-right: 5px;font-size: 18px"></i>admin</a>
                    </li>
                    <li>
                        <a href="logout"
                           style="border-left: 1px solid #333333;border-right-width: 0;"><i class="fa fa-sign-out"></i></a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="#" data-toggle="control-sidebar"--%>
                           <%--style="border-left: 1px solid #333333;border-right-width: 0;"><i class="fa fa-gears"></i></a>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </nav>
        <div id="room-menu" class="moorgen-contextmenu" style="display: none;z-index: 999">

        </div>
    </header>

    <!--左侧菜单-->
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar leftBox" style="height: 100%;">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar Menu -->
            <%--<div class="sidebar-toggle-div sidebar-toggle" data-toggle="push-menu" role="button">--%>
            <%--<i class="fa fa-bars" style="color: #dbdbdb"></i>--%>
            <%--</div>--%>
            <%--<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">--%>
            <div data-toggle="push-menu" role="button" class="sidebar-toggle sidebar-toggle-div">
                <i class="fa fa-bars" style="color: #dbdbdb"></i>
            </div>
            <ul class="sidebar-menu" data-widget="tree">
                <%--<li class="header"></li>--%>

                <c:forEach items="${menuList}" var="menu">
                    <c:if test="${menu.hasMenu}">
                        <c:choose>
                            <c:when test="${menu.subMenu.size()<=0}">
                                <li>
                                    <c:if test="${empty menu.menuUrl}">
                                        <a href="javascript:void(0);"><i class="${menu.menuIcon}"></i>
                                            <span>${menu.menuName }</span></a>
                                    </c:if>
                                    <c:if test="${not empty menu.menuUrl}">
                                        <a href="${menu.menuUrl}"><i class="${menu.menuIcon}"></i>
                                            <span>${menu.menuName }</span></a>
                                    </c:if>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="treeview">
                                    <a href="#">
                                        <i class="${menu.menuIcon}"></i>
                                        <span>${menu.menuName }</span>
                                        <i class="fa fa-angle-left pull-right"></i>
                                    </a>
                                    <ul class="treeview-menu">
                                        <c:forEach items="${menu.subMenu}" var="sub">
                                            <c:if test="${sub.hasMenu}">
                                                <c:if test="${not empty sub.menuUrl}">
                                                    <li id="z${sub.menuId }">
                                                        <a href="${sub.menuUrl}">${sub.menuName }</a>
                                                    </li>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>


    <%--中间内容--%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-box-bg">
        <div id="contentBox" class="content-wrapper">
            <input id="INDEX_BACK_URL" type="hidden"
                    <c:choose>
                        <c:when test="${not empty INDEX_BACK_URL}">
                            value="${INDEX_BACK_URL}"
                        </c:when>
                        <c:otherwise>
                            value="index.view"
                        </c:otherwise>
                    </c:choose>
            />
        </div>
    </div>


    <%--底部--%>
    <%--<footer class="main-footer">--%>
    <%--<!-- To the right -->--%>
    <%--<div class="pull-right hidden-xs">--%>
    <%--Anything you want--%>
    <%--</div>--%>
    <%--<!-- Default to the left -->--%>
    <%--<strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.--%>
    <%--</footer>--%>

    <%--右侧隐藏设置区域--%>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane active" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:;">
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <%--右侧隐藏设置区域背景--%>
    <div class="control-sidebar-bg"></div>

    <%--提示模板--%>
    <%--拟态框--%>
    <div class="modal" id="modal" tabindex="-1" aria-labelledby="modalTitle" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="modalTitle">
                        标题
                    </h4>
                </div>
                <div class="modal-body" id="modalBody" style="text-align: center;">
                    <div style="text-align: center;width: 100%">
                        <i class="fa fa-spinner fa-pulse"></i>
                    </div>
                </div>
                <div class="modal-footer" style="display: none;">
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                    <%--<button type="button" class="btn moorgen-light-blue">提交更改</button>--%>
                </div>
            </div>

        </div>
    </div>

    <!-- 询问框 -->
    <div class="modal" id="confirm" tabindex="-2" role="dialog" aria-labelledby="confirmTitle" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="confirmTitle">
                        提示
                    </h4>
                </div>
                <div class="modal-body" id="confirmBody">
                    <div style="text-align: center;width: 100%">
                        <i class="fa fa-spinner fa-pulse"></i>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn moorgen-light-blue" id="confirm_btn_OK">确认</button>
                </div>
            </div>
        </div>
    </div>

    <%--授权弹出框--%>
    <div class="modal" id="custom-modal" tabindex="-1" aria-labelledby="modalTitle" role="dialog"
         aria-hidden="true">
        <div style="margin-top: 130px;" class="modal-dialog" id="custom-content">
        </div>
    </div>
    <!-- 对话框 -->
    <div class="modal" id="alert" tabindex="-2" role="dialog" aria-labelledby="alertTitle" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="alertTitle">
                        提示
                    </h4>
                </div>
                <div class="modal-body" id="alertBody">
                    <div style="text-align: center;width: 100%">
                        <i class="fa fa-spinner fa-pulse"></i>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn moorgen-light-blue" id="alert_btn_OK">确认</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/html" id="loading">
        <i class="fa fa-2x fa-spinner fa-pulse" style="margin-right: 15px;vertical-align: middle"></i>{{content}}
    </script>

</div>
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="plugins/pace/pace.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<%--<script type="text/javascript" src="static/adminlte/js/app.min.js"></script>--%>
<script type="text/javascript" src="static/adminlte/js/adminlte.min.js"></script>
<script type="text/javascript" src="static/js/jquery.pjax.js"></script>
<script type="text/javascript" src="static/js/page.js"></script>
<script type="text/javascript" src="static/js/modal.js"></script>
<script type="text/javascript" src="static/js/indexLoad.js"></script>
<%--<script type="text/javascript" src="static/js/util.js"></script>--%>
<script type="text/javascript" src="plugins/layer/layer.js"></script>
<script type="text/javascript" src="static/js/moorgen-alert.js"></script>
<script type="text/javascript" src="static/js/template-web.js"></script>
<script type="text/javascript" src="static/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="static/js/validate.methods.js"></script>
<script type="text/javascript" src="static/js/validate.messages_zh.js"></script>
<script type="text/javascript" src="static/js/validate.common.js"></script>
<script type="text/javascript" src="static/js/jquery.form.min.js"></script>
<script type="text/javascript" src="plugins/ztree/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="static/fonts/iconfont.js"></script>
<!-- 图标 -->
<script type="text/javascript" src="static/js/echarts.min.js"></script>
<script type="text/javascript" src="static/js/moorgen.js"></script>
<%--省市区--%>
<script type="text/javascript" src="static/js/distpicker.min.js"></script>
<%--日期--%>
<script type="text/javascript" src="static/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="static/js/websocket.js"></script>
</body>
<script >
    var socketUrl = $("#webSocketUrl").val();
    var sysSocket = null;
    var sysSocketInterval = null;
    sys_socket();
    function sys_socket() {
        if(sysSocket != null){
            console.info("sysSocket不为null")
            sysSocket.close();
            sysSocket = null;
        }
        sysSocket = new MoorgenWebSocket({
            url: socketUrl,
            chonglian: true,
            onopen: function () {
                sysSocketInterval = window.setInterval(_localHeartbeat(sysSocket), 60000);
            },
            onmessage: function (response) {
                var result = JSON.parse(response.data);
                console.info("result——"+JSON.stringify(result))
            },
            onclose: function (e) {
                console.info("关闭webSocket")
                window.clearInterval(sysSocketInterval);
            },
            onerror: function (e) {
                console.info("异常关闭webSocket")
                window.clearInterval(sysSocketInterval);
            },
            onbeforeunload: true
        })
    }
</script>
</html>
