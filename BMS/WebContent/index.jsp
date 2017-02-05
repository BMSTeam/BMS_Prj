<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=8,IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Main</title>

<c:set var="context" value="${pageContext.request.contextPath}" />

<link href="frameworklib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="frameworklib/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
<link href="frameworklib/bootstrap-clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">

<!--[if lt IE 9]>
	<script src="frameworklib/others/html5shiv.min.js"></script>
	<script src="frameworklib/others/respond.min.js"></script>
<![endif]-->

<style type="text/css">
body
{
	padding-top: 50px;
}
@media (min-width: 768px)
{
	.sidebar
	{
	    position: fixed;
	    top: 51px;
	    bottom: 0;
	    left: 0;
	    z-index: 1000;
	    padding-bottom: 15px;
	    display: block;
	    overflow-x: hidden;
	    overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
	    background-color: #f5f5f5;
	    border-right: 1px solid #eee;
	}
}
.font-11px
{
	font-size: 11px;
}
.font-12px
{
	font-size: 12px;
}
.borderless td, .borderless th
{
    border: none !important;
}
.tab-pane
{
	height:350px;
	overflow: auto;
}
#detail table th, #simple table th
{
	background-color: #04063A;
	color: white;
	text-align: center;
}
.table td.fit, .table th.fit
{
    white-space: nowrap;
    width: 1%;
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
	background:url('assets/img/loading.gif') 50% 50% no-repeat;
	background-size:100px 100px;
	display:none;
}
textarea
{
	resize: none;
}
fieldset.scheduler-border
{
    border: 1px solid #ccc !important;
    padding: 0 0 0 5px !important;
    height: 173px;
}
legend.scheduler-border
{
	font-size: 14px !important;
	font-weight: bold !important;
	text-align: left !important;
	width:auto;
	padding:0 5px;
	border-bottom:none;
	margin:0;
}
.bank-div
{
	width:100%;
	height:150px;
	overflow-x:hidden;
	overflow-y:auto;
}
.input-height
{
	height:20px;
}
input[type="text"].noborder-input
{
    border: 0;

    -webkit-box-shadow: none;
    box-shadow: none;
}
input[type="text"]:focus.noborder-input
{
     -webkit-box-shadow: none;
     box-shadow: none!important;
}
.table tbody > tr > td.td-middle
{
    vertical-align: middle;
}
.datepicker
{
	padding-left: 10px;
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
		<div class="col-sm-3 col-md-2 sidebar">
		
			<br>
			<form id="frmSearch">
				<div class="form-group">
				    <label class="sr-only" for="txtSearchUser">User</label>
				    <input type="text" class="form-control input-sm" id="txtSearchUser" placeholder="User">
				</div>
				<div class="form-group">
				    <label class="sr-only" for="txtSearchTel">Tel</label>
				    <input type="text" class="form-control input-sm" id="txtSearchTel" placeholder="Telephone Number">
				</div>
				<button type="button" id="btnSearchCostomer" class="btn btn-primary btn-sm" onclick="searchCustomer();">Search</button>
				<button type="reset" class="btn btn-default btn-sm" onclick="clearDataByClearButton()">Clear</button>
			</form>
			
			<hr>
			
			<div class="btn-group btn-group-justified" role="group" aria-label="...">
				<div class="btn-group" role="group">
			    	<button type="button" class="btn btn-warning font-12px btn-tranType">ฝาก</button>
			  	</div>
			  	<div class="btn-group" role="group">
			    	<button type="button" class="btn btn-default font-12px btn-tranType">ถอน</button>
			  	</div>
			  	<div class="btn-group" role="group">
			    	<button type="button" class="btn btn-default font-12px btn-tranType">ย้าย</button>
			  	</div>
			</div>
			
			<br>
			
			<div class="panel panel-default">
				<table class="table table-condensed">
					<tr>
						<td><input type="text" class="form-control input-sm input-height noborder-input" id="txtTranUser" placeholder="User" readonly></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control input-sm input-height noborder-input" id="txtTranMoney" placeholder="Money" readonly></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control input-sm input-height noborder-input datepicker" id="txtTranDate" placeholder="Date" readonly></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control input-sm input-height noborder-input clockpicker" id="txtTranTime" placeholder="Time" readonly></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control input-sm input-height noborder-input" id="txtTranWeb" placeholder="Web" readonly></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control input-sm input-height noborder-input" id="txtTranToBank" placeholder="To Bank" readonly></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control input-sm input-height noborder-input" id="txtTranPayCh" placeholder="Payment Channel" readonly></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control input-sm input-height noborder-input" id="txtTranFee" placeholder="Fee" readonly></td>
					</tr>
				</table>
			</div>

			<button type="button" id="btnSaveTran" class="btn btn-primary btn-sm hide" style="width:100%;" onclick="prepareSaveBetTran();">Save</button>
			
		</div>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
		
			<br>
			<div class="row">
				<div class="col-lg-6">
				
					<table class="table table-condensed font-12px borderless">
						<tr>
							<td class="td-middle">User :</td>
							<td colspan="3"><input type="text" id="txtCustomerUser" class="form-control input-sm" style="width:179px;" readonly></td>
						</tr>
						<tr>
							<td class="td-middle">First Name :</td>
							<td><input type="text" id="txtCustomerFirstName" class="form-control input-sm" readonly></td>
							<td class="td-middle">Last Name :</td>
							<td><input type="text" id="txtCustomerLastName" class="form-control input-sm" readonly></td>
						</tr>
						<tr>
							<td class="td-middle">Tel :</td>
							<td><input type="text" id="txtCustomerTel" class="form-control input-sm" readonly></td>
							<td class="td-middle">From Web :</td>
							<td><input type="text" id="txtCustomerFromWeb" class="form-control input-sm" readonly></td>
						</tr>
						<tr>
							<td class="td-middle">Remark :</td>
							<td colspan="3"><textarea id="txtCustomerRemark" class="form-control input-sm" rows="2" readonly></textarea></td>
						</tr>
					</table>
					
				</div>
				
				<div class="col-lg-6">
				
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Bank</legend>
						<div class="bank-div">
							<table id="bank-table" class="table table-condensed font-12px borderless">
								<tbody></tbody>
							</table>
						</div>
					</fieldset>
					
				</div>
				
			</div>
			
			<div class="row">
				<div class="col-lg-12">
				
					<ul class="nav nav-tabs">
						<li class="active"><a href="#detail" data-toggle="tab" aria-expanded="true">Detail</a></li>
					</ul>
					
					<div class="tab-content">
						
						<div class="tab-pane active" id="detail">
							
							<br>
							<table id="betTran-table" class="table table-bordered table-condensed table-hover font-11px">
							
								<thead>
									<tr>
										<th>No</th>
										<th>Date</th>
										<th>Time</th>
										<th>Username</th>
										<th>WebCode</th>
										<th>CompBankCode</th>
										<th>CusBankCode</th>
										<th>TranType</th>
										<th>Amount</th>
										<th>Credit</th>
										<th>Balance</th>
										<th>Fee</th>
										<th>Remark</th>
										<th>Apv.Status</th>
										<th>Apv.By</th>
										<th>CreateBy</th>
										<th>CreateDate</th>
										<th>UpdateBy</th>
										<th>UpdateDate</th>
										<th>&nbsp;</th>
									</tr>
								</thead>
								
								<tbody></tbody>
								
							</table>
							
						</div>
						
					</div>
					
				</div>
			</div>
			
		</div>
	</div>
</div>

<div id="bgOverlay"></div>
<div id="loadingImg"></div>

<div class="modal" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModal" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Modal title</h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="confirmBetTranModal" tabindex="-1" role="dialog" aria-labelledby="confirmBetTranModal" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Confirm</h4>
			</div>
			<div class="modal-body">
				
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-4 control-label">Tran Type :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-TranType"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">User :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-TranUser"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Money :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-TranMoney"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Date :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-TranDate"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Time :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-TranTime"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Web :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-TranWeb"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">To Bank :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-TranToBank"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Payment Channel :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-TranPayCh"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Fee :</label>
						<div class="col-sm-8">
							<label class="control-label" id="lblConfirm-TranFee"></label>
						</div>
					</div>
				</form>
				
			</div>
			<div class="modal-footer">
				<input type="hidden" id="h_betTranInfo" value=""/>
				<button type="button" class="btn btn-primary btn-confirm-betTran-yes" data-dismiss="modal">Yes</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
			</div>
		</div>
	</div>
</div>

<script src="frameworklib/others/jquery.min.js"></script>
<script src="frameworklib/bootstrap/js/bootstrap.min.js"></script>
<script src="frameworklib/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="frameworklib/bootstrap-clockpicker/js/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript">

var logout = function(){
	$.get( "${context}/Logout" ).done(
		function(){
			window.location = "${context}";
		}
	);
};

$(function(){

	$("#txtSearchUser").focus();
	
	getAllBetTran();
	
	// set time out
	window.timerFired = function() {
		getAllBetTran();
		window.getBetTranTimer = setTimeout(timerFired, 1000*60);
	};
	window.timerCancel = function() {
		clearTimeout(window.getBetTranTimer);
	};
	window.getBetTranTimer = setTimeout(timerFired, 1000*60);
	
});

$("#frmSearch input").keypress(function (e) {
    if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
        $('#btnSearchCostomer').click();
        return false;
    } else {
        return true;
    }
});

