<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="Tópicos" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp"/>
		
		<section>
			<div class="topics">
				<div class="topics-text">
					<p>Escolha um tópico:</p>
				</div>
				<c:forEach var="topicos" items="${topicsList}">
					<div class="topics-bar" id="topic_${topicos.id}">
						<div class="topics-name">
							<a href="/intranet/post/topics/${topicos.id}/postagens">${topicos.nome}</a>
						</div>
						<c:if test="${userLogged.rule == 'ADMIN'}">
							<a href="#" class="remove remove-topic" onclick="removeTopic(${topicos.id})"></a>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</section>
		
		<jsp:include page="/footer.jsp"/>
	</body>
</html>