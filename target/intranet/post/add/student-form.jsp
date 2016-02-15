<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Formulário Aluno" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section>
			<div class="student-form">
				<div class="post-form-text">
					<p>Adicione um Aluno:</p>
				</div>
				<form action="student" method="post" enctype="multipart/form-data" id="student" name="form">
					<div class="post-form-box">
						<div class="post-form-title">
							<label>Nome:</label>
							<input type="text" name="nome"/>
						</div>
						<div class="student-form-period">
							<label>Ciclo:</label>
							<c:if test="${userLogged.rule == 'ADMIN'}">
								<select name="period">
									<c:forEach items="${periodsList}" var="periods">
									<option>${periods.nome}</option>
									</c:forEach>
								</select>
							</c:if>
							<c:if test="${userLogged.rule != 'ADMIN'}">
								<select name="period">
									<option>${userLogged.evangelizador.ciclo.nome}</option>
								</select>
							</c:if>
						</div>
						<div class="post-form-title post-form-description">
							<label>Data de Nascimento:</label>
							<input type="text" id="datepicker" name="dataNascimento"/>
							<script>
								$(function() {
									$( "#datepicker" ).datepicker({
										changeMonth: true,
										changeYear: true
									});
								});
							</script>
						</div>
						<div class="post-form-title post-form-description">
							<label>Nome da Mãe:</label>
							<input type="text" name="nomeMae"/>
						</div>
						<div class="post-form-title post-form-description">
							<label>Nome do Pai:</label>
							<input type="text" name="nomePai"/>
						</div>
						<div class="post-form-title post-form-description">
							<label>Telefone:</label>
							<input type="text" name="telefone"/>
						</div>
						<div class="post-form-title post-form-description">
							<label>Endereço:</label>
							<input type="text" name="endereco"/>
						</div>
						<div class="student-image">
							<label>Insíra uma foto:</label>
							<input type="file" id="image" name="image" onchange="readURL(this,'mini_foto_new');" />
							<img id="mini_foto_new" class="mini_foto" src="/intranet/resources/css/imgs/background-services-users.png"
								width="200" height="200"/>
							<script>
								function readURL(input, id) {
							            if (input.files && input.files[0]) {
							                var reader = new FileReader();
							
							                reader.onload = function (e) {
							                    $('#'+id).attr('src', e.target.result);
							                }
							
							                reader.readAsDataURL(input.files[0]);
							            }
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