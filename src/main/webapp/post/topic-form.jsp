<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="utf-8">
		<title>Formulário Tópico</title>
				<script src="<%=request.getContextPath() %>/resources/js/jquery-1.10.2.js"></script>
		<script src="<%=request.getContextPath() %>/resources/js/jquery.validate.min.js"></script>
		<script>
			$(document).ready(function(){
				$('#post').validate({
					rules: {
						nome: {
							required: true,
							rangelength: [1, 50]
						}
					}, // end rules
					
					messages: {
						nome: {
							required: "Por favor digite um Nome",
							rangelength: "O Nome deve ter no máximo 50 caracteres"
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
					<p>Adicione um Tópico:</p>
				</div>
				<form action="add-topic" method="post" id="post">
					<div class="post-form-box">
						<div class="post-form-title">
							<label>Nome:</label>
							<input type="text" name="nome"/>
						</div>
						<div class="post-form-submit post-form-submit-margin">
							<input type="submit" value="Adicionar"/>
						</div>
					</div>
				</form>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp" />
	</body>
</html>