<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Adicionar" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section>
			<div class="topics">
				<div class="topics-text">
					<p>Escolha o que deseja adicionar:</p>
				</div>
				<div class="topics-bar">
					<div class="topics-name">
						<a href="/intranet/post/add/post-form">Postagem</a>
					</div>
				</div>
				<div class="topics-bar">
					<div class="topics-name">
						<a href="/intranet/post/add/student-form">Aluno</a>
					</div>
				</div>
				<c:if test="${userLogged.rule == 'ADMIN'}">
					<div class="topics-bar topic-bar-evangelizer">
						<div class="topics-name topic-name-evangelizer">
							<a href="/intranet/post/add/evangelizer-form">Evangelizador</a>
						</div>
					</div>
					<div class="topics-bar">
						<div class="topics-name">
							<a href="/intranet/post/add/topic-form">Topico</a>
						</div>
					</div>
					<div class="topics-bar">
						<div class="topics-name">
							<a href="/intranet/post/add/ciclo-form">Ciclo</a>
						</div>
					</div>
				</c:if>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp" />
	</body>
</html>