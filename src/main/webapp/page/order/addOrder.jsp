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
<title>物料采购单</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content－Type" content="text/html;charset=UTF-8">
<meta http-equiv="window-target" content="_top">
<meta http-equiv="expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=8" />

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
<%--加载dwr--%>
<script src='<%=basePath%>dwr/util.js' type="text/javascript"></script>
<script src='<%=basePath%>dwr/engine.js' type="text/javascript"></script>
<script src='<%=basePath%>dwr/interface/orderService.js'
	type="text/javascript"></script>

<%--<script type="text/javascript">
        function checkUni(orderId){
            orderService.checkUniqo(orderId,${purchaseMaterials},getResult);
        }

        function getResult(c){
            if(!c)
            alert("同一个采购单编号不能对应不同供应商！");
        }
    </script>--%>

<style type="text/css">
#content {
	width: 1500px;
	margin: 10px auto 0;
}

#content h2 {
	background: none repeat scroll 0 0 #557bac;
	color: white;
	font-family: "微软雅黑";
	font-size: 16px;
	font-weight: normal;
	margin-bottom: 10px;
	margin-left: 2%;
	margin-top: 10px;
}

#content form table tr td {
	width: 150px;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/page/share/menu.jsp"%>

	<div id="content">
		<form action="Order!addOrder.action" method="post" id="down">
			<input type="hidden" name="prId" value="${pr.prId}">
			<table style="border: 2px;">
				<tr>
					<td colspan="6" style="width: 1500px;">
						<h3 style="margin-left:0;text-align: center">物料采购单</h3>
					</td>
				</tr>
				<tr>

					<td>需求日期：</td>
					<td style="color: red;"><fmt:formatDate value="${pr.prDate}"
							pattern="yyyy-MM-dd" /></td>
					<td>需求类型：</td>
					<td>${pr.demandType}</td>
				</tr>
				<tr>
					<td>申请项目：</td>
					<td>${pr.project}</td>
					<td>CEA号：</td>
					<td>${pr.ceaNum}</td>
				</tr>
				<tr>
					<td>申请部门：</td>
					<td>${pr.department.departmentName}</td>
					<td>申请人：</td>
					<td>${pr.applyUser.userName}</td>
				</tr>
				<tr>
					<c:if test="${pr.attachment !=null}">
						<td>附件：</td>
						<td><a href="FileDownload.action?prId=${pr.prId}">${pr.attachment}</a>
						</td>
					</c:if>
				</tr>
				<tr>
					<td>收货人：</td>
					<td><input name="consignee" type="text"></td>
					<td>联系电话：</td>
					<td><input name="contactPhone" type="text"></td>
				</tr>
				<tr>
					<td>收货地址：</td>
					<td><input name="deliveryAddress" type="text"></td>
				</tr>
			</table>

			<table id="mainTb">
				<tbody id="mainBody">
					<tr>
						<td>
							<h2>序号</h2>
						</td>
						<td>
							<h2>采购单编号</h2>
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
							<h2>请购数量</h2>
						</td>
						<td>
							<h2>采购数量</h2>
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
							<td><input type="text" name="orderId" style="width: 105px;"
								onchange="checkUni(this.value)"></td>
							<td>${pm.material.materialId} <input type="hidden"
								name="materialId" value="${pm.material.materialId}">
							</td>
							<td>${pm.material.materialName}</td>
							<td>${pm.material.standard}</td>
							<td>${pm.material.materialType}</td>
							<td>${pm.material.materialUnit}</td>
							<td>${pm.amount}</td>
							<td><input type="text" name="factNum" style="width: 55px;">
							</td>
							<td>${pm.supplier.supplierName}</td>
							<td>${pm.price}</td>
							<td>${pm.totalPay}</td>
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
	<%@include file="/page/share/footer.jsp"%>
</body>
</html>
