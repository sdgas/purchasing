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
    <title>供应商信息</title>
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
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">

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
    <form method="post" action="Supplier.action" align="center">
        <input type="hidden" name="page" value="1" id="page"/>
        <table align="center" style="border: 1px,solid" rules="all">
            <tr>
                <td colspan="2">
                    <h3>供应商信息</h3>
                </td>
            </tr>
            <tr>
                <td>供应商编号</td>
                <td><span> ${supplier.supplierId} </span></td>
            </tr>
            <tr>
                <td>供应商名称</td>
                <td><span> ${supplier.supplierName} </span></td>
            </tr>
            <tr>
                <td>供应商联系人</td>
                <td><span> ${supplier.contacts} </span></td>
            </tr>
            <tr>
                <td>供应商联系电话</td>
                <td><span> ${supplier.phone} </span></td>
            </tr>
            <tr>
                <td>供应商传真号码</td>
                <td><span> ${supplier.fax} </span></td>
            </tr>
            <tr>
                <td>供应商联系地址</td>
                <td><span> ${supplier.address} </span></td>
            </tr>
            <tr>
                <td>供应商情况</td>
                <td><span> <c:if test="${supplier.enableUse == true}">
                    正常使用
                </c:if> <c:if test="${supplier.enableUse == false}">
                    暂停使用
                </c:if>
					</span></td>
            </tr>
            <tr>
                <td>供应商评价</td>
                <td><span> ${supplier.evaluation} </span></td>
            </tr>
        </table>

    </form>
</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>
