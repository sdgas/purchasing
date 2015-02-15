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
    <title>物料采购单</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content－Type" content="text/html;charset=UTF-8">
    <meta http-equiv="window-target" content="_top">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>

    <link rel="stylesheet" href="<%=basePath%>css/base2.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>

    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

    <script type="text/javascript" src="<%=basePath%>js/addPlans.js"></script>

    <script type="text/javascript">
        function compare(a, b) {
            if (a > b)
                alert("到货数量应少于采购数量");
        }
    </script>

    <style type="text/css">
        #content {
            width: 1500px;
            margin: 10px auto 0;
        }

        #content form table tr td {
            width: 150px;
            text-align: center;
        }

        .va {
            width: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="/page/share/menu.jsp" %>

<div id="content">
    <form action="Order!arrivalUpdate.action" method="post">
        <table style="border: 2px;">
            <tr>
                <td colspan="6" style="width: 1500px;">
                    <h3 style="margin-left:0;text-align: center">物料采购单</h3>
                </td>
            </tr>

            <tr class="va">
                <td>采购单号：</td>
                <td>${order.orderId}</td>
                <td>需求日期：</td>
                <td><fmt:formatDate value="${order.orderDate}"
                                    pattern="yyyy-MM-dd"/></td>
                <td>供应商：</td>
                <td>${order.pm.supplier.supplierName}</td>
            </tr>
            <tr class="va">
                <td>收货地址：</td>
                <td>${order.deliveryAddress}</td>
                <td>收货人:</td>
                <td>${order.consignee}</td>
                <td>联系电话：</td>
                <td>${order.contactPhone}</td>
            </tr>
            <tr class="va">
                <td>备注：</td>
                <td colspan="5" class="va">${order.remarks}</td>
            </tr>
        </table>

        <table id="mainTb">
            <tbody id="mainBody">
            <tr>
                <td>
                    <h2>序号</h2>
                </td>
                <td>
                    <h2>存货编号</h2>
                </td>
                <td>
                    <h2>存货名称</h2>
                </td>
                <td>
                    <h2>规格</h2>
                </td>
                <td>
                    <h2>型号</h2>
                </td>
                <td>
                    <h2>单位</h2>
                </td>
                <td>
                    <h2>数量</h2>
                </td>
                <td>
                    <h2>剩余数量</h2>
                </td>
                <td>
                    <h2>到货数量</h2>
                </td>
                <td>
                    <h2>单价</h2>
                </td>
                <td>
                    <h2>总价</h2>
                </td>
            </tr>
            <s:iterator value="purchaseOrders" var="o" status="s">
                <tr>
                    <td>${s.count}</td>
                    <td><input type="hidden" name="id" value="${o.id}">
                            ${o.pm.material.materialId}</td>
                    <td>${o.pm.material.materialName}</td>
                    <td>${o.pm.material.standard}</td>
                    <td>${o.pm.material.materialType}</td>
                    <td>${o.pm.material.materialUnit}</td>
                    <td>${o.amount}</td>
                    <td><c:set var="remain" value="${o.amount - o.arrivalNum}"/>
                            ${remain}</td>
                    <td><c:if test="${remain<=0}">
                        <input name="amount" type="text" value="${o.arrivalNum}"
                               style="width: 50px;" readonly="readonly">
                    </c:if> <c:if test="${remain>0}">
                        <input name="amount" type="text"
                               onchange="compare(this.value,${remain})" style="width: 50px;">
                    </c:if></td>
                    <td>${o.pm.price}</td>
                    <td>${o.totalPay}</td>
                </tr>
            </s:iterator>
            <tr align="right">
                <td colspan="9"></td>
                <td align="right">订单总价：</td>
                <td align="right"><c:set var="total" value="0"/> <c:forEach
                        items="${purchaseOrders}" var="po">
                    <c:set var="total" value="${total + po.totalPay}"/>
                </c:forEach> ${total}</td>
            </tr>
            <tr>
                <td colspan="5"></td>
                <td><input type="submit" value="提交"></td>
                <td><input type="reset" value="重置"></td>
            </tr>
            </tbody>
        </table>
    </form>

</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>
