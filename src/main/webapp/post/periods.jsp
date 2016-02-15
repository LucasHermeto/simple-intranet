<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Ciclos" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp"/>
		
		<section>
			<div class="topics">
				<div class="topics-text">
					<p>Escolha um Ciclo:</p>
				</div>
				<c:forEach var="ciclo" items="${periodList}">
					<c:if test="${ciclo.id != 1 }">
						<div class="topics-bar" id="topic_${ciclo.id}">
							<div class="topics-name">
								<a href="/intranet/post/periods/${ciclo.id}/students">${ciclo.nome}</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp"/>
	</body>
</html>