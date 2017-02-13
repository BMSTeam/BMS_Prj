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
#tbCustomer th
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
	
		<div class="col-lg-5 col-centered">
		
			<br>
			
			<form id="frmSearch">
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
					<td><input type="text" id="txtCustomerTel" class="form-control input-sm"></td>
					<td class="td-middle">From Web :</td>
					<td>
						<select id="selCustomerFromWeb" class="form-control input-sm">
							<option value="">Select Web</option>
						</select>
					</td>
				</tr>
			</table>
			</form>
			
			<table class="table table-condensed font-12px borderless">
				<tr>
					<td style="text-align:center;">
						<button type="button" class="btn btn-primary btn-sm" onclick="searchCustomer();">Search</button>
						<button type="reset" class="btn btn-default btn-sm" onclick="clearData()">Clear</button>
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
						<button type="button" class="btn btn-default btn-sm" onclick="actionPage('${context}/Customer/AddCustomer/Form');">
							Add Customer
						</button>
					</td>
				</tr>
			</table>
			
			<table id="tbCustomer" class="table table-bordered table-condensed table-hover font-12px">
				<thead>
					<tr>
						<th class="text-center">No</th>
						<th class="text-center">User</th>
						<th class="text-center">First Name</th>
						<th class="text-center">Last Name</th>
						<th class="text-center">Tel.</th>
						<th class="text-center">Remark</th>
						<th class="text-center">From Web</th>
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

<div class="modal" id="confirmDeleteCustomerModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteCustomerModal" data-backdrop="static" data-keyboard="false">
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
							<label class="control-label" id="lblConfirm-User"></label>
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
						<label class="col-sm-4 control-label">Tel :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-Tel"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">From Web :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-FromWeb"></label>
						</div>
					</div>
				</form>
				
			</div>
			<div class="modal-footer">
				<input type="hidden" id="h_delete_customer" value=""/>
				<button type="button" class="btn btn-primary btn-delete-confirm-yes" data-dismiss="modal">Yes</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
			</div>
		</div>
	</div>
</div>

<script src="${context}/frameworklib/others/jquery.min.js"></script>
<script src="${context}/frameworklib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

var arr_customer = [];

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

	$.get( "${context}/Web/GetWebs", function( data ) {
		
		if(data["response"]=="success") {
			$.each(data["message"]["webs"], function(indx,item){
				$("#selCustomerFromWeb").append($("<option>").val(item["webCode"]).text(item["webCode"]));
			});
		}
	});
	
	searchCustomer();

});

$("#frmSearch input").keypress(function (e) {
    if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
        searchCustomer();
        return false;
    } else {
        return true;
    }
});

var clearData = function() {
	$("#txtCustomerUser").val("");
	$("#txtCustomerFirstName").val("");
	$("#txtCustomerLastName").val("");
	$("#txtCustomerTel").val("");
	$("#selCustomerFromWeb").val("");
	$("#tbCustomer").find('tbody').empty();
	$("#tbCustomer").find('tbody').append($("<tr>").append($("<td colspan='9' class='text-center'>").text("No data")));
	arr_customer = [];
}

var searchCustomer = function(){
	
	var bgOverlay = $("#bgOverlay");
	var loadingImg = $("#loadingImg");
	var tbCustomer = $("#tbCustomer").find('tbody');
	
	var param = {};
	param.userName = $("#txtCustomerUser").val();
	param.firstName = $("#txtCustomerFirstName").val();
	param.lastName = $("#txtCustomerLastName").val();
	param.telephone = $("#txtCustomerTel").val();
	param.webCode = $("#selCustomerFromWeb").val();
	
	$.ajax({
		method: "POST",
		url: "${context}/Customer/SearchCustomerOnly",
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
				
				tbCustomer.empty();
				arr_customer = [];
				
				$.each(item["customers"], function(indx, item){
					
					tbCustomer.append(
						$("<tr>")
							.append($("<td class='text-center fit'>").text(indx+1))
							.append($("<td class='text-center fit'>").text(item["userName"]))
							.append($("<td class='fit'>").text(item["cusFirstName"]))
							.append($("<td class='fit'>").text(item["cusLastName"]))
							.append($("<td class='text-center fit'>").text(item["cusTel"]))
							.append($("<td class='fit'>").text(item["remark"]))
							.append($("<td class='text-center fit'>").text(item["web"]["webCode"]))
							.append($("<td class='text-center fit'>")
								.html(
									$('<a href="javascript:void(0);">')
										.attr('class','text-danger')
										.attr('onclick','editCustomer("'+item["userName"]+'")')
										.text('Edit')
								)
							)
							.append($("<td class='text-center fit'>")
								.html(
									$('<a href="javascript:void(0);">')
										.attr('class','text-danger')
										.attr('onclick','confirmDeleteCustomer("'+item["userName"]+'")')
										.text('Delete')
								)
							)
					);
					
					arr_customer.push(item);
					
				});
				
				if($.isEmptyObject(item["customers"])) {
					tbCustomer.append($("<tr>").append($("<td colspan='9' class='text-center'>").text("No data")));
				}
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

var editCustomer = function(userName) {
	
	var _tmp = $.grep(arr_customer, function(obj) {
		return obj.userName === userName;
	});
	
	var param = {};
	param.userName = _tmp[0]["userName"];
	param.firstName = _tmp[0]["cusFirstName"];
	param.lastName = _tmp[0]["cusLastName"];
	param.telephone = _tmp[0]["cusTel"];
	param.remark = _tmp[0]["remark"];
	param.webCode = _tmp[0]["web"]["webCode"];
	param.banks = _tmp[0]["banks"];
	
	var form = $('<form>');
	form.attr('action','${context}/Customer/EditCustomer/Form');
	form.attr('method','post');
	
	form.html($('<input type="hidden" name="editCustomer">').val(JSON.stringify(param)));
	form.appendTo('body');
	form.submit();
};

var confirmDeleteCustomer = function(userName) {
	
	var _tmp = $.grep(arr_customer, function(obj) {
		return obj.userName === userName;
	});
	
	$('#lblConfirm-User').text(_tmp[0]["userName"]);
	$('#lblConfirm-FirstName').text(_tmp[0]["cusFirstName"]);
	$('#lblConfirm-LastName').text(_tmp[0]["cusLastName"]);
	$('#lblConfirm-Tel').text(_tmp[0]["cusTel"]);
	$('#lblConfirm-FromWeb').text(_tmp[0]["web"]["webCode"]);
	
	$('#h_delete_customer').val(_tmp[0]["userName"]);
	
	$("#confirmDeleteCustomerModal").modal('toggle');
};

$(".btn-delete-confirm-yes").on('click', function(){
	deleteCustomer($("#h_delete_customer").val());
});

var deleteCustomer = function(userName) {
	
	var bgOverlay = $("#bgOverlay");
	var loadingImg = $("#loadingImg");
	
	$.ajax({
		method: "POST",
		url: '${context}/Customer/DeleteCustomer',
		cache: false,
		data: { userName:userName },
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
				modal.find(".modal-body").html("Delete customer success.");
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

</script>

</body>
</html>