<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
		<title>${evangelizer.nome}</title>
		<script src="<%=request.getContextPath() %>/resources/js/jquery-1.10.2.js"></script>
		<script src="<%=request.getContextPath() %>/resources/js/jquery.validate.min.js"></script>
		<script>
			$(document).ready(function(){
				$('#evangelizer').validate({
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
			<div class="user">
				<form action="edit-evangelizer" method="post" enctype="multipart/form-data" id="evangelizer" name="form">
					<div class="user-info container">
						<div class="user-info-img">
							<img id="mini_foto_new" class="mini_foto" src="<%=request.getContextPath() %>/resources/evangelizers/${evangelizer.id}.jpg"
								width="280" height="280"/>
						</div>
						<div class="user-info-txt-edit">
							<input type="hidden" name="id" value="${evangelizer.id}" />
							<h3>Nome: <input type="text" name="nome" value="${evangelizer.nome}" /></h3>
							<h3>Email: <input type="email" name="email" value="${evangelizer.email}" /></h3>
							<h3>Ciclo: 
								<select name="ciclo">
									<c:forEach items="${periodsList}" var="periods">
									<option>${periods.id}-${periods.nome}</option>
									</c:forEach>
								</select>
							</h3>
							<h3>Insíra uma foto:
								<input type="file" id="image" name="image" onchange="readURL(this,'mini_foto_new');" />
							</h3>
							<script>
								function readURL(input, id) {
							            if (input.files && input.files[0]) {
							                var reader = new FileReader();
							
							                reader.onload = function (e) {
							                    $('#'+id)
												.attr('src', e.target.result);
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
				</form>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp" />
	</body>
</html>