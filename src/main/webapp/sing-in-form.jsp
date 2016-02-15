<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="resources/css/style.css" rel="stylesheet">
		<title>Adiciona Usuario</title>
	</head>
	<body>
		<script type="text/javascript">
			function valida(){
				login = document.forms["adiciona"]["login"].value.trim();
				senha = document.forms["adiciona"]["senha"].value;
				if(login == "" || login == null &&
						senha == "" || senha == null){
					alert("Preencha todos os campos por favor");
					return false;
				}
			}
		</script>
		<jsp:include page="header.jsp"/>
		<div id="form">
			<form action="singIn" method="post" name="adiciona" onsubmit="return valida()">
				Nome:<br/>
				<input type="text" name="nome">
				<c:if test="${erro}"><span style="color: red;">Login já existe</span></c:if><br/>
				Login<br/>
				<input type="text" name="login"/><br/>
				Senha<br/>
				<input type="password" name="senha"/>
				<input type="submit" value="Adicionar"/>
			</form>
		</div>
	</body>
</html>