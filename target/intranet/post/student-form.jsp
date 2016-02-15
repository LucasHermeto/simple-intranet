<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/themes/ui-lightness/jquery.ui.datepicker.css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="uft-8">
		<title>Formulário Aluno</title>
		<script src="<%=request.getContextPath() %>/resources/js/jquery-1.10.2.js"></script>
		<script src="<%=request.getContextPath() %>/resources/js/jquery-ui-1.10.4.custom.min.js" ></script>
		<script src="<%=request.getContextPath() %>/resources/js/jquery.validate.min.js"></script>
		<script>
			$(document).ready(function(){
				$('#post').validate({
					rules: {
						nome: {
							required: true,
							rangelength: [1, 50]
						},
						dataNascimento: {
							required: true
						},
						nomeMae: {
							required: true,
							rangelength: [1, 50]
						},
						nomePai: {
							required: true,
							rangelength: [1, 50]
						}
					}, // end rules
					
					messages: {
						nome: {
							required: "Por favor digite um Nome",
							rangelength: "O Nome deve ter no máximo 50 caracteres"
						},
						dataNascimento: {
							required: "Por favor digite uma data de nascimento"	
						},
						nomeMae: {
							required: "Por favor digite o Nome da Mãe",
							rangelength: "O Nome da Mãe deve ter no máximo 50 caracteres"
						},
						nomePai: {
							required: "Por favor digite o Nome do Pai",
							rangelength: "O Nome do Pai deve ter no máximo 50 caracteres"
						}
					}, // end messages
					
					errorPlacement: function(error, element){
						error.insertAfter(element);
					 } // end errorPlacement
					
				}); // end validade
			}); // end ready
		</script>
		<style>
		  .thumb {
		    height: 75px;
		    border: 1px solid #000;
		    margin: 10px 5px 0 0;
		  }
		</style>
	</head>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section>
			<div class="student-form">
				<div class="post-form-text">
					<p>Adicione um Aluno:</p>
				</div>
				<form action="add-student" method="post" enctype="multipart/form-data" id="post" name="form">
					<div class="post-form-box">
						<div class="post-form-title">
							<label>Nome:</label>
							<input type="text" name="nome"/>
						</div>
						<div class="student-form-period">
							<label>Ciclo:</label>
							<select name="period">
								<c:forEach items="${periodsList}" var="periods">
								<option>${periods.id}-${periods.nome}</option>
								</c:forEach>
							</select>
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