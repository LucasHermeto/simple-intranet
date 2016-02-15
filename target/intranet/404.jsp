<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<jsp:include page="head.jsp">
		<jsp:param value="404" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="header.jsp" />
		
		<section>
			<div class="page-erro">
				<div class="page-erro-img">
					<div class="page-erro-text">
						<div class="page-erro-name">Error 404:</div>
						<div>
							Página não encontrada<br>
							<span>Obs: Clique no botão home por favor!</span>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<jsp:include page="footer.jsp" />
	</body>
</html>