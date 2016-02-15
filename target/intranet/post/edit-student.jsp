<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="utf-8">
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/themes/ui-lightness/jquery.ui.datepicker.css" rel="stylesheet">
		<title>Editando Aluno</title>
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
							rangelength: "O Nome deve ter no m�ximo 50 caracteres"
						},
						dataNascimento: {
							required: "Por favor digite uma data de nascimento"	
						},
						nomeMae: {
							required: "Por favor digite o Nome da M�e",
							rangelength: "O Nome da M�e deve ter no m�ximo 50 caracteres"
						},
						nomePai: {
							required: "Por favor digite o Nome do Pai",
							rangelength: "O Nome do Pai deve ter no m�ximo 50 caracteres"
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
		<jsp:include page="/header.jsp"/>
		
		<section>
			<form action="edit-student" method="post" enctype="multipart/form-data" id="post" name="form">
				<div class="student-container">
					<div class="student-info">
						<div class="student-box">
							<img id="mini_foto_new" class="mini_foto" src="/intranet/resources/students/${student.id}.jpg"
													width="280" height="280"/>
						</div>
						<div class="student-text-edit">
							<input type="hidden" name="id" value="${student.id}" />
							<h3>Nome: <input type="text" name="nome" value="${student.nome}"/></h3>
							<h3>Anivers�rio: 
								<input type="text" id="datepicker" name="dataNascimento" value="<fmt:formatDate value="${student.dataNascimento}" pattern="dd/MM/yyyy"/>" />
								<script>
									$(function() {
										$( "#datepicker" ).datepicker({
											changeMonth: true,
											changeYear: true,
											dateFormat: "dd/mm/yy"
										});
									});
								</script>
							</h3>
							<h3>Ciclo: 
								<select name="period">
									<c:forEach items="${periodsList}" var="periods">
									<option>${periods.id}-${periods.nome}</option>
									</c:forEach>
								</select>
							</h3>
							<h3>M�e: <input type="text" name="nomeMae" value="${student.nomeMae}" /></h3>
							<h3>Pai: <input type="text" name="nomePai" value="${student.nomePai}" /></h3>
							<h3>Telefone: <input type="text" name="telefone" value="${student.telefone}" /></h3>
							<h3>Ins�ra uma foto:
								<input type="file" id="image" name="image" onchange="readURL(this,'mini_foto_new');" />
							</h3>
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
							<div class="student-edit-submit ">
								<input type="submit" value="Editar"/>
							</div>
						</div>				
					</div>
				</div>
			</form>
		</section>
		
		<jsp:include page="/footer.jsp"/>
	</body>
</html>