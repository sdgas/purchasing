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

    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

    <script type="text/javascript" src="<%=basePath%>js/addPlans.js"></script>

    <script type="text/javascript">
        $(function () {
            if (${person.position.positionId==4} || ${pr.status=='GM'}
                    || ${pr.status=='CANCEL'}) {
                $(".dis").css("display", "none");
            }
            if (${pr.status=='PR'}) {
                if (${person.position.positionId!=2}
                        || ${person.department.departmentId!=8}) {
                    $(".dis").css("display", "none");
                }
            }
            var test = "${person.remarks}".search("招标采购部");

            if (${pr.status=='HEAD'}) {
                if (test < 0 || ${person.position.positionId!=1}) {
                    $(".dis").css("display", "none");
                }
            }

            if (${pr.status=='LEADER'}) {
                if (${person.position.positionId!=6}) {
                    $(".dis").css("display", "none");
                }
            }
            if (${person.position.positionId==4}  &&
            ${person.remarks== "物料采购"} && ${pr.status=='GM'})
            {
                $('#subTr').css("display", "block");
                $('#bidding').attr("action", "#");
                $('#sub').val("申请采购");
            }
        });

        function commit() {
            $('#down').submit();
        }

        function fillMsg(b) {
            var myDate = new Date();
            var date = myDate.getFullYear() + "/" + (myDate.getMonth() + 1) + "/"
                    + myDate.getDate();

            if (b == "fault") {
                $('#comment').val("不同意 ${person.userName} " + date);
            }
            if (b == "pass") {
                $('#comment').val("同意 ${person.userName} " + date);
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

        .va {
            width: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="/page/share/menu.jsp" %>

<div id="content">
    <form action="FileDownload.action" method="post" id="down">
        <input type="hidden" name="prId" value="${pr.prId}">
        <table style="border: 2px;">
            <tr>
                <td colspan="6" style="width: 1500px;">
                    <h3 style="margin-left:0;text-align: center">物料请购单</h3>
                </td>
            </tr>

            <tr class="va">
                <td>请购单号：</td>
                <td>${pr.prId}</td>
                <td>申请项目：</td>
                <td>${pr.project}</td>
            </tr>

            <tr class="va">
                <td>CEA号：</td>
                <td>${pr.ceaNum}</td>
                <td>需求类型:</td>
                <td>${pr.demandType}</td>
            </tr>

            <tr class="va">
                <td>申请部门：</td>
                <td>${pr.department.departmentName}</td>
                <td>请购人：</td>
                <td>${pr.applyUser.userName}</td>
            </tr>

            <tr>
                <td>需求日期：</td>
                <td style="color: red;"><fmt:formatDate value="${pr.prDate}"
                                                        pattern="yyyy-MM-dd"/></td>
                <td>申请日期：</td>
                <td><fmt:formatDate value="${pr.applyDate}"
                                    pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>

            <tr class="va">
                <c:if test="${pr.attachment!=null}">
                    <td>附件：</td>
                    <td><a href="javascript:commit()">${pr.attachment}</a></td>
                </c:if>
            </tr>

            <tr class="va">
                <td>备注：</td>
                <td colspan="5" class="va">${pr.remarks}</td>
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

            <s:iterator value="purchaseMaterials" var="pm" status="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${pm.material.materialId}</td>
                    <td>${pm.material.materialName}</td>
                    <td>${pm.material.standard}</td>
                    <td>${pm.material.materialType}</td>
                    <td>${pm.material.materialUnit}</td>
                    <td>${pm.amount}</td>
                    <td>${pm.price}</td>
                    <td>${pm.totalPay}</td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </form>

    <form action="PurchaseRequisition!check.action" method="post"
          id="bidding">
        <table>
            <tr>
                <td>当前环节：</td>
                <td style="width: 500px"><c:if test="${pr.status == 'PR'}">
                    <span style="color: red">请购申请 --></span>
                    <span>招标采购部经理 -->分管领导 -->总经理 -->采购</span>
                </c:if> <c:if test="${pr.status == 'HEAD'}">
                    <span style="color: red">请购申请 -->招标采购部经理 --></span>
                    <span>分管领导 -->总经理 -->采购</span>
                </c:if> <c:if test="${pr.status == 'LEADER'}">
                    <span style="color: red">请购申请 -->招标采购部经理 -->分管领导 --></span>
                    <span>总经理 -->采购</span>
                </c:if> <c:if test="${pr.status == 'GM'}">
                    <span style="color: red">请购申请 -->招标采购部经理 -->分管领导 -->总经理 --></span>
                    <span>采购</span>
                </c:if> <c:if test="${pr.status == 'CANCEL'}">
                    <span style="color: red">请购申请 -->审核不通过</span>
                </c:if></td>
            </tr>
            <tr>
                <td>领导意见：</td>
                <td><span> ${pr.comment} </span></td>
            </tr>
            <tr class="dis">
                <td>审核意见：</td>
                <td>
                    <textarea rows="3" cols="3000" name="remarks"
                              style="width: 900px" id="comment"></textarea>
                </td>
            </tr>
            <tr class="dis">
                <td>
                    <input type="hidden" name="prId" value="${pr.prId}">
                    <input type="radio" name="status" value="true"
                           onchange="fillMsg('pass');">通过
                </td>
                <td>
                    <input type="radio" name="status" value="false"
                           onchange="fillMsg('fault');">不通过
                </td>
            </tr>
            <tr class="dis" id="subTr">
                <td colspan="3">
                    <input type="submit" name="tijiao" value="提交"
                           id="sub">
                </td>
            </tr>
        </table>
    </form>
</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>