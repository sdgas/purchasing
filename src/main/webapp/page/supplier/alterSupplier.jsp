<%--
  Created by IntelliJ IDEA.
  User: 120378
  Date: 2014/7/25
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
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
<title>修改供应商信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content－Type" content="text/html;charset=UTF-8">
<meta http-equiv="window-target" content="_top">
<meta http-equiv="expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=8" />

<link rel="stylesheet" href="<%=basePath%>css/base2.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="<%=basePath%>js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
</head>
<body>
	<%@ include file="/page/share/menu.jsp"%>
	<div id="content">
		<form method="post" action="Supplier!alterSupplier.action"
			align="center" id="myform">
			<input type="hidden" name="page" value="1" id="page" />

			<table style="font-family: '微软雅黑',serif;text-align: center">
				<tr>
					<td>供应商编号</td>
					<td><input type="text" name="supplierId" readonly="readonly"
						value="${supplier.supplierId}"></td>
				</tr>
				<tr>
					<td>供应商名称</td>
					<td><input type="text" value="${supplier.supplierName}"
						name="supplierName"></td>
				</tr>
				<tr>
					<td>供应商联系人</td>
					<td><input type="text" value="${supplier.contacts}"
						name="contacts"></td>
				</tr>
				<tr>
					<td>供应商联系电话</td>
					<td><input type="text" value="${supplier.phone}" name="phone">
					</td>
				</tr>
				<tr>
					<td>供应商传真号码</td>
					<td><input type="text" value="${supplier.fax}" name="fax">
					</td>
				</tr>
				<tr>
					<td>供应商联系地址</td>
					<td><input type="text" value="${supplier.address}"
						name="address"></td>
				</tr>
				<tr>
					<td>供应商评价</td>
					<td><textarea name="evaluation" cols="45" rows="5">${supplier.evaluation}</textarea>
					</td>
				</tr>
				<tr>
					<td>供应商情况</td>
					<td><c:if test="${supplier.enableUse == true}">
							<input type="radio" name="enableUser" value="true"
								checked="checked">正常
                        <input type="radio" name="enableUser"
								value="false">停止使用
                    </c:if> <c:if test="${supplier.enableUse == false}">
							<input type="radio" name="enableUser" value="true">正常
                        <input type="radio" name="enableUser"
								value="false" checked="checked">停止使用
                    </c:if></td>
				</tr>
				<tr>
					<td><input type="submit" value="修改"> <input
						type="reset" value="重置"></td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="/page/share/footer.jsp"%>
</body>
</html>
