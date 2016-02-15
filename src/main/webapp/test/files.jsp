<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="utf-8">
		<title>Files</title>
		<script>
			function validadeFile(){
				var file = document.getElementById("files").files;
				
				for(var i = 0; i < file.length; i++){
					console.log(file[i].name);
					
					var node = document.createElement("input");
					node.setAttribute("type", "hidden");
					node.setAttribute("name", "names");
					node.setAttribute("value", file[i].name);
					
					document.getElementById("form").appendChild(node);
				}
				return true;
			}
		</script>
	</head>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section style="height: 450px;">
			<c:if test="${message != null}">
				<div class="message">${message}</div>
			</c:if>
			<c:if test="${erro != null}">
				<div class="message-erro">${erro}</div>
			</c:if>
			<div style="margin: 20px;">
				<p>Teste de multiple file:</p>
			</div>
			<form action="add-file" method="post" name="form" enctype="multipart/form-data" id="form">
				<input type="file" name="files" id="files" multiple="multiple"/>
				<input type="submit" onclick="return validadeFile()"/>
			</form>
		</section>
		
		<jsp:include page="/footer.jsp" />
	</body>
</html>