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
<title>添加物料信息</title>
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

<style type="text/css">
tr {
	text-align: center;
}

td {
	width: 150px;
}

#content {
	margin-left: 350px;
}
</style>

<script type="text/javascript">
	function confirm() {
		if ($('#materialId').val() == "请输入物料编号") {
			alert("请输入物料编号");
			return false;
		}
		if ($('#materialName').val() == "请输入物料名称") {
			alert("请输入物料名称");
			return false;
		}
		if ($('#materialType').val() == "请输入物料型号") {
			alert("请输入物料型号");
			return false;
		}

		if ($('#standard').val() == "请输入物料规格") {
			alert("请输入物料规格");
			return false;
		}
		if ($('#materialUnit').val() == "请输入物料计量单位") {
			alert("请输入物料计量单位");
			return false;
		}
		document.getElementById("addForm").submit();
	}
</script>
</head>
<body>
	<%@ include file="/page/share/menu.jsp"%>
	<div id="content">
		<form action="Material!addMaterial.action" method="post" id="addForm">
			<table align="center">
				<tr>
					<td colspan="2">
						<h3>添加物料信息</h3>
					</td>
				</tr>
				<tr>
					<td>物料编号</td>
					<td><input id="materialId" name="materialId" type="text"
						value="请输入物料编号" style="color:#d2d2d2"
						onclick="javascript:if(this.value=='请输入物料编号'){this.value='';} this.style.color='#646464';"
						onblur="javascript:if(this.value=='') {this.value='请输入物料编号'; this.style.color='#d2d2d2';}">
					</td>
				</tr>
				<tr>
					<td>物料名称</td>
					<td><input id="materialName" name="materialName" type="text"
						value="请输入物料名称" style="color:#d2d2d2"
						onclick="javascript:if(this.value=='请输入物料名称'){this.value='';} this.style.color='#646464';"
						onblur="javascript:if(this.value=='') {this.value='请输入物料名称'; this.style.color='#d2d2d2';}">
					</td>
				</tr>
				<tr>
					<td>物料型号</td>
					<td><input id="materialType" name="materialType" type="text"
						value="请输入物料型号" style="color:#d2d2d2"
						onclick="javascript:if(this.value=='请输入物料型号'){this.value='';} this.style.color='#646464';"
						onblur="javascript:if(this.value=='') {this.value='请输入物料型号'; this.style.color='#d2d2d2';}">
					</td>
				</tr>
				<tr>
					<td>物料规格</td>
					<td><input id="standard" name="standard" type="text"
						value="请输入物料规格" style="color:#d2d2d2"
						onclick="javascript:if(this.value=='请输入物料规格'){this.value='';} this.style.color='#646464';"
						onblur="javascript:if(this.value=='') {this.value='请输入物料规格'; this.style.color='#d2d2d2';}">
					</td>
				</tr>
				<tr>
					<td>物料计量单位</td>
					<td><input id="materialUnit" name="materialUnit" type="text"
						value="请输入物料计量单位" style="color:#d2d2d2"
						onclick="javascript:if(this.value=='请输入物料计量单位'){this.value='';} this.style.color='#646464';"
						onblur="javascript:if(this.value=='') {this.value='请输入物料计量单位'; this.style.color='#d2d2d2';}">
					</td>
				</tr>
				<tr>
					<td colspan="2"><input name="add" type="button" value="添加"
						onclick="confirm()"> <input name="reset" type="reset"
						value="重置"></td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="/page/share/footer.jsp"%>
</body>
</html>
