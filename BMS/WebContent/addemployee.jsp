<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=8,IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Employee</title>

<c:set var="context" value="${pageContext.request.contextPath}" />

<link href="${context}/frameworklib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--[if lt IE 9]>
	<script src="${context}/frameworklib/others/html5shiv.min.js"></script>
	<script src="${context}/frameworklib/others/respond.min.js"></script>
<![endif]-->

<style type="text/css">
body
{
	height: 100%;
	padding-top: 50px;
	padding-bottom: 50px;
}
textarea
{
	resize: none;
}
.container-table
{
    display: table;
}
.vertical-center-row
{
    display: table-cell;
    vertical-align: middle;
}
.font-12px
{
	font-size: 12px;
}
.borderless td, .borderless th
{
    border: none !important;
}
.table tbody > tr > td.td-middle
{
    vertical-align: middle;
}
#tbBank th
{
	background-color: #04063A;
	color: white;
	text-align: center;
}
#bgOverlay
{
	position:fixed;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:9999;
	opacity:0.5;
	background:#000000;
	display:none;
}
#loadingImg
{
	position:fixed;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:9999;
	background:url('${context}/assets/img/loading.gif') 50% 50% no-repeat;
	background-size:100px 100px;
	display:none;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button
{ 
	-webkit-appearance: none;
	margin: 0; 
}
</style>

</head>
<body>

<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
			<a href="${context}" class="navbar-brand">Main</a>
          	<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
          	</button>
        </div>
        <div id="navbar-main" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="bms-customer-menu">Customer<span class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="bms-customer-menu">
						<li><a href="javascript:void(0);" onclick="actionPage('${context}/Customer/Manage/Form');">Manage</a></li>
                		<li class="divider"></li>
                		<li><a href="javascript:void(0);" onclick="actionPage('${context}/Customer/AddCustomer/Form');">Add New</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="bms-employee-menu">Employee<span class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="bms-employee-menu">
						<li><a href="javascript:void(0);" onclick="actionPage('${context}/Employee/Manage/Form');">Manage</a></li>
                		<li class="divider"></li>
                		<li><a href="javascript:void(0);" onclick="actionPage('${context}/Employee/AddEmployee/Form');">Add New</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:void(0);"><c:out value="${username}"/></a></li>
				<li><a href="javascript:void(0);" onclick="logout();">Log out</a></li>
			</ul>
        </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
</nav><!-- /.navbar -->

<div class="container-fluid container-table">
	<div class="row vertical-center-row">
	
		<div class="col-sm-12">
		
			<br>
			
			<table class="table table-condensed font-12px borderless">
				<tr>
					<td class="td-middle">User :</td>
					<td><input type="text" id="txtEmployeeUser" class="form-control input-sm"></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="td-middle">Password :</td>
					<td><input type="password" id="txtEmployeePassword" class="form-control input-sm"></td>
					<td class="td-middle">Retype Password :</td>
					<td><input type="password" id="txtEmployeeRetypePassword" class="form-control input-sm"></td>
				</tr>
				<tr>
					<td class="td-middle">First Name :</td>
					<td><input type="text" id="txtEmployeeFirstName" class="form-control input-sm"></td>
					<td class="td-middle">Last Name :</td>
					<td><input type="text" id="txtEmployeeLastName" class="form-control input-sm"></td>
				</tr>
				<tr>
					<td class="td-middle">Nick Name :</td>
					<td><input type="text" id="txtEmployeeNickName" class="form-control input-sm"></td>
					<td class="td-middle">Employee Type :</td>
					<td>
						<select id="selEmployeeType" class="form-control input-sm">
							<option value="">Select Type</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td-middle">Remark :</td>
					<td colspan="3"><textarea id="txtEmployeeRemark" class="form-control input-sm" rows="2"></textarea></td>
				</tr>
			</table>
			
			<button type="button" class="btn btn-primary btn-sm" onclick="PrepareSave();">Save</button>
			<button type="reset" id="btnReset" class="btn btn-default btn-sm" onclick="ClearData()">Clear</button>
		
		</div>
		
	</div>
	
</div>

<div id="bgOverlay"></div>
<div id="loadingImg"></div>

<div class="modal" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModal" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Modal title</h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModal" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Confirm</h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<input type="hidden" id="h_employeeInfo" value=""/>
				<button type="button" id="btn-confirm-yes" class="btn btn-primary" data-dismiss="modal">Yes</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
			</div>
		</div>
	</div>
</div>

<script src="${context}/frameworklib/others/jquery.min.js"></script>
<script src="${context}/frameworklib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

var obj_employee = {};

var logout = function(){
	$.get( "${context}/Logout" ).done(
		function(){
			window.location = "${context}";
		}
	);
};

var actionPage = function(url) {
	window.location = url;
}

var GetTypeSelect = function(type) {

	if(type!="") {
	
		$.get( "${context}/Employee/GetEmployeeTypes", function( data ) {
			
			if(data["response"]=="success") {
				$.each(data["message"]["employeeTypes"], function(indx,item){
					if(item["typeId"]==obj_employee.employeeType) {
						$("#selEmployeeType").append($("<option>").val(item["typeId"]).attr('selected','selected').text(item["typeName"]));
					} else {
						$("#selEmployeeType").append($("<option>").val(item["typeId"]).text(item["typeName"]));
					}
					
				});
			}
		});
		
	} else {
	
		$.get( "${context}/Employee/GetEmployeeTypes", function( data ) {
			
			if(data["response"]=="success") {
				$.each(data["message"]["employeeTypes"], function(indx,item){
					$("#selEmployeeType").append($("<option>").val(item["typeId"]).text(item["typeName"]));
				});
			}
		});
	}
}

$(function(){

	$("#txtEmployeeUser").focus();
	
	var EditEmployee = '${editEmployee}';
	if(EditEmployee != "") {
	
		var employee = JSON.parse(EditEmployee);
		
		obj_employee.empId = employee.empId;
		obj_employee.userName = employee.userName;
		obj_employee.firstName = employee.firstName;
		obj_employee.lastName = employee.lastName;
		obj_employee.nickName = employee.nickName;
		obj_employee.employeeType = employee.employeeType;
		obj_employee.remark = employee.remark;
		
		$("#txtEmployeePassword").closest("tr").remove();
		
		$("#txtEmployeeUser").attr('readonly',true).val(obj_employee.userName);
		$("#txtEmployeeFirstName").val(obj_employee.firstName);
		$("#txtEmployeeLastName").val(obj_employee.lastName);
		$("#txtEmployeeNickName").val(obj_employee.nickName);
		$("#txtEmployeeRemark").val(obj_employee.remark);
		
		GetTypeSelect(obj_employee.employeeType);
		
		$('#btn-confirm-yes').attr('onclick',"ClickSave('edit')");
		$('#btnReset').attr('onclick',"actionPage('${context}/Employee/Manage/Form')").text('Cancel');
		
	} else {
		GetTypeSelect("");
		$('#btn-confirm-yes').attr('onclick',"ClickSave('add')");
	}
	
});

var ClearData = function() {
	$("#txtEmployeeUser").val("");
	$("#txtEmployeePassword").val("");
	$("#txtEmployeeRetypePassword").val("");
	$("#txtEmployeeFirstName").val("");
	$("#txtEmployeeLastName").val("");
	$("#txtEmployeeNickName").val("");
	$("#selEmployeeType").val("");
	$("#txtEmployeeRemark").val("");
}

var PrepareSave = function() {
	
	var userName = $("#txtEmployeeUser").val();
	var password = $("#txtEmployeePassword").val();
	var retypePassword = $("#txtEmployeeRetypePassword").val();
	var firstName = $("#txtEmployeeFirstName").val();
	var lastName = $("#txtEmployeeLastName").val();
	var nickName = $("#txtEmployeeNickName").val();
	var employeeType = $("#selEmployeeType").val();
	var remark = $("#txtEmployeeRemark").val();
	
	if(userName=='' || password=='' || retypePassword=='' ||
		firstName=='' || lastName=='' || nickName=='' || employeeType=='') {
		var modal = $("#messageModal");
			modal.find(".modal-title").html("Warning");
			modal.find(".modal-body").html("Please complete your infomation.");
			modal.modal('toggle');
		return;
	}
	
	if(password != retypePassword ) {
		var modal = $("#messageModal");
			modal.find(".modal-title").html("Warning");
			modal.find(".modal-body").html("Password and Retype Password are not match, please retype again.");
			modal.modal('toggle');
		return;
	}

	obj_employee.userName = userName;
	obj_employee.password = password;
	obj_employee.firstName = firstName;
	obj_employee.lastName = lastName;
	obj_employee.nickName = nickName;
	obj_employee.employeeType = employeeType;
	obj_employee.remark = remark;
	
	$("#h_employeeInfo").val(JSON.stringify(obj_employee));
	
	var modal = $("#confirmModal");
	modal.find(".modal-body").html("Are you sure to add this employee?");
	modal.modal('toggle');
}

var saveEmployee = function(param, action){
	
	var bgOverlay = $("#bgOverlay");
	var loadingImg = $("#loadingImg");
	
	var _url = '';
	
	if(action=="add") {
		_url = '${context}/Employee/AddEmployee/Add';
	} else if(action=="edit") {
		_url = '${context}/Employee/EditEmployee/Edit';
	}
	
	$.ajax({
		method: "POST",
		url: _url,
		cache: false,
		data: param,
		dataType: "json",
		beforeSend: function() {
			bgOverlay.show();
			loadingImg.show();
		},
		complete: function() {
			bgOverlay.hide();
			loadingImg.hide();
		},
		success: function(data) {
		
			var modal = $("#messageModal");
			
			if(data["response"]=="success") {
				
				modal.find(".modal-title").html("Message");
				modal.find(".modal-body").html(data["message"]);
				modal.find(".modal-footer").find("button").attr('onclick',"actionPage('${context}/Employee/Manage/Form')");
				modal.modal('toggle');
				
			} else {
			
				modal.find(".modal-title").html("Message");
				modal.find(".modal-body").html(data["message"]);
				modal.modal('toggle');
			}
		},
		error: function(jqXHR,textStatus,errorThrown) {
			
			ClearData();
			
			var modal = $("#messageModal");
			modal.find(".modal-title").html("Error");
			modal.find(".modal-body").html(jqXHR.responseText);
			modal.modal('toggle');
		}
	});
};

var ClickSave = function(action) {
	saveEmployee($("#h_employeeInfo").val(), action);
};

</script>
</body>
</html>