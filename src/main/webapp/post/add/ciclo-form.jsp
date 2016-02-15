<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Ciclo Tópico" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section>
			<div class="student-form">
				<div class="post-form-text">
					<p>Adicione um Ciclo:</p>
				</div>
				<form action="ciclo" method="post" id="ciclo">
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