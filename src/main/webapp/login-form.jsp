<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="head.jsp">
		<jsp:param value="Login" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="header.jsp"/>
		<section>
		
			<div class="login">
				<div class="form">
					<div class="form-text-align">
					
						<div class="erro">
							<c:if test="${erro}">
								<span>Usuário incorreto</span>
								<script>
									$(document).ready(function(){
										$('.login').css('backgroundImage', 'url("<%=request.getContextPath() %>/resources/css/imgs/background-login-site-2.png")');
									}); // end ready
								</script>
							</c:if>
							<c:if test="${!erro}"><span></span></c:if>
						</div>
						
						<form action="entrar" method="post" class="form-text">
							<input type="text" name="login" placeholder="Usuário"/><br/>
							<input type="password" name="senha" placeholder="Senha"/><br/>
							<input type="image" src="/intranet/resources/css/imgs/botao-login.png" id="image"/>
						</form>
					</div>
				</div>
			</div>
			
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>