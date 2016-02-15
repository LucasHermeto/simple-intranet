<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="${student.nome}" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp"/>
		
		<section>
			<div class="student-container">
				<div class="student-info">
					<div class="student-box">
						<img src="/intranet/resources/students/${student.id}.jpg"
												width="280" height="280"/>
					</div>
					<div class="student-text">
						<h1>Nome: ${student.nome}</h1>
						<h3>Aniversário: <fmt:formatDate value="${student.dataNascimento}" pattern="dd/MM/yyyy"/></h3>
						<h3>Ciclo: ${student.ciclo.nome}</h3>
						<h3>Mãe: ${student.nomeMae}</h3>
						<h3>Pai: ${student.nomePai}</h3>
						<h3>Telefone: ${student.telefone}</h3>
					</div>
					<c:forEach items="${student.ciclo.evangelizers}" var="evangelizer">
						<c:if test="${userLogged.rule == 'ADMIN' || userLogged.evangelizador.id == evangelizer.id}">
							<div class="edit">
								<span><a href="/intranet/post/edit/student/${student.id}">Editar</a></span>
							</div>
						</c:if>
						
					</c:forEach>		
				</div>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp"/>
	</body>
</html>