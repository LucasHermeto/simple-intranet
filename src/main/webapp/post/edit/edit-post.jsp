<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="${post.nome} - Editando" name="title"/>
	</jsp:include>
	</head>
	<body>
		<jsp:include page="/header.jsp"/>
		
		<section>
			<div class="post-container">
				<form action="edit-post" method="post" id="post" enctype="multipart/form-data" id="form">
					<div class="post-title">
						<input type="text" name="nome" value="${post.nome}" />
					</div>
					<article class="post-container-box">
						<div class="post-user">
							<img src="<%=request.getContextPath() %>/resources/evangelizers/${post.usuario.evangelizador.id}.jpg"
								width="40" height="40" class="img-evangelizer"/>
							<div class="posts-container-text-creator post-user-info">
								<span>Por: </span><a href="/intranet/post/user/${post.usuario.id}">${post.usuario.evangelizador.nome}</a><br>
								<span><fmt:formatDate value="${post.data}" pattern="dd/MM/yyyy' às: 'hh:mm a"/></span>
							</div>
						</div>
						<div class="post-description">
							<textarea rows="10" cols="60" name="descricao">${post.descricao}</textarea>
						</div>
						<c:if test="${fileName != null}">
							<div class="post-file">
								<div class="post-file-title">Arquivos:</div>
								<c:forEach var="name" items="${fileName}">
									<div class="post-file-img" id="file_${name}">
											<a href="/intranet/resources/posts/${post.id}/${name}" download>${name}</a>
									</div>
								</c:forEach>
							</div>
							<script>
								$('.post-file-img a').each(function(){
									$fileName = $(this).attr('href');
									var extension = $fileName.substr($fileName.length - 3, $fileName.length);
									$(this).addClass(extension).blur();
								}); // end each
							</script>
						</c:if>
						<div class="post-form-submit submit-file">
							<input type="hidden" value="${post.id}" name="id"/>
							<input type="submit" onclick="return validadePost(form.files.files)" value="Atualizar"/>
						</div>
					</article>
				</form>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp"/>
	</body>
</html>