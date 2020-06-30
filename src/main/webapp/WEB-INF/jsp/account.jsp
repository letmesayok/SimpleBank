<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
    <%@ include file="./public/css.jsp" %>
    <title>账户列表</title>
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
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">账户管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/account/all">账户列表</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="/user/author">关于作者</a></li>
                </ul>
            </div>
        </div>
        <div class="layui-footer">
            <!-- 底部固定区域 -->

        </div>
        <div class="layui-body">
            <!-- 内容主体区域 -->
            <div style="text-align: center;">
                <div class="layui-inline" style="margin-top: 50px;">
                    <table id="list" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
    </div>
    <%@ include file="./public/js.jsp" %>
    <script>
        layui.use('table', function () {
            var table = layui.table;

            //第一个实例
            table.render({
                elem: '#list'
                , height: 500,
                width: 1210,
                url: '/account/getAll' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    { field: 'id', title: 'ID', width: 160, sort: true, fixed: 'left' }
                    , { field: 'account', title: '账户id', width: 160, sort: true }
                    , { field: 'name', title: '户主', width: 160 }
                    , { field: 'password', title: '密码', width: 160 }
                    , { field: 'sex', title: '性别', width: 100 }
                    , { field: 'age', title: '年龄', width: 100 }
                    , { field: 'money', title: '账户余额', width: 200 }
                    , { field: 'operator', title: '操作', width: 160, templet: '#update' }
                ]],
                toolbar: "<div><button type='button' class='layui-btn layui-btn-sm'>新增</button></div>"
            });
        });
    </script>

    <script type="text/html" id="update">
    <button type="button" class="layui-btn layui-btn-normal layui-btn-sm ">修改</button>
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm ">删除</button>
  </script>
</body>

</html>