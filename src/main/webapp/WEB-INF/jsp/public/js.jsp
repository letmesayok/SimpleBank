<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/layui/layui.all.js"></script>
<script>
        /**
     * 假如当前 Url 是 http// www. liangshunet.
     * com/pub/item.aspx?t=osw7，则截取到的相对路径为：/pub/item.aspx。
     *
     * @returns
     */
     function GetUrlRelativePath() {
        var url = document.location.toString();
        var arrUrl = url.split("//");

        var start = arrUrl[1].indexOf("/");
        var relUrl = arrUrl[1].substring(start);// stop省略，截取从start开始到结尾的所有字符

        if (relUrl.indexOf("?") != -1) {
            relUrl = relUrl.split("?")[0];
        }
        return relUrl;
    }

    /**
     * 选中菜单默认打开
     * @returns
     */
    $(document).ready(function() {
        var url = GetUrlRelativePath();
        var patt1 = new RegExp(url);
        //$(".layui-this").removeClass();
        $(document.body).find('a').each(function(i, obj) {
            var str = $(obj).attr('href');
            if (patt1.test(str)) {
                $(obj).parent().addClass("layui-this");
            }
        });
    });

</script>