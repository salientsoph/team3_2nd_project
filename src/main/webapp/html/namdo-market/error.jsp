<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
   $(function(){
	   alert("${requestScope.errmsg}");
	   history.back();
   });
 
</script>
</head>
<body>

</body>
</html>