<%--
  Created by IntelliJ IDEA.
  User: 120378
  Date: 2014/7/25
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/page/share/taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <title>添加物料信息</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content－Type" content="text/html;charset=UTF-8">
    <meta http-equiv="window-target" content="_top">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>

    <link rel="stylesheet" href="<%=basePath%>css/base2.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <script type="text/javascript">
        function changeAction() {
            var form = $('#f');
            form.attr("action", "Material.action");
            form.submit();
        }
    </script>
    <style type="text/css">
        tr {
            text-align: center;
        }

        td {
            width: 150px;
        }

        #content {
            margin-left: 350px;
        }
    </style>

</head>
<body>
<%@ include file="/page/share/menu.jsp" %>
<div id="content">
    <form action="Material!alter.action" method="post" id="f">
        <table align="center">
            <tr>
                <td colspan="2">
                    <h3>物料信息</h3>
                </td>
            </tr>
            <tr>
                <td>物料编号</td>
                <td><input name="materialId" type="text"
                           value="${material.materialId}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>物料名称</td>
                <td><input name="materialName" type="text"
                           value="${material.materialName}"></td>
            </tr>
            <tr>
                <td>物料型号</td>
                <td><input name="materialType" type="text"
                           value="${material.materialType}"></td>
            </tr>
            <tr>
                <td>物料规格</td>
                <td><input name="standard" type="text"
                           value="${material.standard}"></td>
            </tr>
            <tr>
                <td>物料计量单位</td>
                <td><input name="materialUnit" type="text"
                           value="${material.materialUnit}"></td>
            </tr>
            <tr>
                <td colspan="2"><input name="add" type="submit" value="修改">
                    <input name="reset" type="reset" value="重置">
                    <button onclick="changeAction()">返回</button>
                </td>
            </tr>
        </table>
    </form>
</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>
