<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=8,IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Customer</title>

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
					<td><input type="text" id="txtCustomerUser" class="form-control input-sm"></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="td-middle">First Name :</td>
					<td><input type="text" id="txtCustomerFirstName" class="form-control input-sm"></td>
					<td class="td-middle">Last Name :</td>
					<td><input type="text" id="txtCustomerLastName" class="form-control input-sm"></td>
				</tr>
				<tr>
					<td class="td-middle">Tel :</td>
					<td><input type="number" id="txtCustomerTel" class="form-control input-sm"></td>
					<td class="td-middle">From Web :</td>
					<td>
						<select id="selCustomerFromWeb" class="form-control input-sm">
							<option value="">Select Web</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td-middle">Remark :</td>
					<td colspan="3"><textarea id="txtCustomerRemark" class="form-control input-sm" rows="2"></textarea></td>
				</tr>
			</table>
			
			<hr>
		
			<table class="table table-condensed font-12px borderless">
				<tr>
					<td class="td-middle">Bank :</td>
					<td>
						<select id="selBanks" class="form-control input-sm" style="width:160px;">
							<option value="">Select Bank</option>
						</select>
					</td>
					<td class="td-middle">Acc No :</td>
					<td><input type="number" id="txtBankAccNo" class="form-control input-sm"></td>
					<td>
						<button type="button" class="btn btn-default btn-sm" onclick="addBank();">Add Bank</button>
					</td>
				</tr>
			</table>
			
			<table id="tbBank" class="table table-bordered table-condensed font-12px">
				<thead>
					<tr>
						<th class="text-center">No</th>
						<th class="text-center">Bank Code</th>
						<th class="text-center">Bank Name</th>
						<th class="text-center">Acc No.</th>
						<th class="text-center">Delete</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="5" class='text-center'>No data</td>
					</tr>
				</tbody>
			</table>
			
			<button type="button" class="btn btn-primary btn-sm" onclick="prepareSaveCustomer();">Save</button>
			<button type="reset" id="btnReset" class="btn btn-default btn-sm" onclick="clearData()">Clear</button>
		
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
				<input type="hidden" id="h_customerInfo" value=""/>
				<button type="button" id="btn-confirm-yes" class="btn btn-primary" data-dismiss="modal">Yes</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
			</div>
		</div>
	</div>
</div>

<script src="${context}/frameworklib/others/jquery.min.js"></script>
<script src="${context}/frameworklib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

var arr_bank = [];
var obj_customer = {};

var logout = function(){
	$.get( "${context}/Logout" ).done(
		function(){
			window.location = "${context}";
		}
	);
};

var GetWebSelect = function(webcode) {

	if(webcode!="") {
	
		$.get( "${context}/Web/GetWebs", function( data ) {
			
			if(data["response"]=="success") {
				$.each(data["message"]["webs"], function(indx,item){
					if(item["webCode"]==obj_customer.webCode) {
						$("#selCustomerFromWeb").append($("<option>").val(item["webCode"]).attr('selected','selected').text(item["webCode"]));
					} else {
						$("#selCustomerFromWeb").append($("<option>").val(item["webCode"]).text(item["webCode"]));
					}
					
				});
			}
		});
		
	} else {
	
		$.get( "${context}/Web/GetWebs", function( data ) {
			
			if(data["response"]=="success") {
				$.each(data["message"]["webs"], function(indx,item){
					$("#selCustomerFromWeb").append($("<option>").val(item["webCode"]).text(item["webCode"]));
				});
			}
		});
	}
}

