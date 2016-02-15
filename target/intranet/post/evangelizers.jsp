<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Evangelizadores" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp"/>
		
		<section>
			<c:if test="${message != null}">
				<div class="message">${message}</div>
			</c:if>
			<c:if test="${erro != null}">
				<div class="message-erro">${erro}</div>
			</c:if>
			<c:forEach var="evangelizer" items="${evangelizersList}" >
				<div id="evangelizer_${evangelizer.id}" class="evangelizers">
					<div class="evangelizers-img">
						<a href="/intranet/post/user/${evangelizer.id}">
							<img src="<%=request.getContextPath() %>/resources/evangelizers/${evangelizer.id}.jpg"
								width="280" height="280" class="img-evangelizer"/>
						</a>
					</div>
					<c:if test="${userLogged.rule == 'ADMIN'}">
							<a href="#" onclick="removeEvangelizer(${evangelizer.id})" class="remove remove-evangelizer"></a>
					</c:if>
					<div class="evangelizers-info">
						<div>
							<h3>${evangelizer.nome}</h3>
							<h4>
								<a href="mailto:${evangelizer.email}" title="Envie um email">${evangelizer.email}</a>
							</h4>
							<h4><span>Ciclo:</span>${evangelizer.ciclo.nome}</h4>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:if test="${userLogged.rule == 'ADMIN'}">
				<div class="new-contact">
					<a href="/intranet/post/add/evangelizer-form"></a>
				</div>
			</c:if>
		</section>
		
		<jsp:include page="/footer.jsp"/>
	</body>
</html>