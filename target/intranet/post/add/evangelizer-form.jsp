<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Formulário Evangelizador" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section>
			<div class="student-form">
				<div class="post-form-text">
					<p>Adicione um Evangelizador:</p>
				</div>
				<c:if test="${erro != null}">
					<div class="message-erro">${erro}</div>
				</c:if>
				<form action="evangelizer" method="post" enctype="multipart/form-data" id="evangelizer" name="form">
					<div class="post-form-box">
						<div class="post-form-title">
							<label>Nome:</label>
							<input type="text" name="nome"/>
						</div>
						<div class="post-form-title">
							<label>Email:</label>
							<input type="email" name="email"/>
						</div>
						<div class="post-form-title">
							<label>Senha:</label>
							<input type="password" name="senha"/>
						</div>
						<div class="student-form-period">
							<label>Ciclo:</label>
							<select name="ciclo">
								<c:forEach items="${periodsList}" var="periods">
								<option>${periods.nome}</option>
								</c:forEach>
							</select>
						</div>
						<div class="evangelizer-image">
							<label>Insíra uma foto:</label>
							<input type="file" id="image" name="image" onchange="readURL(this,'mini_foto_new');" />
							<img id="mini_foto_new" class="mini_foto" src="/intranet/resources/css/imgs/background-services-users.png"
								width="200" height="200"/>
							<script>
								function readURL(input, id) {
							            if (input.files && input.files[0]) {
							                var reader = new FileReader();
							
							                reader.onload = function (e) {
							                    $('#'+id)
										.attr('src', e.target.result)
										;
							                }
							
							                reader.readAsDataURL(input.files[0]);
							            }
							        }
							</script>
							<script>
								function validadeImage(file){
									var extension = file.substr((file.length - 4), file.length);
									
									if(extension == ".jpg"){
										return true;
									}
									
									alert("Entre com um arquivo válido!");
									return false;
								}
							</script>
						</div>
						<div class="post-form-submit post-form-submit-margin">
							<input type="submit" value="Adicionar" onclick="return validadeImage(form.image.value)"/>
						</div>
					</div>
				</form>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp" />
	</body>
</html>