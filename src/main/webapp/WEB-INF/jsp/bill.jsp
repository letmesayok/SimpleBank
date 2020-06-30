<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
  <%@ include file="./public/css.jsp" %>
  <title>操作记录</title>
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
          <li class="layui-nav-item layui-nav-itemed">
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
        , height: 400,
        width: 850,
        url: '/bill/getAll' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
          { field: 'id', title: 'ID', width: 160, sort: true, fixed: 'left' }
          , { field: 'account', title: '操作账户', width: 160, sort: true }
          , { field: 'type', title: '操作类型', width: 160, templet: '#type' }
          , { field: 'toAccount', title: '目标账户', width: 160 }
          , { field: 'time', title: '操作时间', width: 200 }
        ]]
      });

    });
  </script>

  <script type="text/html" id="type">
    {{#  if(d.type == 3){ }}
      <span>转账</span>
    {{#  } else if(d.type == 1) { }}
      <span>存款</span>
    {{#  } else { }}
      <span>取款</span>
    {{#  } }}
  </script>

</body>

</html>