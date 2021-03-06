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
    <title>查看供应商信息</title>
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

    <script type="text/javascript">
        function topage(page) {
            var form = document.getElementById("myform");
            document.getElementById("page").setAttribute("value", page);
            form.submit();
        }

        function changebg(obj, cl) {
            var bgcolor;
            if (cl == "0") {
                bgcolor = "#E2EDFC";
            } else {
                bgcolor = "#F8FBFE";
            }
            obj.style.backgroundColor = bgcolor;
        }
    </script>
</head>
<body>
<%@ include file="/page/share/menu.jsp" %>
<div id="content">
    <div>
        <form action="Supplier!findSupplier.action" method="post">
            <div class="col-lg-6">
                <div class="input-group" align="center">
                    <input type="text" class="form-control" name="message"> <span
                        class="input-group-btn"> <input type="submit" value="查询"
                                                        class="btn btn-default">
						</span>
                </div>
            </div>

        </form>
    </div>
    <form method="post" action="Supplier.action" align="center"
          id="myform">
        <input type="hidden" name="page" value="1" id="page"/>
        <table
                style="border: 1 #000000 solid;margin: 20px auto 20px;opacity:0.9;font-family: '微软雅黑',serif;width:1000px;text-align: center;">
            <thead align="center">
            <tr>
                <td>
                    <h2>供应商编号</h2>
                </td>
                <td>
                    <h2>名称</h2>
                </td>
                <td>
                    <h2>联系人</h2>
                </td>
                <td>
                    <h2>联系电话</h2>
                </td>
                <td>
                    <h2>传真号码</h2>
                </td>
                <td>
                    <h2>联系地址</h2>
                </td>
                <td>
                    <h2>评价</h2>
                </td>
                <td>
                    <h2>供应商情况</h2>
                </td>
            </tr>
            </thead>
            <s:iterator value="pageView.records" var="s" status="st">
                <tr align="center" style="background-color: #F8FBFE"
                    onmousemove="changebg(this,0)" onmouseout="changebg(this,1)">
                    <td><s:property value="#st.count"/></td>
                    <td><a
                            href="Supplier!findOneSupplier.action?supplierId=${s.supplierId}">${s.supplierName}</a>
                    </td>
                    <td>${s.contacts}</td>
                    <td>${s.phone}</td>
                    <td>${s.fax}</td>
                    <td>${s.address}</td>
                    <td>${s.evaluation}</td>
                    <td><c:if test="${s.enableUse == true}">
                        正常使用
                    </c:if> <c:if test="${s.enableUse == false}">
                        暂停使用
                    </c:if></td>
                </tr>
            </s:iterator>
        </table>
        <table align="center"
               style="font-family: '微软雅黑',serif;text-align: center">
            <tr>
                <td colspan="4" bgcolor="#114a93" align="right"
                    style="padding-right: 5px;height: 20px;">
                    <%@ include
                            file="/page/share/fenye.jsp" %>
                </td>
            </tr>
        </table>
    </form>
</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>