$(function(){

	$("#txtCustomerUser").focus();
	
	$.get("${context}/Bank/GetBanks", function(data){
		if(data["response"]=="success") {
			var banks = data["message"]["banks"];
			$.each(banks, function(indx, item){
				$("#selBanks").append($("<option>").val(item["bankCode"]).text(item["bankThName"]));
			});
		}
	});
	
	var EditCustomer = '${editCustomer}';
	if(EditCustomer != "") {
	
		var customer = JSON.parse(EditCustomer);
		
		obj_customer.userName = customer.userName;
		obj_customer.firstName = customer.firstName;
		obj_customer.lastName = customer.lastName;
		obj_customer.telephone = customer.telephone;
		obj_customer.webCode = customer.webCode;
		obj_customer.remark = customer.remark;
		
		$("#txtCustomerUser").attr('readonly',true).val(obj_customer.userName);
		$("#txtCustomerFirstName").val(obj_customer.firstName);
		$("#txtCustomerLastName").val(obj_customer.lastName);
		$("#txtCustomerTel").val(obj_customer.telephone);
		$("#txtCustomerRemark").val(obj_customer.remark);
		
		var tableBank = $("#tbBank").find("tbody");
		tableBank.empty();
		
		$.each(customer.banks, function(indx,item){
		
			arr_bank.push({ bankCode:item["bankCode"], bankText:item["bankThName"], bankNo:item["bankNo"] });
			
			tableBank.append(
				$("<tr>")
					.append($("<td class='text-center'>").text(indx+1))
					.append($("<td class='text-center'>").text(item["bankCode"]))
					.append($("<td class='text-center'>").text(item["bankThName"]))
					.append($("<td class='text-center'>").text(item["bankNo"]))
					.append($("<td class='text-center'>")
						.append($('<a href="javascript:void(0);" class="text-danger">').html('<b>Delete</b>')
							.attr('onclick', 'deleteBank("' + item["bankCode"] + '", "' + item["bankNo"] + '")')))
			);
		});
		
		if($.isEmptyObject(arr_bank)) {
			tableBank.append(
				$("<tr>")
					.append($("<td colspan='5' class='text-center'>").text("No data"))
			);
		}
		
		obj_customer.banks = arr_bank;
		
		GetWebSelect(obj_customer.webCode);
		
		$('#btn-confirm-yes').attr('onclick',"ClickSave('edit')");
		$('#btnReset').attr('onclick',"actionPage('${context}/Customer/Manage/Form')").text('Cancel');
		
	} else {
		GetWebSelect("");
		$('#btn-confirm-yes').attr('onclick',"ClickSave('add')");
	}
	
});

var actionPage = function(url) {
	window.location = url;
}

var clearData = function() {
	$("#txtCustomerUser").val("");
	$("#txtCustomerFirstName").val("");
	$("#txtCustomerLastName").val("");
	$("#txtCustomerTel").val("");
	$("#selCustomerFromWeb").val("");
	$("#txtCustomerRemark").val("");
	$("#selBanks").val("");
	$("#txtBankAccNo").val("");
	$("#tbBank").find('tbody').empty();
	$("#tbBank").find('tbody').append($("<tr>").append($("<td colspan='6' class='text-center'>").text("No data")));
	arr_bank = [];
}

var addBank = function() {
	
	var bankCode = $("#selBanks").val();
	var bankText = $("#selBanks option:selected").text();
	var bankNo = $("#txtBankAccNo").val();
	
	if(bankCode=="" || bankNo=="") {
		return;
	}
	
	var checkBankExist = $.grep(arr_bank, function(obj) {
		return obj.bankCode === bankCode;
	});
	
	if($.isEmptyObject(checkBankExist)) {
	
		arr_bank.push({ bankCode:bankCode, bankText:bankText, bankNo:bankNo });
		
		var tableBank = $("#tbBank").find("tbody");
		tableBank.empty();
		
		$.each(arr_bank, function(indx,item){
			tableBank.append(
				$("<tr>")
					.append($("<td class='text-center'>").text(indx+1))
					.append($("<td class='text-center'>").text(item["bankCode"]))
					.append($("<td class='text-center'>").text(item["bankText"]))
					.append($("<td class='text-center'>").text(item["bankNo"]))
					.append($("<td class='text-center'>")
						.append($('<a href="javascript:void(0);" class="text-danger">').html('<b>Delete</b>')
							.attr('onclick', 'deleteBank("' + item["bankCode"] + '", "' + item["bankNo"] + '")')))
			);
		});
		
	} else {
		var modal = $("#messageModal");
		modal.find(".modal-title").html("Message");
		modal.find(".modal-body").html("สามารถเลือกได้ 1 ท่านต่อ 1ธนาคาร");
		modal.modal('toggle');
	}
}

