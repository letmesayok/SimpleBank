<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
    <%@ include file="./public/css.jsp" %>
    <title>${pageContext.request.contextPath }</title>
    <style>
        .center {
            width: 500px;
            height: 500px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -50px 0 0 -50px;
        }
    </style>
</head>

<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <%@ include file="./public/headMenu.jsp" %>
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item">
                        <a class="" href="/index">主页</a>
                    </li>
                    <li class="layui-nav-item">
                        <a class="" href="javascript:;">账户操作</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/bill/out">取钱</a></dd>
                            <dd><a href="/bill/in">存钱</a></dd>
                            <dd><a href="/bill/transport">转账</a></dd>
                            <dd><a href="/bill/all">操作记录</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">账户管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/account/all">账户列表</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed"><a href="/user/author">关于作者</a></li>
                </ul>
            </div>
        </div>
        <div class="layui-footer">
            <!-- 底部固定区域 -->

        </div>
        <div class="layui-body">
            <!-- 内容主体区域 -->
            <span>只想做一个闲鱼</span><br />
            <div class="center">
                <i class="layui-icon layui-icon-login-qq" style="font-size: 50px; color: #1E9FFF;"></i>
                <a href="tencent://AddContact/?fromId=30&fromSubId=1&subcmd=all&uin=784187419"
                    style="font-size: 50px; color: #1E9FFF;">添加好友</a>
            </div>
        </div>
    </div>
    </div>
    <%@ include file="./public/js.jsp" %>
</body>

</html>