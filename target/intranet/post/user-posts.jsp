<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:forEach items="${userPosts}" var="postagens">
	<div class="posts-container" id="post_${postagens.id}">
		<div class="posts-container-name">
			<a href="/intranet/post/topics/${postagens.topico.id}/postagens/${postagens.id}">${postagens.nome} - ${postagens.topico.nome}</a>
		</div>
		<c:if test="${evangelizer.usuario.id == userLogged.id || userLogged.rule == 'ADMIN'}">
			<a href="#" class="remove remove-post" onclick="removePost(${postagens.id})"></a>
		</c:if>
		<div class="posts-container-text">
			<div id="text" class="post-container-text-review">${postagens.descricao}<span>[...]</span>
			</div>
			<div class="posts-container-text-creator">
				<span>Por:</span> <a href="/intranet/post/user/${postagens.usuario.id}">${postagens.usuario.evangelizador.nome}</a><br>
				<span><fmt:formatDate value="${postagens.data}" pattern="dd/MM/yyyy' às: 'hh:mm a" /></span>
			</div>
		</div>
	</div>
</c:forEach>