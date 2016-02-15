<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Formulário Postagem" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section>
			<div class="post-form">
				<div class="post-form-text">
					<p>Adicione uma postagem:</p>
				</div>
				<form action="post" method="post" name="form" enctype="multipart/form-data" id="post">
					<div class="post-form-box input-group">
						<div class="post-form-title">
							<label>Título:</label>
							<input type="text" name="nome"/>
						</div>
						<div class="post-form-topic">
							<label>Tópico:</label>
							<select name="topic">
								<c:forEach items="${topicsList}" var="topics">
								<option>${topics.nome}</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<div class="post-form-description post-form-margin">
								<label class=post-form-title>Descrição:</label><br>
								<textarea rows="10" cols="60" name="descricao"></textarea>
							</div>
							<div class="post-form-file post-form-margin">
								<input type="file" name="files" id="files" multiple="multiple"/>
							</div>
							<div class="post-form-submit post-form-margin">
								<input type="submit" value="Adicionar" onclick="return validatePost(form.files.files)"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp" />
	</body>
</html>