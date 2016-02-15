<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="uft-8">
		<title>Formulário Evangelizador</title>
		<script src="<%=request.getContextPath() %>/resources/js/jquery-1.10.2.js"></script>
		<script src="<%=request.getContextPath() %>/resources/js/jquery.validate.min.js"></script>
		<script>
			$(document).ready(function(){
				$('#post').validate({
					rules: {
						nome: {
							required: true,
							rangelength: [1, 50]
						},
						email: {
							required: true
						}
					}, // end rules
					
					messages: {
						nome: {
							required: "Por favor digite um Nome",
							rangelength: "O Nome deve ter no máximo 50 caracteres"
						},
						email: {
							required: "Por favor digite um email"	
						}
					}, // end messages
					
					errorPlacement: function(error, element){
						error.insertAfter(element);
					 } // end errorPlacement
					
				}); // end validade
			}); // end ready
		</script>
	</head>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section>
			<div class="student-form">
				<div class="post-form-text">
					<p>Adicione um Evangelizador:</p>
				</div>
				<form action="add-evangelizer" method="post" enctype="multipart/form-data" id="post" name="form">
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
								<option>${periods.id}-${periods.nome}</option>
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