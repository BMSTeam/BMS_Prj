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
#tbEmployee th
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
.col-centered
{
    float: none;
    margin: 0 auto;
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

<div class="container-fluid">
	<div class="row">
	
		<div class="col-lg-6 col-centered">
		
			<br>
			
			<form id="frmSearch">
			<table class="table table-condensed font-12px borderless">
				<tr>
					<td class="td-middle">User :</td>
					<td><input type="text" id="txtEmployeeUser" class="form-control input-sm"></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
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
			</form>
			
			<table class="table table-condensed font-12px borderless">
				<tr>
					<td style="text-align:center;">
						<button type="button" class="btn btn-primary btn-sm" onclick="SearchEmployee();">Search</button>
						<button type="reset" class="btn btn-default btn-sm" onclick="ClearData()">Clear</button>
					</td>
				</tr>
			</table>
			
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-8 col-centered">
			
			<table class="table table-condensed font-12px borderless">
				<tr>
					<td>
						<button type="button" class="btn btn-default btn-sm" onclick="actionPage('${context}/Employee/AddEmployee/Form');">
							Add Employee
						</button>
					</td>
				</tr>
			</table>
			
			<table id="tbEmployee" class="table table-bordered table-condensed table-hover font-12px">
				<thead>
					<tr>
						<th class="text-center">No</th>
						<th class="text-center">User</th>
						<th class="text-center">First Name</th>
						<th class="text-center">Last Name</th>
						<th class="text-center">Nick Name</th>
						<th class="text-center">Employee Type</th>
						<th class="text-center">Remark</th>
						<th class="text-center">Edit</th>
						<th class="text-center">Delete</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="9" class='text-center'>No data</td>
					</tr>
				</tbody>
			</table>
			
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

<div class="modal" id="confirmDeleteEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteCustomerModal" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Delete Confirm</h4>
			</div>
			<div class="modal-body">
				
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-4 control-label">User :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-Username"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">First Name :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-FirstName"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Last Name :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-LastName"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Nick Name :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-Nickname"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Employee Type :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-EmployeeType"></label>
						</div>
					</div>
				</form>
				
			</div>
			<div class="modal-footer">
				<input type="hidden" id="h_delete_employee" value=""/>
				<button type="button" class="btn btn-primary btn-delete-confirm-yes" data-dismiss="modal">Yes</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
			</div>
		</div>
	</div>
</div>

<script src="${context}/frameworklib/others/jquery.min.js"></script>
<script src="${context}/frameworklib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

var arr_employee = [];
var arr_employeeTypes = [];

var actionPage = function(url) {
	window.location = url;
}

var logout = function(){
	$.get( "${context}/Logout" ).done(
		function(){
			window.location = "${context}";
		}
	);
};

$(function(){

	$("#txtEmployeeUser").focus();

	$.get( "${context}/Employee/GetEmployeeTypes", function( data ) {
	
		arr_employeeTypes = [];
		
		if(data["response"]=="success") {
			$.each(data["message"]["employeeTypes"], function(indx,item){
			
				$("#selEmployeeType").append($("<option>").val(item["typeId"]).text(item["typeName"]));
				
				arr_employeeTypes.push({ typeId : item["typeId"], typeName : item["typeName"] });
			});
		}
	});
	
	SearchEmployee();

});

$("#frmSearch input").keypress(function (e) {
    if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
        SearchEmployee();
        return false;
    } else {
        return true;
    }
});

var ClearData = function() {
	$("#txtEmployeeUser").val("");
	$("#txtEmployeeFirstName").val("");
	$("#txtEmployeeLastName").val("");
	$("#txtEmployeeNickName").val("");
	$("#selEmployeeType").val("");
	$("#txtEmployeeRemark").val("");
	$("#tbEmployee").find('tbody').empty();
	$("#tbEmployee").find('tbody').append($("<tr>").append($("<td colspan='9' class='text-center'>").text("No data")));
	arr_employee = [];
}

