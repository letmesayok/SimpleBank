<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
    <%@ include file="./public/css.jsp" %>
    <title>主页</title>
</head>

<body class="layui-layout-body">
    <input type="hidden" id="flag" value='${flag}' />
    <input type="hidden" id="account" value='${account}' />
    <form id="form" class="layui-form">
        <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
        <div class="layui-form-item">
            <label class="layui-form-label">账户</label>
            <div class="layui-input-block">
                <input type="text" name="account" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">户主姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="0" title="男">
                <input type="radio" name="sex" value="1" title="女" checked>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input type="text" name="age" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">初始金额</label>
            <div class="layui-input-block">
                <input type="text" name="money" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
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

            var f = $("#flag").val();
            var account = $("#account").val();
            // 1表示修改 0表示添加
            if (f == 1) {
                //给表单赋值
                form.val("form", account);
            }


            form.on('submit(form)', function (data) {
                var value = data.field;
                if (f == 0) {
                    $.ajax({
                        url: '/account/add',
                        type: 'post',
                        data: value,
                        success: function (data) {
                            if (data == "success") {
                                layer.open({
                                    closeBtn: 0,
                                    type: 0,
                                    content: '添加成功！'
                                })
                                // 清空表单
                                layer.close(index);
                            } else {
                                layer.open({
                                    closeBtn: 0,
                                    type: 0,
                                    content: data
                                })
                            }
                        }
                    })
                } else {
                    $.ajax({
                        url: '/account/edit',
                        type: 'post',
                        data: value,
                        success: function (data) {
                            if (data == "success") {
                                layer.open({
                                    closeBtn: 0,
                                    type: 0,
                                    content: '修改成功!'
                                })
                                // 清空表单
                                layer.close(index);
                            } else {
                                layer.open({
                                    closeBtn: 0,
                                    type: 0,
                                    content: data
                                })
                            }
                        }
                    })
                }

                return false; //阻止表单跳转。
            })
        });

    </script>
</body>

</html>