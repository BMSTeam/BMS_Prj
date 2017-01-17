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
	height:370px;
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
</style>

</head>
<body>

<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
			<a href="#" class="navbar-brand">Main</a>
          	<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
          	</button>
        </div>
        <div id="navbar-main" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="menu1">Menu1<span class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="menu1">
						<li><a href="#">Sub1</a></li>
                		<li class="divider"></li>
                		<li><a href="#">Sub2</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:void(0);"><c:out value="${username}"/></a></li>
				<li><a href="javascript:void(0);" onclick="logout();">Logout</a></li>
			</ul>
        </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
</nav><!-- /.navbar -->

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
		
			<br>
			<form>
				<div class="form-group">
				    <label class="sr-only" for="txtSearchUser">User</label>
				    <input type="text" class="form-control input-sm" id="txtSearchUser" placeholder="User">
				</div>
				<div class="form-group">
				    <label class="sr-only" for="txtSearchTel">Tel</label>
				    <input type="text" class="form-control input-sm" id="txtSearchTel" placeholder="Telephone Number">
				</div>
				<div class="form-group">
				    <label class="sr-only" for="txtSearchOther">Other</label>
				    <input type="text" class="form-control input-sm" id="txtSearchOther" placeholder="Other">
				</div>
				<button type="button" class="btn btn-primary btn-sm">Search</button>
				<button type="reset" class="btn btn-default btn-sm">Clear</button>
			</form>
			
			<hr>
			
			<div class="btn-group btn-group-justified" role="group" aria-label="...">
				<div class="btn-group" role="group">
			    	<button type="button" class="btn btn-warning font-12px">ฝาก</button>
			  	</div>
			  	<div class="btn-group" role="group">
			    	<button type="button" class="btn btn-default font-12px">ถอน</button>
			  	</div>
			  	<div class="btn-group" role="group">
			    	<button type="button" class="btn btn-default font-12px">ย้าย</button>
			  	</div>
			</div>
			
			<br>
			<div class="panel panel-default">
				<table class="table table-bordered table-condensed font-11px">
					<tr>
						<td width="20%">USER</td>
						<td></td>
					</tr>
					<tr>
						<td>ACC</td>
						<td></td>
					</tr>
					<tr>
						<td>MONEY</td>
						<td></td>
					</tr>
					<tr>
						<td>TIME</td>
						<td></td>
					</tr>
					<tr>
						<td>WEB</td>
						<td></td>
					</tr>
					<tr>
						<td>CH</td>
						<td></td>
					</tr>
				</table>
			</div>
			
			<button type="button" class="btn btn-primary btn-sm" style="width:100%;">Save</button>
			
		</div>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
		
			<br>
			<div class="row">
				<div class="col-lg-5">
				
					<table class="table table-condensed font-12px borderless">
						<tr>
							<td width="30%">USER</td>
							<td>XXXXXXXXXX</td>
						</tr>
						<tr>
							<td>NAME</td>
							<td>XXXXXXXXXX</td>
						</tr>
						<tr>
							<td>TEL</td>
							<td>XXXXXXXXXX</td>
						</tr>
						<tr>
							<td>WEB</td>
							<td>XXXXXXXXXX</td>
						</tr>
						<tr>
							<td>USERNAME</td>
							<td>XXXXXXXXXX</td>
						</tr>
					</table>
					
				</div>
				
				<div class="col-lg-7">
					<table class="table table-condensed font-12px borderless">
						<tr>
							<td width="15%" rowspan="6">BANK</td>
						</tr>
						<tr>
							<td width="20%">KBANK</td>
							<td>XXX-X-XXXXX-X</td>
						</tr>
						<tr>
							<td>BBL</td>
							<td>XXX-X-XXXXX-X</td>
						</tr>
						<tr>
							<td>SCB</td>
							<td>XXX-X-XXXXX-X</td>
						</tr>
						<tr>
							<td>KTB</td>
							<td>XXX-X-XXXXX-X</td>
						</tr>
						<tr>
							<td>OTHER</td>
							<td>XXX-X-XXXXX-X</td>
						</tr>
					</table>
				</div>
				
			</div>
			
			<div class="row">
				<div class="col-lg-12">
				
					<ul class="nav nav-tabs">
						<li class="active"><a href="#detail" data-toggle="tab" aria-expanded="true">Detail</a></li>
  						<li class=""><a href="#simple" data-toggle="tab" aria-expanded="false">Simple</a></li>
					</ul>
					
					<div class="tab-content">
					
						<div class="tab-pane active" id="detail">
							
							<br>
							<table class="table table-bordered table-condensed table-hover font-11px">
							
								<thead>
									<tr>
										<th>NO</th>
										<th>DATE</th>
										<th>TIME</th>
										<th>NOTE</th>
										<th>USER</th>
										<th>WEB</th>
										<th>D/W</th>
										<th>ACC</th>
										<th>TEL</th>
										<th>MONEY</th>
										<th>CREDIT</th>
										<th>BALANCE</th>
										<th>CREDIT</th>
										<th>BALANCE</th>
										<th>EDIT</th>
										<th>RECORD</th>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td>0000001</td>
										<td class="fit">01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Withdraw</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
								</tbody>
								
							</table>
							
						</div>
						
						<div class="tab-pane" id="simple">
							
							<br>
							<table class="table table-bordered table-condensed table-hover font-11px">
							
								<thead>
									<tr>
										<th>NO</th>
										<th>DATE</th>
										<th>TIME</th>
										<th>NOTE</th>
										<th>USER</th>
										<th>WEB</th>
										<th>D/W</th>
										<th>ACC</th>
										<th>TEL</th>
										<th>MONEY</th>
										<th>CREDIT</th>
										<th>BALANCE</th>
										<th>CREDIT</th>
										<th>BALANCE</th>
										<th>EDIT</th>
										<th>RECORD</th>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td>0000001</td>
										<td class="fit">01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Withdraw</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Withdraw</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Withdraw</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
									<tr>
										<td>0000001</td>
										<td>01-01-2017</td>
										<td>12:01:55</td>
										<td></td>
										<td>0000</td>
										<td>SBOBET</td>
										<td>Deposit</td>
										<td>XXXX</td>
										<td>XXXX</td>
										<td>2,000</td>
										<td>400</td>
										<td>-195</td>
										<td>200</td>
										<td>-195</td>
										<td>OK</td>
										<td>John</td>
									</tr>
								</tbody>
								
							</table>
							
						</div>
					</div>
					
				</div>
			</div>
			
		</div>
	</div>
</div>

<script src="frameworklib/others/jquery.min.js"></script>
<script src="frameworklib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

var logout = function(){
	$.get( "${context}/Logout" ).done(
		function(){
			location.reload();
		}
	);
};

</script>
</body>
</html>