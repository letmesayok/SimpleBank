<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
  <%@ include file="./public/css.jsp" %>
  <title>取款</title>
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

      <div style="text-align: center; width: 400px; margin: 100px;">
        <form id="form" class="layui-form">
          <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span>账户</label>
            <div class="layui-input-inline">
              <input type="text" id="account" name="account" required placeholder="请输入账户" lay-verify="account"
                class="layui-input">
            </div>
            <button id="query" type="button" class="layui-btn layui-btn-normal">查询</button>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span>金额</label>
            <div class="layui-input-block">
              <input type="text" name="money" required placeholder="请输入金额" lay-verify="money" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <div class="layui-input-block">
              <button class="layui-btn" lay-submit lay-filter="form">确定</button>
            </div>
          </div>
        </form>
      </div>

    </div>
  </div>
  </div>
  <%@ include file="./public/js.jsp" %>
  <script>
    layui.use('form', function () {
      var form = layui.form;
      form.render();
      form.verify({
        account: function (value) {
          if (!/^[0-9]+$/.test(value)) {
            return "账户为数字";
          }
        },
        money: [
          /^[1-9]\d*00$/
          , '金额必须为100的正整数倍'
        ]
      });
      form.on('submit(form)', function (data) {
        var value = data.field;
        $.ajax({
          url: '/account/out',
          type: 'post',
          data: value,
          success: function (data) {
            if (data == "success") {
              layer.open({
                closeBtn: 0,
                type: 0,
                content: '取款成功！'
              })
              // 清空表单
              $("#form")[0].reset();
              layui.form.render();
            } else {
              layer.open({
                closeBtn: 0,
                type: 0,
                content: data
              })
            }
          }
        })
        return false; //阻止表单跳转。
      })
    });

    $("#query").click(function () {
      var account = $("#account").val();
      $.ajax({
        url: '/account/get?account=' + account,
        method: 'get',
        success: function (data) {
          console.log(data);
          if (data.message == "success") {
            var a = data.data;
            var content = "姓名：" + a.name + "<br/>余额：" + a.money;
            layer.open({
              type: 4,
              content: [content, '#query']
            });
          } else {
            layer.open({
              type: 4,
              content: ["未查询到该账户信息", '#query']
            });
          }
        }
      })
    })
  </script>

</body>

</html>