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
    <title>物料需求计划申请</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content－Type" content="text/html;charset=UTF-8">
    <meta http-equiv="window-target" content="_top">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>

    <link rel="stylesheet" href="<%=basePath%>css/base2.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>

    <%--加载dwr--%>
    <script src='<%=basePath%>dwr/util.js' type="text/javascript"></script>
    <script src='<%=basePath%>dwr/engine.js' type="text/javascript"></script>
    <script src='<%=basePath%>dwr/interface/departmentService.js'
            type="text/javascript"></script>
    <script src='<%=basePath%>dwr/interface/materialService.js'
            type="text/javascript"></script>

    <script type="text/javascript" src="<%=basePath%>js/addPlans.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
    <%--自动补全/模糊搜索--%>
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>js/jquery.autocomplete.js"></script>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>css/jquery.autocomplete.css"/>

    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            objects = [];
            num = 2;
            var delbutton = document.getElementById("delete");
            // 初始“删除”按钮不可用
            delbutton.disabled = true;
            //获取数据源
            materialService.findAll(getAllMaterial);
            departmentService.findAllDepartment(getResult);
            search();
        });
    </script>

    <style type="text/css">
        #content {
            width: 1500px;
            margin: 10px auto 0;
        }
    </style>
</head>
<body>
<%@ include file="/page/share/menu.jsp" %>
<div id="content">
    <form action="PurchaceMaterial.action" method="post"
          onsubmit="return checkReq();" enctype="multipart/form-data">
        <table>
            <tr>
                <td style="margin-top: 0">
                    <span class="glyphicon glyphicon-home"></span>主页
                </td>
            </tr>
            <tr>
                <td colspan="6" style="width: 1500px;">
                    <h3 style="margin-left:0;text-align: center">物料需求计划</h3>
                </td>
            </tr>

            <tr align="center">
                <td>申请项目：</td>
                <td colspan="2">
                    <input type="text" name="project" id="project">
                </td>
                <td>CEA号：</td>
                <td colspan="2">
                    <input type="text" name="ceaNum">
                </td>
            </tr>
            <tr align="center">
                <td>申请部门：</td>
                <td colspan="2">
                    <select name="departmentId" id="dep" style="font-family: '微软雅黑';font-size: 16px;"></select>
                </td>
                <td>需求日期：</td>
                <td colspan="2">
                    <input type="text" name="demandDate" id="demandDate" class="Wdate"
                           onfocus="WdatePicker({skin:'whyGreen',minDate: '%y-%M-%d'})"/>
                </td>
            </tr>
            <tr align="center">
                <td>附件：</td>
                <td>
                    <input type="file" name="attachment" onchange="verifyFileName()">
                    <input type="hidden" name="fileName"/>
                </td>
                <td>需求类型：</td>
                <td>
                    <select name="demandType" id="demandType" style="font-family: '微软雅黑';font-size: 16px;">
                        <option value="">-----请选择-----</option>
                        <option value="市政类工程">市政类工程</option>
                        <option value="工商小区工程">工商小区工程</option>
                        <option value="其它类">其它类</option>
                    </select>
                </td>
            </tr>
            <tr align="center">
                <td>备注：</td>
                <td colspan="5">
                    <textarea rows="3" cols="3000" name="remarks" style="width: 900px"></textarea>
                </td>
            </tr>
        </table>

        <table id="mainTb">
            <tbody id="mainBody">
            <tr>
                <th></th>
                <th>存货编号</th>
                <th>存货名称</th>
                <th>规格</th>
                <th>型号</th>
                <th>单位</th>
                <th>数量</th>
            </tr>
            <tr>
                <td>
                    <input type="Checkbox" name="checkbox"
                           onclick="checkBoxSel()" align="middle">
                </td>
                <td>
                    <input name="materialIds" type="text" class="search"
                           onclick="search()" id="materialId0"
                           ondblclick="findMaterial(this.id)"/>
                </td>
                <td>
                    <input type="text" readonly="readonly" id="materialName0"/>
                </td>
                <td>
                    <input type="text" readonly="readonly" id="standard0"/>
                </td>
                <td>
                    <input type="text" readonly="readonly" id="materialType0"/>
                </td>
                <td>
                    <input type="text" readonly="readonly" id="materialUnit0"/>
                </td>
                <td>
                    <input name="amount" type="text"
                           onchange="check(this.id)" id="amount0"/></td>
            </tr>
            <tr>
                <td>
                    <input type="Checkbox" name="checkbox"
                           onclick="checkBoxSel()" align="middle"></td>
                <td>
                    <input name="materialIds" type="text"
                           ondblclick="findMaterial(this.id)" class="search"
                           onclick="search()" id="materialId1"/></td>
                <td>
                    <input type="text" readonly="readonly" id="materialName1"/>
                </td>
                <td>
                    <input type="text" readonly="readonly" id="standard1"/>
                </td>
                <td>
                    <input type="text" readonly="readonly" id="materialType1"/>
                </td>
                <td>
                    <input type="text" readonly="readonly" id="materialUnit1"/>
                </td>
                <td>
                    <input name="amount" type="text" onchange="check(this.id)" id="amount1"/>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td colspan="3" align="right">
                    <input name="tj" type="submit" value="提交">
                </td>
                <td colspan="3">
                    <input name="cz" type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
    <table>
        <tr>
            <td>
                <button onclick="addRow()">新增</button>
                <button onclick="deleteRow()" id="delete">删除</button>
            </td>
        </tr>
    </table>
</div>
<%@include file="/page/share/footer.jsp" %>
</body>
</html>
