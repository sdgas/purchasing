<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/page/share/taglib.jsp"%>
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
<title>物料需求计划申请单</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content－Type" content="text/html;charset=UTF-8">
<meta http-equiv="window-target" content="_top">
<meta http-equiv="expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=8" />

<link rel="stylesheet" href="<%=basePath%>css/base2.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>

<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=basePath%>js/addPlans.js"></script>

<script type="text/javascript">
	$(function() {
		if (${person.position.positionId==4} || ${demandPlans.status=='LEADER'}
				|| ${demandPlans.status=='CANCEL'}) {
			$(".dis").css("display", "none");
		}
		if (${demandPlans.status=='HEAD'}) {
			if (${person.position.positionId!=1}) {
				$(".dis").css("display", "none");
			}
		}
		if (${demandPlans.status=='APPLY'}) {
			if (${person.position.positionId!=2}) {
				$(".dis").css("display", "none");
			}
		}
		if (${person.position.positionId==4} && ${person.remarks=='物料采购'}) {
			$('#subTr').css("display", "block");
			$('#bidding').attr("action", "PurchaseRequisition.action");
			$('#sub').val("请购");
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
	<%@ include file="/page/share/menu.jsp"%>

	<div id="content">
		<form action="FileDownload.action" method="post" id="down">
			<input type="hidden" name="dpId" value="${demandPlans.dpId}">
			<table style="border: 2px;">
				<tr>
					<td colspan="6" style="width: 1500px;">
						<h3 style="margin-left:0;text-align: center">物料需求计划</h3>
					</td>
				</tr>

				<tr class="va">
					<td>申请项目：</td>
					<td>${demandPlans.project}</td>
					<td>CEA号：</td>
					<td>${demandPlans.ceaNum}</td>
				</tr>
				<tr class="va">
					<td>申请部门：</td>
					<td>${demandPlans.department.departmentName}</td>
					<td>申请人：</td>
					<td>${demandPlans.demandUser.userName}</td>
				</tr>
				<tr>
					<td>需求日期：</td>
					<td style="color: red;"><fmt:formatDate
							value="${demandPlans.demandDate}" pattern="yyyy-MM-dd" /></td>
					<td>申请日期：</td>
					<td><fmt:formatDate value="${demandPlans.applyDate}"
							pattern="yyyy-MM-dd HH:mm" /></td>
				</tr>
				<tr class="va">
					<c:if test="${demandPlans.attachment!=null}">
						<td>附件：</td>
						<td><a href="javascript:commit()">${demandPlans.attachment}</a>
						</td>
					</c:if>
					<td>需求类型:</td>
					<td>${demandPlans.demandType}</td>
				</tr>
				<tr class="va">
					<td>备注：</td>
					<td colspan="5" class="va">${demandPlans.remarks}</td>
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
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</form>

		<form action="DemandPlans!check.action" method="post" id="bidding">
			<table>
				<tr>
					<td>当前环节：</td>
					<td style="width: 500px"><c:if
							test="${demandPlans.status == 'APPLY'}">
							<span style="color: red">申请 --></span>
							<span>部门经理 -->分管领导 -->招标请购</span>
						</c:if> <c:if test="${demandPlans.status == 'HEAD'}">
							<span style="color: red">申请 -->部门经理 --></span>
							<span>分管领导 -->招标请购</span>
						</c:if> <c:if test="${demandPlans.status == 'LEADER'}">
							<span style="color: red">申请 -->部门经理 -->分管领导 --></span>
							<span>招标请购</span>
						</c:if> <c:if test="${demandPlans.status == 'CANCEL'}">
							<span style="color: red">申请 -->需求计划不通过审核</span>
						</c:if></td>
				</tr>
				<tr>
					<td>领导意见：</td>
					<td><span> ${demandPlans.comment} </span></td>
				</tr>
				<tr class="dis">
					<td>审核意见：</td>
					<td><textarea rows="3" cols="3000" name="remarks"
							style="width: 900px" id="comment"></textarea></td>
				</tr>
				<tr class="dis">
					<td><input type="hidden" name="dpId"
						value="${demandPlans.dpId}"> <input type="radio"
						name="status" value="true" onchange="fillMsg('pass')">通过</td>
					<td><input type="radio" name="status" value="false"
						onchange="fillMsg('fault')">不通过</td>
				</tr>
				<tr class="dis" id="subTr">
					<td colspan="3"><input type="submit" name="tijiao" value="提交"
						id="sub"></td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="/page/share/footer.jsp"%>
</body>
</html>
