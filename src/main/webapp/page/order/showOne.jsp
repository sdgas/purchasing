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
        $(function () {
            $(".dis").css("display", "none");
            if (${person.position.positionId==2}
                    &&
            ${person.department.departmentId==8}
            && ${order.status=='PU'})
            {
                $(".dis").css("display", "block");
            }
        });
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
    <form action="#" method="post" id="down">
        <input type="hidden" name="prId" value="${pr.prId}">
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
                    <h2>单价</h2>
                </td>
                <td>
                    <h2>总价</h2>
                </td>
            </tr>
            <s:iterator value="purchaseOrders" var="o" status="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${o.pm.material.materialId}</td>
                    <td>${o.pm.material.materialName}</td>
                    <td>${o.pm.material.standard}</td>
                    <td>${o.pm.material.materialType}</td>
                    <td>${o.pm.material.materialUnit}</td>
                    <td>${o.amount}</td>
                    <td>${o.pm.price}</td>
                    <td>${o.totalPay}</td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </form>

    <form action="Order!check.action" method="post" id="bidding">
        <table>
            <tr>
                <td>当前环节：</td>
                <td style="width: 500px"><c:if test="${order.status == 'PU'}">
                    <span style="color: red">采购申请 --></span>
                    <span>招标采购部经理 -->采购</span>
                </c:if> <c:if test="${order.status == 'HEAD'}">
                    <span style="color: red">采购申请 -->招标采购部经理 -->采购</span>
                </c:if> <c:if test="${order.status == 'CANCEL'}">
                    <span style="color: red">采购申请 -->审核不通过</span>
                </c:if></td>
            </tr>
            <tr class="dis">
                <td><input type="hidden" name="orderId"
                           value="${order.orderId}"> <input type="radio"
                                                            name="status" value="true">通过
                </td>
                <td><input type="radio" name="status" value="false">不通过
                </td>
            </tr>
            <tr class="dis">
                <td colspan="3"><input type="submit" name="tijiao" value="提交"
                                       id="sub"></td>
            </tr>
        </table>
    </form>
</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>