var SearchEmployee = function(){
	
	var bgOverlay = $("#bgOverlay");
	var loadingImg = $("#loadingImg");
	var tbEmployee = $("#tbEmployee").find('tbody');
	
	var param = {};
	param.userName = $("#txtEmployeeUser").val();
	param.firstName = $("#txtEmployeeFirstName").val();
	param.lastName = $("#txtEmployeeLastName").val();
	param.nickName = $("#txtEmployeeNickName").val();
	param.employeeType = $("#selEmployeeType").val();
	param.remark = $("#txtEmployeeRemark").val();
	
	$.ajax({
		method: "POST",
		url: "${context}/Employee/SearchEmployee",
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
		
			if(data["response"]=="success") {
			
				var item = data["message"];
				
				tbEmployee.empty();
				arr_employee = [];
				
				$.each(item["employees"], function(indx, item){
				
					var empType = $.grep(arr_employeeTypes, function(obj) {
						return obj.typeId == item["empTypeId"];
					});
					
					tbEmployee.append(
						$("<tr>")
							.append($("<td class='text-center fit'>").text(indx+1))
							.append($("<td class='fit'>").text(item["userName"]))
							.append($("<td class='fit'>").text(item["empFirtsName"]))
							.append($("<td class='fit'>").text(item["empLastName"]))
							.append($("<td class='fit'>").text(item["empNickName"]))
							.append($("<td class='fit'>").text(empType[0]["typeName"]))
							.append($("<td class='fit'>").text(item["empRemark"]))
							.append($("<td class='text-center fit'>")
								.html(
									$('<a href="javascript:void(0);">')
										.attr('class','text-danger')
										.attr('onclick','EditEmployee("'+item["empId"]+'")')
										.text('Edit')
								)
							)
							.append($("<td class='text-center fit'>")
								.html(
									$('<a href="javascript:void(0);">')
										.attr('class','text-danger')
										.attr('onclick','ConfirmDeleteEmployee("'+item["empId"]+'")')
										.text('Delete')
								)
							)
					);
					
					arr_employee.push(item);
					
				});
				
				if($.isEmptyObject(item["employees"])) {
					tbEmployee.append($("<tr>").append($("<td colspan='9' class='text-center'>").text("No data")));
				}
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

var EditEmployee = function(empId) {
	
	var _tmp = $.grep(arr_employee, function(obj) {
		return obj.empId == empId;
	});
	
	var param = {};
	param.empId = _tmp[0]["empId"];
	param.userName = _tmp[0]["userName"];
	param.firstName = _tmp[0]["empFirtsName"];
	param.lastName = _tmp[0]["empLastName"];
	param.nickName = _tmp[0]["empNickName"];
	param.remark = _tmp[0]["empRemark"];
	param.employeeType = _tmp[0]["empTypeId"];
	
	var form = $('<form>');
	form.attr('action','${context}/Employee/EditEmployee/Form');
	form.attr('method','post');
	
	form.html($('<input type="hidden" name="editEmployee">').val(JSON.stringify(param)));
	form.appendTo('body');
	form.submit();
};

var ConfirmDeleteEmployee = function(empId) {
	
	var _tmp = $.grep(arr_employee, function(obj) {
		return obj.empId == empId;
	});
	
	$('#lblConfirm-Username').text(_tmp[0]["userName"]);
	$('#lblConfirm-FirstName').text(_tmp[0]["empFirtsName"]);
	$('#lblConfirm-LastName').text(_tmp[0]["empLastName"]);
	$('#lblConfirm-Nickname').text(_tmp[0]["empNickName"]);
	
	var empType = $.grep(arr_employeeTypes, function(obj) {
		return obj.typeId == _tmp[0]["empTypeId"];
	});
	$('#lblConfirm-EmployeeType').text(empType[0]["typeName"]);
	
	$('#h_delete_employee').val(_tmp[0]["empId"]);
	
	$("#confirmDeleteEmployeeModal").modal('toggle');
};

$(".btn-delete-confirm-yes").on('click', function(){
	deleteEmployee($("#h_delete_employee").val());
});

var deleteEmployee = function(empId) {
	
	var bgOverlay = $("#bgOverlay");
	var loadingImg = $("#loadingImg");
	
	$.ajax({
		method: "POST",
		url: '${context}/Employee/DeleteEmployee',
		cache: false,
		data: { empId : empId },
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

</script>

</body>
</html>