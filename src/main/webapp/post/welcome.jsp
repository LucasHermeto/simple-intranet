<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Bem Vindo" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp"/>
		
		<section class="intro">
			<c:if test="${message != null}">
				<div class="message">${message}</div>
			</c:if>
			<c:if test="${erro != null}">
				<div class="message-erro">${erro}</div>
			</c:if>
			<div class="intro-text">
				<p>Escolha o que você deseja ver:</p>
			</div>
		</section>
		
		<section class="services">
			<div class="services-topics services-bar">
				<a href="/intranet/post/topics" class="services-title">
					<img src="<%=request.getContextPath() %>/resources/css/imgs/files-icon.png" class="services-blog-img"/><br>
					<span>Arquivos</span>
				</a>
			</div>
			<div class="services-users services-bar">
				<a href="/intranet/post/evangelizers" class="services-title">
					<img src="<%=request.getContextPath() %>/resources/css/imgs/background-services-users.png" class="services-users-img"/><br>
					<span>Evangelizadores</span>
				</a>
			</div>
			<div class="services-bar services-students">
				<a href="/intranet/post/periods" class="services-title">
					<img src="<%=request.getContextPath() %>/resources/css/imgs/background-services-users.png" class="services-users-img" /><br>
					<span>Alunos</span>
				</a>
			</div>
			<div class="services-bar services-add">
				<a href="/intranet/post/add" class="services-title">
					<img src="<%=request.getContextPath() %>/resources/css/imgs/add-icon.png" class="services-add-img"/><br>
					<span>Adicionar</span>
				</a>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp"></jsp:include>
	</body>
</html>