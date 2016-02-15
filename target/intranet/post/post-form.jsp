<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="uft-8">
		<title>Formul�rio Postagem</title>
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
						descricao: {
							required: true
						}
					}, // end rules
					
					messages: {
						nome: {
							required: "Por favor digite um T�tulo",
							rangelength: "O T�tulo deve ter no m�ximo 50 caracteres"
						},
						descricao: {
							required: "Por favor digite uma descri��o"	
						},
						file: {
							required: "Por favor insira um arquivo"
						}
					}, // end messages
					
					errorPlacement: function(error, element){
						error.insertAfter(element);
					 } // end errorPlacement
					
				}); // end validade
			}); // end ready
		</script>
		<script>
			function validadePost(file){
				var extension = file.substr((file.length - 4), file.length);
				var fileName = file.substr(12, file.length);
				
				var ext = new Array('docx', '.doc', '.pdf', 'pptx', '.ppt', 'ppsx', '.xls', 'xlsx', 'xlsm');
				for(var i = 0; i < ext.length; i++){
					if(ext[i] == extension){
						document.getElementById("fileName").value = fileName;
						return true;
					}
				}
				
				alert("Entre com um arquivo v�lido!");
				return false;
			}
		</script>
	</head>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section>
			<div class="post-form">
				<div class="post-form-text">
					<p>Adicione uma postagem:</p>
				</div>
				<form action="add-post" method="post" enctype="multipart/form-data" id="post" name="form">
					<div class="post-form-box">
						<div class="post-form-title">
							<label>T�tulo:</label>
							<input type="text" name="nome"/>
						</div>
						<div class="post-form-topic">
							<label>T�pico:</label>
							<select name="topic">
								<c:forEach items="${topicsList}" var="topics">
								<option>${topics.id}-${topics.nome}</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<div class="post-form-description post-form-margin">
								<label class=post-form-title>Descri��o:</label><br>
								<textarea rows="10" cols="80" name="descricao"></textarea>
							</div>
							<div class="post-form-file post-form-margin">
								<input type="file" name="file" id="file"/>
								<input type="hidden" name="fileName" id="fileName"/>
							</div>
							<div class="post-form-submit post-form-margin">
								<input type="submit" value="Adicionar" onclick="return validadePost(form.file.value)"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp" />
	</body>
</html>