var deleteBank = function(bankCode, bankNo) {

	arr_bank = $.grep(arr_bank, function(obj) {
		return !(obj.bankCode === bankCode && obj.bankNo === bankNo);
	});
	
	var tableBank = $("#tbBank").find("tbody");
	tableBank.empty();
	
	$.each(arr_bank, function(indx,item){
		tableBank.append(
			$("<tr>")
				.append($("<td class='text-center'>").text(indx+1))
				.append($("<td class='text-center'>").text(item["bankCode"]))
				.append($("<td class='text-center'>").text(item["bankText"]))
				.append($("<td class='text-center'>").text(item["bankNo"]))
				.append($("<td class='text-center'>")
					.append($('<a href="javascript:void(0);" class="text-danger">').html('<b>Delete</b>')
						.attr('onclick', 'deleteBank("' + item["bankCode"] + '", "' + item["bankNo"] + '")')))
		);
	});
	
	if($.isEmptyObject(arr_bank)) {
		tableBank.append(
			$("<tr>")
				.append($("<td colspan='5' class='text-center'>").text("No data"))
		);
	}
}

var prepareSaveCustomer = function() {
	
	var userName = $("#txtCustomerUser").val();
	var firstName = $("#txtCustomerFirstName").val();
	var lastName = $("#txtCustomerLastName").val();
	var telephone = $("#txtCustomerTel").val();
	var webCode = $("#selCustomerFromWeb").val();
	var remark = $("#txtCustomerRemark").val();
	
	if(userName=='' || firstName=='' || lastName=='' || telephone=='' || webCode=='' || arr_bank.length==0) {
		var modal = $("#messageModal");
			modal.find(".modal-title").html("Warning");
			modal.find(".modal-body").html("Please complete your infomation.");
			modal.modal('toggle');
		return;
	}

	obj_customer.userName = userName;
	obj_customer.firstName = firstName;
	obj_customer.lastName = lastName;
	obj_customer.telephone = telephone;
	obj_customer.webCode = webCode;
	obj_customer.remark = remark;
	obj_customer.banks = arr_bank;
	
	$("#h_customerInfo").val(JSON.stringify(obj_customer));
	
	var modal = $("#confirmModal");
	modal.find(".modal-body").html("Are you sure to add this customer?");
	modal.modal('toggle');
}

var saveCustomer = function(param, action){
	
	var bgOverlay = $("#bgOverlay");
	var loadingImg = $("#loadingImg");
	
	var _url = '';
	
	if(action=="add") {
		_url = '${context}/Customer/AddCustomer/Add';
	} else if(action=="edit") {
		_url = '${context}/Customer/EditCustomer/Edit';
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
				modal.find(".modal-body").html("Save customer success.");
				modal.find(".modal-footer").find("button").attr('onclick',"actionPage('${context}/Customer/Manage/Form')");
				modal.modal('toggle');
				
			} else {
			
				modal.find(".modal-title").html("Message");
				modal.find(".modal-body").html(data["message"]);
				modal.modal('toggle');
			}
		},
		error: function(jqXHR,textStatus,errorThrown) {
			
			clearData();
			
			var modal = $("#messageModal");
			modal.find(".modal-title").html("Error");
			modal.find(".modal-body").html(jqXHR.responseText);
			modal.modal('toggle');
		}
	});
};

var ClickSave = function(action) {
	saveCustomer($("#h_customerInfo").val(), action);
};

</script>
</body>
</html>