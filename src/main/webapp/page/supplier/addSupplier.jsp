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
    <title>添加供应商信息</title>
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

    <script type="text/javascript">
        function confirm() {
            if ($('#supplierName').val() == "请输入供应商名称") {
                alert("请输入供应商名称");
                return false;
            }
            if ($('#contacts').val() == "请输入供应商联系人") {
                alert("请输入供应商联系人");
                return false;
            }
            if ($('#phone').val() == "请输入供应商联系电话") {
                alert("请输入供应商联系电话");
                return false;
            }
            if (!checkPhone()) {
                alert("请输入正确的联系电话");
                return false;
            }
            if ($('#address').val() == "请输入供应商联系地址") {
                alert("请输入供应商联系地址");
                return false;
            }
            document.getElementById("addForm").submit();
        }

        function checkPhone() {
            var pattern = /^\d{3,4}-\d{7,8}(-\d{3,4})?$/;
            var p2 = /\d{11}/;
            var phone = $('#phone').val();

            if (!pattern.test(phone) && !p2.test(phone)) {
                alert("请输入正确的联系电话！");
                return false;
            }
            return true;
        }

        function checkFax() {
            var pattern = /^\d{3,4}-\d{7,8}(-\d{3,4})?$/;
            var fax = $('#fax').val();

            if (!pattern.test(fax)) {
                alert("请输入正确的传真号码！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<%@ include file="/page/share/menu.jsp" %>
<div id="content">
    <form action="Supplier!addSupplier.action" method="post" id="addForm">
        <table align="center">
            <tr>
                <td colspan="2">
                    <h3>添加供应商信息</h3>
                </td>
            </tr>
            <tr>
                <td>供应商名称</td>
                <td><input id="supplierName" name="supplierName" type="text"
                           value="请输入供应商名称" style="color:#d2d2d2"
                           onclick="javascript:if(this.value=='请输入供应商名称'){this.value='';} this.style.color='#646464';"
                           onblur="javascript:if(this.value=='') {this.value='请输入供应商名称'; this.style.color='#d2d2d2';}">
                </td>
            </tr>
            <tr>
                <td>供应商联系人</td>
                <td><input id="contacts" name="contacts" type="text"
                           value="请输入供应商联系人" style="color:#d2d2d2"
                           onclick="javascript:if(this.value=='请输入供应商联系人'){this.value='';} this.style.color='#646464';"
                           onblur="javascript:if(this.value=='') {this.value='请输入供应商联系人'; this.style.color='#d2d2d2';}">
                </td>
            </tr>
            <tr>
                <td>供应商联系电话</td>
                <td><input id="phone" name="phone" type="text"
                           value="请输入供应商联系电话" style="color:#d2d2d2"
                           onclick="javascript:if(this.value=='请输入供应商联系电话'){this.value='';} this.style.color='#646464';"
                           onblur="javascript:if(this.value=='') {this.value='请输入供应商联系电话'; this.style.color='#d2d2d2';}"
                           onchange="checkPhone()"></td>
            </tr>
            <tr>
                <td>传真号码</td>
                <td><input id="fax" name="fax" type="text" value="请输入供应商传真号码"
                           style="color:#d2d2d2"
                           onclick="javascript:if(this.value=='请输入供应商传真号码'){this.value='';} this.style.color='#646464';"
                           onblur="javascript:if(this.value=='') {this.value='请输入供应商传真号码'; this.style.color='#d2d2d2';}"
                           onchange="checkFax()"></td>
            </tr>
            <tr>
                <td>供应商联系地址</td>
                <td><input id="address" name="address" type="text"
                           value="请输入供应商联系地址" style="color:#d2d2d2"
                           onclick="javascript:if(this.value=='请输入供应商联系地址'){this.value='';} this.style.color='#646464';"
                           onblur="javascript:if(this.value=='') {this.value='请输入供应商联系地址'; this.style.color='#d2d2d2';}">
                </td>
            </tr>
            <tr>
                <td>供应商评价</td>
                <td>
                    <%--<input name="evaluation" type="text" >--%> <textarea
                        name="evaluation" cols="45" rows="5" style="color:#d2d2d2"
                        onclick="javascript:if(this.value=='请输入对应的评价'){this.value='';} this.style.color='#646464';"
                        onblur="javascript:if(this.value=='') {this.value='请输入对应的评价'; this.style.color='#d2d2d2';}">请输入对应的评价</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input name="add" type="button" value="添加"
                                       onclick="confirm()"> <%--<button onclick="confirm();">添加</button>--%>
                    <input name="reset" type="reset" value="重置"></td>
            </tr>
        </table>
    </form>
</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>
