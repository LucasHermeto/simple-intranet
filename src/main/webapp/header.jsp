<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
	<div class="header">
		<div class="top-bar">
			<div class="top-login">
				<c:if test="${userLogged == null }">
					<a href="/intranet/login">Login</a>
				</c:if>
				<c:if test="${userLogged != null}">
					<a href="/intranet/post/user/${userLogged.evangelizador.id}">${userLogged.evangelizador.nome}</a><span>|</span>
					<a href="/intranet/logout">Sair</a>
				</c:if>
			</div>
		</div>
		<div class="title">
			<div class="title-text"> 
				<h1>Intranet</h1>
				<h2>Grupo Espírita Fraternidade e Luz</h2>
			</div>
		</div>
		<div class="menu-bar">
			<div class="menu-home">
				<c:if test="${userLogged == null }">
					<a href="/intranet/"><img src="<%=request.getContextPath() %>/resources/css/imgs/home.png" /></a>
				</c:if>
				<c:if test="${userLogged != null }">
					<a href="/intranet/post/home"><img src="<%=request.getContextPath() %>/resources/css/imgs/home.png" /></a>
				</c:if>
			</div>
		</div>
	</div>
</header>