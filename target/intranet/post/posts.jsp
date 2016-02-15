<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Postagens" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp" />
	
		<section>
			<div class="posts" id="posts">
				<c:forEach var="postagens" items="${postagensList}">
					<div class="posts-container" id="post_${postagens.id}">
						<div class="posts-container-name">
							<a href="/intranet/post/topics/${postagens.topico.id}/postagens/${postagens.id}">${postagens.nome} - ${postagens.ciclo.nome}</a>
						</div>
						<c:if test="${postagens.usuario.id == userLogged.id || userLogged.rule == 'ADMIN'}">
							<a href="#" class="remove remove-post" onclick="removePost(${postagens.id})"></a>
						</c:if>
						<div class="posts-container-text">
							<div id="text" class="post-container-text-review">${postagens.descricao}<span>[...]</span></div>
							<div class="posts-container-text-creator">
								<span>Por:</span>
								<a href="/intranet/post/user/${postagens.usuario.id}">${postagens.usuario.evangelizador.nome}</a><br>
								<span><fmt:formatDate value="${postagens.data}" pattern="dd/MM/yyyy' às: 'hh:mm a"/></span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="pages"></div>
			<script>
				paginator(<%= request.getAttribute("pages") %>,
						document.getElementById("pages"),
						<%= request.getAttribute("thisPage") %>,
						document.URL);
			</script>
		</section>
		
		<div class=button-up>
			<img src="<%=request.getContextPath() %>/resources/css/imgs/top-botton.png" width="20px" height="20px">
		</div>
		
		<jsp:include page="/footer.jsp" />
	</body>
</html>