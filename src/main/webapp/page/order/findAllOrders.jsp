<%--
  Created by IntelliJ IDEA.
  User: he_bin
  Date: 2014/5/12
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/share/taglib.jsp" %>
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
    <title>采购单查询</title>
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
    <script language="javascript" type="text/javascript"
            src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <%--jQuery placeholder, for IE6,7,8,9--%>
    <script src="<%=basePath%>js/jquery.JPlaceholder.js"></script>
    <%--加载dwr--%>
    <script src='<%=basePath%>dwr/util.js' type="text/javascript"></script>
    <script src='<%=basePath%>dwr/engine.js' type="text/javascript"></script>
    <script src='<%=basePath%>dwr/interface/supplierService.js'
            type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            supplierService.findAllSupplier(getResult);
        });

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

        function getResult(suppliers) {
            var select_list = '<option value="" style="text-align: center">'
                    + '---------请选择---------' + '</option>';
            for (var i = 0; i < suppliers.length; i++) {
                select_list += '<option style="text-align: center" value="' + suppliers[i].supplierId + '">'
                + suppliers[i].supplierName + "</option>";
            }
            $("#supplier").html(select_list);
        }

        function checkNull() {
            var date = document.getElementById("orderDate").value;
            var supplier = document.getElementById("supplier").selectedIndex;
            var orderId = document.getElementById("orderId").value;
            if (date == "" && supplier == 0 && orderId == "") {
                alert("请至少输入一个查询条件");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<%@ include file="/page/share/menu.jsp" %>
<div id="content">
    <form action="Order!search.action" method="post" onsubmit="return checkNull();">
        <input type="hidden" name="flag" value="4">

        <div class="form-group" align="center">
            <table>
                <tr align="center">
                    <td>需求日期：</td>
                    <td><input type="text" name="orderDate" class="Wdate"
                               onclick="WdatePicker({skin:'whyGreen',minDate: '%y-%M-%d'})" id="orderDate"/></td>
                    <td>&nbsp;&nbsp;</td>
                    <td>供应商：</td>
                    <td><select name="supplier" id="supplier"
                                style="font-family: '微软雅黑';font-size: 16px;"></select></td>
                    <td>&nbsp;&nbsp;</td>
                </tr>
                <tr align="center">
                    <td>采购编号：</td>
                    <td>
                        <input type="text" class="form-control"
                               placeholder="请输入采购编号" name="orderId" style="height: 28px;width: 180px" id="orderId">
                    </td>
                    <td>&nbsp;&nbsp;</td>
                </tr>
                <tr align="center">
                    <td colspan="6" align="center">
                        <button type="submit" class="btn btn-default">查询</button>
                        <button type="reset" class="btn btn-default">重置</button>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <form action="DemandPlans.action" method="post" id="myform">
        <input type="hidden" name="page" value="1" id="page"/>
        <table
                style="border: 1px #ffffff solid;margin: 20px auto 20px;opacity:0.9;font-family: '微软雅黑',serif;width:1000px;text-align: center;">
            <thead align="center">
            <tr>
                <td>
                    <h2>序号</h2>
                </td>
                <td>
                    <h2>采购编号</h2>
                </td>
                <td>
                    <h2>物料名称</h2>
                </td>
                <td>
                    <h2>供应商</h2>
                </td>
                <td>
                    <h2>需求日期</h2>
                </td>
                <td>
                    <h2>现流程节点</h2>
                </td>
            </tr>
            </thead>
            <s:iterator value="pageView.records" var="pr" status="s">
                <tr style="background-color: #F8FBFE"
                    onmousemove="changebg(this,0)" onmouseout="changebg(this,1)">
                    <td>${s.count}</td>
                    <td><a
                            href="Order!findOrder.action?orderId=${pr.orderId}&flag=4">${pr.orderId}</a>
                    </td>
                    <td>${pr.pm.material.materialName}</td>
                    <td>${pr.pm.supplier.supplierName}</td>
                    <td><fmt:formatDate value="${pr.orderDate}"
                                        pattern="yyyy-MM-dd"/></td>
                    <td><c:if test="${pr.status == 'PU'}">
                        部门负责人
                    </c:if> <c:if test="${pr.status == 'HEAD'}">
                        采购中
                    </c:if> <c:if test="${pr.status == 'DONE'}">
                        采购到货
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
