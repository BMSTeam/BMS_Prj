<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=8,IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Authentication</title>

<c:set var="context" value="${pageContext.request.contextPath}" />

<link href="frameworklib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--[if lt IE 9]>
	<script src="frameworklib/others/html5shiv.min.js"></script>
	<script src="frameworklib/others/respond.min.js"></script>
<![endif]-->

<style type="text/css">
body { background: #f5f5f5; }
</style>

</head>
<body>

<div class="container">
	<div style="margin-top:50px;" class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-default">
           	<div style="padding-top:30px" class="panel-body">
           	
           		<div class="form-group"><h4>Please Login</h4></div>
           		
           		<div id="pleasewait" class="alert alert-info col-sm-12 hide">Please wait</div>
           		<div id="login-success" class="alert alert-success col-sm-12 hide"></div>
           		<div id="login-fail" class="alert alert-danger col-sm-12 hide"></div>
           		
           		<form id="loginform" class="form-horizontal" role="form">
           		
           			<div style="margin-bottom: 25px" class="input-group">
                    	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    	<input id="login-username" type="text" class="form-control" name="username" value="" placeholder="Username">                                        
                   </div>
                   
                   <div style="margin-bottom: 25px" class="input-group">
                   		<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                   		<input id="login-password" type="password" class="form-control" name="password" placeholder="Password">
                  	</div>
                  	
                  	<div style="margin-top:10px" class="form-group">
						<div class="col-sm-12 controls">
							<a id="btn-login" href="javascript:void(0);" onclick="login();" class="btn btn-primary">Login</a>
						</div>
					</div>
					
           		</form>
           	</div>
		</div>
	</div>
</div>

<script src="frameworklib/others/jquery.min.js"></script>
<script src="frameworklib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(function() {

	$("#login-username").focus();
	
    $("form input").keypress(function (e) {
        if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
            $('#btn-login').click();
            return false;
        } else {
            return true;
        }
    });
    
});

var interval = setInterval(function(){
	var wait = $("#pleasewait");
	if( wait.html().length > 30 )
	{
		wait.html('Please wait');
		clearInterval(this);
	}
	else
	{
		wait.append('.');
	}
}, 100);

var login = function(){
	var username = $("#login-username").val();
	var password = $("#login-password").val();
	
	var pleasewait = $("#pleasewait");
	var loginsuccess = $("#login-success");
	var loginfail = $("#login-fail");
	
	$.ajax({
		method: "POST",
		url: "${context}/Login",
		cache: false,
		data: { username:username, password:password },
		dataType: "json",
		beforeSend: function() {
			pleasewait.removeClass("hide");
			loginsuccess.addClass("hide");
			loginfail.addClass("hide");
		},
		complete: function() {
			pleasewait.addClass("hide");
		},
		success: function(data) {
			if(data["result"]=="true") {
				loginsuccess.html(data["detail"]);
				loginsuccess.removeClass("hide");
				
				window.open("${context}/MainPage", "_top");
			} else {
				loginfail.html(data["detail"]);
				loginfail.removeClass("hide");
			}
		},
		error: function(jqXHR,textStatus,errorThrown) {
			loginfail.html(errorThrown);
			loginfail.removeClass("hide");
		}
	});
};

</script>
</body>
</html>