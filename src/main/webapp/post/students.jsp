<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Alunos" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp" />
		
		<section>
			<c:if test="${message != null}">
				<div class="message">${message}</div>
			</c:if>
			<c:if test="${erro != null}">
				<div class="message-erro">${erro}</div>
			</c:if>
			<div class="period">
				<div class="period-name">${ciclo}</div>
				<div class="period-students">
					<div class="period-students-box">
						<c:forEach items="${students}" var="student">
							<div class="student-box" id="student_${student.id}">
								<a href="/intranet/post/student/${student.id}">
									<img src="/intranet/resources/students/${student.id}.jpg"
										width="280" height="280"/>
									<span>${student.nome}</span>
								</a>
								<c:if test="${userLogged.rule == 'ADMIN' || ciclo == userLogged.evangelizador.ciclo.nome }">
									<a href="#" onclick="removeStudent(${student.id})" class="remove remove-student"></a>
								</c:if>
							</div>
						</c:forEach>
						<c:if test="${ciclo == userLogged.evangelizador.ciclo.nome || userLogged.rule == 'ADMIN'}">
							<div class="new-contact">
								<a href="/intranet/post/add/student-form"></a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</section>
			
		<jsp:include page="/footer.jsp" />
	</body>
</html>
