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
    <title>物料请购单</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content－Type" content="text/html;charset=UTF-8">
    <meta http-equiv="window-target" content="_top">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>

    <link rel="stylesheet" href="<%=basePath%>css/base2.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script src='<%=basePath%>dwr/util.js' type="text/javascript"></script>
    <script src='<%=basePath%>dwr/engine.js' type="text/javascript"></script>
    <script src='<%=basePath%>dwr/interface/supplierService.js'
            type="text/javascript"></script>

    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

    <%--自动补全/模糊搜索--%>
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>js/jquery.autocomplete.js"></script>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>css/jquery.autocomplete.css"/>

    <script type="text/javascript">
        $(function () {
            supplier = [];
            supplierService.findAllSupplier(getSupplier);
        });

        function getSupplier(suppliers) {
            //组装json数据源对象objects
            for (var i = 0; i < suppliers.length; i++) {
                supplier[i] = suppliers[i].supplierName;
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
    </style>
</head>
<body>
<%@ include file="/page/share/menu.jsp" %>

<div id="content">
    <form action="PurchaseRequisition!addPR.action" method="post"
          id="down">
        <input type="hidden" name="dpId" value="${demandPlans.dpId}">
        <table style="border: 2px;">
            <tr>
                <td colspan="6" style="width: 1500px;">
                    <h3 style="margin-left:0;text-align: center">物料需求计划</h3>
                </td>
            </tr>
            <tr>
                <td>请购单号:</td>
                <td><input type="text" name="prId"></td>
                <td>需求日期：</td>
                <td style="color: red;"><fmt:formatDate
                        value="${demandPlans.demandDate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <td>申请项目：</td>
                <td>${demandPlans.project}</td>
                <td>CEA号：</td>
                <td>${demandPlans.ceaNum}</td>
            </tr>
            <tr>
                <td>申请部门：</td>
                <td>${demandPlans.department.departmentName}</td>
                <td>申请人：</td>
                <td>${demandPlans.demandUser.userName}</td>
            </tr>
            <tr>
                <c:if test="${demandPlans.attachment !=null}">
                    <td>附件：</td>
                    <td><a href="FileDownload.action?dpId=${demandPlans.dpId}">${demandPlans.attachment}</a>
                    </td>
                </c:if>
                <td>需求类型：</td>
                <td>${demandPlans.demandType}</td>
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
                    <h2>供应商</h2>
                </td>
                <td>
                    <h2>单价</h2>
                </td>
                <td>
                    <h2>总价</h2>
                </td>
            </tr>
            <s:iterator value="purchaseMaterials" var="pm" status="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${pm.material.materialId} <input type="hidden"
                                                         name="materialId" value="${pm.material.materialId}">
                    </td>
                    <td>${pm.material.materialName}</td>
                    <td>${pm.material.standard}</td>
                    <td>${pm.material.materialType}</td>
                    <td>${pm.material.materialUnit}</td>
                    <td>${pm.amount}</td>
                    <td><input type="text" name="supplier" class="search"
                               onclick="findAuto()"></td>
                    <td><input type="text" name="price" id="price${s.count}"
                               onchange="calculator(${pm.amount},this.value,${s.count})"
                               style="width: 100px;"></td>
                    <td><input type="text" id="t${s.count}" readonly="readonly"
                               style="width: 100px;"></td>
                </tr>
            </s:iterator>

            <tr>
                <td>备注:</td>
                <td colspan="8"><textarea rows="5" cols="3"
                                          style="width: 1000px;" name="remarks"></textarea></td>
            </tr>
            <tr>
                <td><input type="submit" value="申请"></td>
                <td><input type="reset" value="重置"></td>
            </tr>

            </tbody>
        </table>
    </form>
</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>
