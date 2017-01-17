<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=8,IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Redirect</title>

<c:set var="context" value="${pageContext.request.contextPath}" />

<link href="frameworklib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--[if lt IE 9]>
	<script src="frameworklib/others/html5shiv.min.js"></script>
	<script src="frameworklib/others/respond.min.js"></script>
<![endif]-->

<style type="text/css">

body
{
	height: 500px;
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

</style>

</head>
<body>

<div class="container-fluid container-table">
	<div class="row vertical-center-row">
	
		<div class="col-sm-12">
		
			<h2 id="counter">Session Time Out...</h2>
		
		</div>
		
	</div>
</div>

<script src="frameworklib/others/jquery.min.js"></script>
<script src="frameworklib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

var counter = 5;
var interval = setInterval(function() {

    counter--;
    
    $("#counter").html("Session Time Out..." + counter);
    
    if (counter == 0) {
        window.location = "${context}";
        clearInterval(interval);
    }
}, 1000);

</script>

</body>
</html>