var searchCustomer = function(){

	// reset bettran timer
	timerCancel();
	
	openTranForm();
	
	var user = $("#txtSearchUser").val();
	var tel = $("#txtSearchTel").val();
	
	var bgOverlay = $("#bgOverlay");
	var loadingImg = $("#loadingImg");
	
	$.ajax({
		method: "POST",
		url: "${context}/Customer/SearchCustomer",
		cache: false,
		data: { user:user, telelphone:tel },
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
			
				clearData();
				
				// set user infomation
				var item = data["message"];
				$("#txtCustomerUser").val(item["userName"]);
				$("#txtCustomerFirstName").val(item["cusFirstName"]);
				$("#txtCustomerLastName").val(item["cusLastName"]);
				$("#txtCustomerTel").val(item["cusTel"]);
				$("#txtCustomerFromWeb").val(item["web"]["webURL"]);
				$("#txtCustomerRemark").val(item["remark"]);
				
				// set default user
				$("#txtTranUser").val(item["userName"]);
				
				// set bank list
				var bankTable = $("#bank-table").find('tbody');
				var bankTbody = "";
				$.each(item["banks"], function(indx,val){
					if (indx % 3 === 0 && indx > 0) {
						bankTbody += "</tr><tr>";
					}
					bankTbody += "<td>" + val["bankCode"] + "&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;" + val["bankNo"] + "</td>";
				});
				bankTbody = "<tr>" + bankTbody + "</tr>";
				bankTable.append(bankTbody);
				
				// set betTran
				var betTranTbody = $("#betTran-table").find('tbody');
				$.each(item["betTrans"], function(index, val){
					betTranTbody.append(
						$("<tr>")
							.append($("<td class='text-center fit'>").text(val["tranId"]))
							.append($("<td class='text-center fit'>").text(val["tranDate"]))
							.append($("<td class='text-center fit'>").text(val["tranTime"]))
							.append($("<td class='fit'>").text(val["userName"]))
							.append($("<td class='fit'>").text(val["webCode"]))
							.append($("<td class='text-center fit'>").text(val["compBankCode"]))
							.append($("<td class='text-center fit'>").text(val["cusBankCode"]))
							.append($("<td class='text-center fit'>").text(val["tranType"]))
							.append($("<td class='text-right fit'>").text(toDecimal(val["amount"])))
							.append($("<td class='text-right fit'>").text(toDecimal(val["credit"])))
							.append($("<td class='text-right fit'>").text(toDecimal(val["balance"])))
							.append($("<td class='text-right fit'>").text(toDecimal(val["freeFee"])))
							.append($("<td class='fit'>").text(val["remark"]))
							.append($("<td class='text-center fit'>")
										.html(val["approveStatus"]===0?"<b class='text-warning'>False</b>":"<b class='text-success'>True</b>"))
							.append($("<td class='fit'>").text(val["approveBy"]))
							.append($("<td class='fit'>").text(val["createBy"]))
							.append($("<td class='text-center fit'>").text(val["createDate"]))
							.append($("<td class='fit'>").text(val["updateBy"]))
							.append($("<td class='text-center fit'>").text(val["updateDate"]))
							.append($("<td class='fit'>").html('<a href="javascript:void(0);" class="text-danger"><b>EDIT</b></a>'))
					);
				});
				
				if($.isEmptyObject(item["betTrans"])) {
					betTranTbody.append(
						$("<tr>")
							.append($("<td colspan='20' class='text-center fit'>").text("No data available"))
					);
				}
				
			} else {
			
				clearData();
				
				$("#betTran-table").find('tbody').append(
					$("<tr>")
						.append($("<td colspan='20' class='text-center fit'>").text("No data available"))
				);

				var modal = $("#messageModal");
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

var getAllBetTran = function(){

	// define bettran table
	var betTranTbody = $("#betTran-table").find('tbody');
	
	$.ajax({
		method: "POST",
		url: "${context}/BetTran/GetAllBetTran",
		cache: false,
		data: {},
		dataType: "json",
		beforeSend: function() {
			betTranTbody.empty();
			betTranTbody.append(
				$("<tr>")
					.append($("<td colspan='20' class='text-center fit'>").text("Loading..."))
			);
		},
		complete: function() {
			betTranTbody.find("tr:first").children().remove();
		},
		success: function(data) {
		
			if(data["response"]=="success") {
				
				// set user infomation
				var item = data["message"];
				
				// set betTran
				$.each(item["betTrans"], function(index, val){
					betTranTbody.append(
						$("<tr>")
							.append($("<td class='text-center fit'>").text(val["tranId"]))
							.append($("<td class='text-center fit'>").text(val["tranDate"]))
							.append($("<td class='text-center fit'>").text(val["tranTime"]))
							.append($("<td class='fit'>").text(val["userName"]))
							.append($("<td class='fit'>").text(val["webCode"]))
							.append($("<td class='text-center fit'>").text(val["compBankCode"]))
							.append($("<td class='text-center fit'>").text(val["cusBankCode"]))
							.append($("<td class='text-center fit'>").text(val["tranType"]))
							.append($("<td class='text-right fit'>").text(toDecimal(val["amount"])))
							.append($("<td class='text-right fit'>").text(toDecimal(val["credit"])))
							.append($("<td class='text-right fit'>").text(toDecimal(val["balance"])))
							.append($("<td class='text-right fit'>").text(toDecimal(val["freeFee"])))
							.append($("<td class='fit'>").text(val["remark"]))
							.append($("<td class='text-center fit'>")
										.html(val["approveStatus"]===0?"<b class='text-warning'>False</b>":"<b class='text-success'>True</b>"))
							.append($("<td class='fit'>").text(val["approveBy"]))
							.append($("<td class='fit'>").text(val["createBy"]))
							.append($("<td class='text-center fit'>").text(val["createDate"]))
							.append($("<td class='fit'>").text(val["updateBy"]))
							.append($("<td class='text-center fit'>").text(val["updateDate"]))
							.append($("<td class='fit'>").html('<a href="javascript:void(0);" class="text-danger"><b>EDIT</b></a>'))
					);
				});
				
				if($.isEmptyObject(item["betTrans"])) {
					betTranTbody.append(
						$("<tr>")
							.append($("<td colspan='20' class='text-center fit'>").text("No data available"))
					);
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

$(".btn-tranType").on('click', function(){
	$(".btn-tranType").removeClass("btn-warning");
	$(".btn-tranType").removeClass("btn-default");
	$(".btn-tranType").not(this).addClass('btn-default');
	$(this).addClass('btn-warning');
});

var prepareSaveBetTran = function(){
	
	var txtTranUser = $("#txtTranUser").val();
	var txtTranMoney = $("#txtTranMoney").val();
	var txtTranDate = $("#txtTranDate").val();
	var txtTranTime = $("#txtTranTime").val();
	var txtTranWeb = $("#selTranWeb").val();
	var txtTranToBankNo = $("#selTranToBank").val();
	var txtTranToBankCode = $("#selTranToBank :selected").text();
	var txtTranPayCh = $("#selTranPayCh").val();
	var txtTranFee = $("#txtTranFee").val();
	
	if(txtTranUser=="" || txtTranMoney=="" || txtTranDate=="" || 
		txtTranTime=="" || txtTranWeb=="" || txtTranToBankNo=="" ||
		txtTranPayCh=="" || txtTranFee=="") {
		
		var modal = $("#messageModal");
		modal.find(".modal-title").html("Warning");
		modal.find(".modal-body").html("กรุณากรอกข้อมูลให้ครบ!");
		modal.modal('toggle');
			
		return;
	}
	
	var paramBetTran = {};
	paramBetTran.tranUserName = txtTranUser;
	paramBetTran.tranAmount = txtTranMoney;
	paramBetTran.tranDate = txtTranDate;
	paramBetTran.tranTime = (txtTranTime + ':00');
	paramBetTran.tranWebCode = txtTranWeb;
	paramBetTran.tranCompBankCode = txtTranToBankCode;
	paramBetTran.tranCompBankAcc = txtTranToBankNo;
	paramBetTran.tranChannelCode = txtTranPayCh;
	paramBetTran.tranFreeFee = txtTranFee;

	$('.btn-tranType').each(function(){
	
		var tranTran = $(this).html();
		var current = $(this).hasClass("btn-warning");
		
		if(current==true) {
		
			if(tranTran=="ฝาก") {
				paramBetTran.tranType = "Deposit";
			} else if(tranTran=="ถอน") {
				paramBetTran.tranType = "Withdraw";
			} else if(tranTran=="ย้าย") {
				paramBetTran.tranType = "Move";
			}
			
			$("#lblConfirm-TranType").text(paramBetTran.tranType);
			$("#lblConfirm-TranUser").text(paramBetTran.tranUserName);
			$("#lblConfirm-TranMoney").text(paramBetTran.tranAmount);
			$("#lblConfirm-TranDate").text(paramBetTran.tranDate);
			$("#lblConfirm-TranTime").text(paramBetTran.tranTime);
			$("#lblConfirm-TranWeb").text(paramBetTran.tranWebCode);
			$("#lblConfirm-TranToBank").text(paramBetTran.tranCompBankCode);
			$("#lblConfirm-TranPayCh").text(paramBetTran.tranChannelCode);
			$("#lblConfirm-TranFee").text(paramBetTran.tranFreeFee);
			
			var modal = $("#confirmBetTranModal");
			modal.modal('toggle');
			
			$("#h_betTranInfo").val(JSON.stringify(paramBetTran));
		}
	});
};

var saveBetTran = function(param){
	
	var bgOverlay = $("#bgOverlay");
	var loadingImg = $("#loadingImg");
	
	$.ajax({
		method: "POST",
		url: "${context}/BetTran/SaveBetTran",
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
				modal.find(".modal-body").html("Save transaction success.");
				modal.modal('toggle');
				
				$("#betTran-table").find('tbody').empty();
				clearDataByClearButton();
				getAllBetTran();
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

$(".btn-confirm-betTran-yes").on('click', function(){
	saveBetTran($("#h_betTranInfo").val());
});

var clearData = function() {
	$("#txtCustomerUser").val("");
	$("#txtCustomerFirstName").val("");
	$("#txtCustomerLastName").val("");
	$("#txtCustomerTel").val("");
	$("#txtCustomerFromWeb").val("");
	$("#txtCustomerRemark").val("");
	$("#bank-table").find('tbody').empty();
	$("#betTran-table").find('tbody').empty();
}

var clearDataByClearButton = function() {
	$("#txtSearchUser").val("");
	$("#txtSearchTel").val("");
	$("#txtCustomerUser").val("");
	$("#txtCustomerFirstName").val("");
	$("#txtCustomerLastName").val("");
	$("#txtCustomerTel").val("");
	$("#txtCustomerFromWeb").val("");
	$("#txtCustomerRemark").val("");
	$("#bank-table").find('tbody').empty();
	
	clearFormBetTran();
}

var clearFormBetTran = function() {
	$("#txtTranUser").val("");
	$("#txtTranMoney").val("");
	$("#txtTranDate").val(getDateTimeNow("date"));
	$("#txtTranTime").val(getDateTimeNow("time"));
	$("#selTranWeb").val("");
	$("#selTranToBank").val("");
	$("#selTranPayCh").val("");
	$("#txtTranFee").val("");
}

var openTranForm = function() {
	$("#txtTranUser").css("background-color","transparent");
	$("#txtTranMoney").removeAttr("readonly");
	$("#txtTranDate").css("background-color","transparent");
	$("#txtTranTime").css("background-color","transparent");
	$("#txtTranWeb").removeAttr("readonly");
	$("#txtTranToBank").removeAttr("readonly");
	$("#txtTranPayCh").removeAttr("readonly");
	$("#txtTranFee").removeAttr("readonly");
	$("#btnSaveTran").removeClass("hide");
	
	$("#txtTranDate").val(getDateTimeNow("date"));
	$('.datepicker').datepicker({
	    format: 'yyyy-mm-dd',
	    todayBtn: "linked",
	    autoclose: true,
	    todayHighlight: true
	});
	
	$('.clockpicker').clockpicker({
		default: 'now',
	    placement: 'top',
	    align: 'left',
	    donetext: 'Done',
	    init: function() {
	    	$("#txtTranTime").val(getDateTimeNow("time"));
	    }
	});
	
	// change input to select and set option
	var txtTranWeb = $("#txtTranWeb");
	txtTranWeb.replaceWith($('<select id="selTranWeb" class="form-control input-sm">'));
	
	var selTranWeb = $("#selTranWeb");
	selTranWeb.html("");
	selTranWeb.append($("<option>").val("").text("Web"));
	
	$.get( "${context}/Web/GetWebs", function( data ) {
		
		if(data["response"]=="success") {
			$.each(data["message"]["webs"], function(indx,item){
				selTranWeb.append($("<option>").val(item["webCode"]).text(item["webCode"]));
			});
		}
	});
	
	// change input to select and set option
	var txtTranToBank = $("#txtTranToBank");
    txtTranToBank.replaceWith($('<select id="selTranToBank" class="form-control input-sm">'));
    
    var selTranToBank = $("#selTranToBank");
    selTranToBank.html("");
	selTranToBank.append($("<option>").val("").text("Company Bank"));
	
	$.get( "${context}/Bank/GetCompanyBankOnlyActive", function( data ) {
		
		if(data["response"]=="success") {
			$.each(data["message"]["compBanks"], function(indx,item){
				selTranToBank.append($("<option>").val(item["bankAccountNo"]).text(item["bankCode"]));
			});
		}
	});
    
    // change input to select and set option
    var txtTranPayCh = $("#txtTranPayCh");
    txtTranPayCh.replaceWith($('<select id="selTranPayCh" class="form-control input-sm">'));
    
    var selTranPayCh = $("#selTranPayCh");
    selTranPayCh.html("");
	selTranPayCh.append($("<option>").val("").text("Payment Channel"));
	
	$.get( "${context}/PaymentChannel/GetPaymentChannels", function( data ) {
		
		if(data["response"]=="success") {
			$.each(data["message"]["paymentChannels"], function(indx,item){
				selTranPayCh.append($("<option>").val(item["channelCode"]).text(item["channelCode"]));
			});
		}
	});
}

var getDateTimeNow = function(type) {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var hr = today.getHours();
	var min = today.getMinutes();
	
	if(type=="date") {
	
		if(dd<10) {
			dd = '0' + dd;
		}
		
		if(mm<10) {
			mm = '0' + mm;
		}
		
		today = yyyy + '-' + mm + '-' + dd;
		
	} else if(type=="time") {
	
		if(hr<10) {
			hr = '0' + hr;
		}
		
		if(min<10) {
			min = '0' + min;
		}
		
		today = hr + ':' + min;
	}
	
	return today;
}

var toDecimal = function(value) {
	var value = addComma(parseFloat(value).toFixed(2));
	if(value=="NaN")
		value = "";
	return value;
}

function addComma(num){
    var n = num.toString(), p = n.indexOf('.');
    return n.replace(/\d(?=(?:\d{3})+(?:\.|$))/g, function($0, i){
        return p<0 || i<p ? ($0+',') : $0;
    });
}

var actionPage = function(url) {
	window.location = url;
}

</script>
</body>
</html>