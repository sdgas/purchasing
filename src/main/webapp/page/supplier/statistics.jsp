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
    <title>查询</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content－Type" content="text/html;charset=UTF-8">
    <meta http-equiv="window-target" content="_top">
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta http-equiv="expires" content="0">

    <link rel="stylesheet" href="<%=basePath%>css/base2.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <%--自动补全/模糊搜索--%>
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>js/jquery.autocomplete.js"></script>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>css/jquery.autocomplete.css"/>

    <script src='<%=basePath%>dwr/util.js' type="text/javascript"></script>
    <script src='<%=basePath%>dwr/engine.js' type="text/javascript"></script>
    <script src='<%=basePath%>dwr/interface/supplierService.js'
            type="text/javascript"></script>
    <script src='<%=basePath%>dwr/interface/materialService.js'
            type="text/javascript"></script>

    <script type="text/javascript">
        function changebg(obj, cl) {
            var bgcolor;
            if (cl == "0") {
                bgcolor = "#E2EDFC";
            } else {
                bgcolor = "#F8FBFE";
            }
            obj.style.backgroundColor = bgcolor;
        }

        $(function () {
            supplier = [];
            material = [];
            supplierService.findAllSupplier(getSupplier);
            materialService.findAll(getAllMaterial);
        });

        function getSupplier(suppliers) {
            //组装json数据源对象objects
            for (var i = 0; i < suppliers.length; i++) {
                supplier[i] = suppliers[i].supplierName;
            }
        }

        function getAllMaterial(materials) {
            // 组装json数据源对象objects
            for (var i = 0; i < materials.length; i++) {
                var na = materials[i].materialId + "，" + materials[i].materialName
                        + "，" + materials[i].materialType;
                var val = materials[i].materialId;
                if (na.charAt(na.length - 1) == "，")
                    na = na.substring(0, na.length - 1);
                material[i] = {
                    name: na,
                    value: val
                };
            }
        }

        function findAuto() {
            $(".search").autocomplete(supplier, {
                delay: 100,
                minChars: 1, //表示在自动完成激活之前填入的最小字符
                max: 50, //表示列表里的条目数
                matchContains: true, //表示包含匹配,相当于模糊匹配
                scrollHeight: 200, //表示列表显示高度,默认高度为180

                formatItem: function (row) {
                    return row[0];
                },
                formatMatch: function (row) {
                    return row[0];
                },
                formatResult: function (row) {
                    return row[0];
                }
            });
        }

        function search() {
            // 模糊匹配
            $("#material").autocomplete(material, {
                delay: 100,
                minChars: 2, // 表示在自动完成激活之前填入的最小字符
                max: 50, // 表示列表里的条目数
                matchContains: true, // 表示包含匹配,相当于模糊匹配
                scrollHeight: 200, // 表示列表显示高度,默认高度为180

                formatItem: function (row) {
                    return row.name;
                },
                formatMatch: function (row) {
                    return row.name;
                },
                formatResult: function (row) {
                    return row.value;
                }
            });
        }

        function calculator(amount, price, num) {
            var decimalReg = /^\d{1,6}\.{0,1}(\d{1,2})?$/;
            if (decimalReg.test(price)) {
                var total = amount * price;
                $('#t' + num).val(total);
            } else {
                $('#price' + num).val();
                alert("请输入正确的价格!");
            }
        }

        function check() {
            var supplier = $("#supplier").val();
            var begin = $("#begin").val();
            var end = $("#end").val();
            if (supplier == "") {
                alert("请输入查询的供应商");
                return false;
            }
            if (begin == "") {
                alert("请输入查询的开始时间");
                return false;
            }
            if (end == "") {
                alert("请输入查询的结束时间");
                return false;
            }
        }
    </script>
</head>
<body>
<%@ include file="/page/share/menu.jsp" %>
<div id="content">
    <form action="Order!searchByDate.action" method="post" id="myForm"
          onsubmit="check()">

        <div>
            <table>
                <tr style="width: 1500px">
                    <td style="width:100px">供应商：</td>
                    <td><input type="text" name="supplier" id="supplier"
                               class="search" onclick="findAuto()"></td>
                    <td>&nbsp;&nbsp;</td>
                    <td style="width:100px">物料：</td>
                    <td><input type="text" name="material" id="material"
                               class="search" onclick="search()"></td>
                    <td>&nbsp;&nbsp;</td>
                    <td>开始日期：</td>
                    <td><input type="text" name="begin" id="begin" class="Wdate"
                               onfocus="WdatePicker({skin:'whyGreen',maxDate: '%y-%M-%d'})"/></td>
                    <td>结束日期：</td>
                    <td><input type="text" name="end" id="end" class="Wdate"
                               onfocus="WdatePicker({skin:'whyGreen',maxDate: '%y-%M-%d'})"/></td>
                    <td><input type="submit" class="btn btn-default" value="查询">
                </tr>
            </table>
        </div>
    </form>
    <form action="#" method="post">
        <table
                style="border: 1 #000000 solid;margin: 20px auto 20px;opacity:0.9;font-family: '微软雅黑',serif;width:1000px;text-align: center;">
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
                    <h2>采购单价</h2>
                </td>
                <td>
                    <h2>采购数量</h2>
                </td>
                <td>
                    <h2>采购金额</h2>
                </td>
            </tr>
            </thead>
            <s:iterator value="orders" var="o" status="s">
                <tr style="background-color: #F8FBFE"
                    onmousemove="changebg(this,0)" onmouseout="changebg(this,1)">
                    <td>${s.count}</td>
                    <td><a href="Order!findOrder.action?orderId=${o.orderId}">${o.orderId}</a>
                    </td>
                    <td>${o.pm.material.materialName}</td>
                    <td>${o.pm.supplier.supplierName}</td>
                    <td><fmt:formatDate value="${o.orderDate}"
                                        pattern="yyyy-MM-dd"/></td>
                    <td>${o.pm.price}</td>
                    <td>${o.amount}</td>
                    <td>${o.totalPay}</td>
                </tr>
            </s:iterator>
            <tr>
                <td>总金额：${total}</td>
            </tr>
        </table>
    </form>
</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>
