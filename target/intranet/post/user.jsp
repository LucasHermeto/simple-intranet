<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/head.jsp">
		<jsp:param value="${evangelizer.nome}" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="/header.jsp" />
	
		<section>
			<div class="user">
				<div class="user-info container">
					<div class="user-info-img">
						<img src="<%=request.getContextPath() %>/resources/evangelizers/${evangelizer.id}.jpg" 
						class="img-evangelizer img-responsive" />
					</div>
					<div class="user-info-txt">
						<h1>${evangelizer.nome}</h1>
						<h3>
							<a href="mailto:${evangelizer.email}" title="Envie um email">${evangelizer.email}</a>
						</h3>
						<h3>${evangelizer.ciclo.nome}</h3>
					</div>
					<c:if test="${evangelizer.usuario.id == userLogged.id || userLogged.rule == 'ADMIN'}">
						<div class="edit">
							<span><a
								href="/intranet/post/edit/evangelizer/${evangelizer.id}">Editar</a></span>
						</div>
					</c:if>
				</div>
				<div class="tabs container">
					<ul class="user-menu">
						<li><a id="aulaTab" href="#aulas">Aulas</a></li>
						<li><a href="#alunos">Alunos</a></li>
					</ul>
					<div class="panelContainer">
						<div id="aulas" class="posts-user panel">
							<c:forEach var="postagens" items="${evangelizer.usuario.postagens}">
								<div class="posts-container" id="post_${postagens.id}">
									<div class="posts-container-name">
										<a href="/intranet/post/topics/${postagens.topico.id}/postagens/${postagens.id}">${postagens.nome} - ${postagens.topico.nome}</a>
									</div>
									<c:if test="${evangelizer.usuario.id == userLogged.id || userLogged.rule == 'ADMIN'}">
										<a href="#" class="remove remove-post" onclick="removePost(${postagens.id})"></a>
									</c:if>
									<div class="posts-container-text">
										<div id="text" class="post-container-text-review">${postagens.descricao}<span>[...]</span></div>
										<div class="posts-container-text-creator">
											<span>Por:</span>
											<a href="/intranet/post/user/${postagens.usuario.id}">${postagens.usuario.evangelizador.nome}</a><br>
											<span><fmt:formatDate value="${postagens.data}" pattern="dd/MM/yyyy' às: 'hh:mm a"/></span>
										</div>
									</div>
								</div>
							</c:forEach>
							<div id="aulas-paginator">
								<div id="aulas-cont2"></div>
							</div>
						</div>
						<div id="alunos" class="panel">
							<div class="period-students-box">
								<c:forEach items="${evangelizer.ciclo.students}" var="student">
									<div class="student-box" id="student_${student.id}">
										<a href="/intranet/post/student/${student.id}"> <img
											src="/intranet/resources/students/${student.id}.jpg" width="280"
											height="280" /> <span>${student.nome}</span>
										</a>
										<c:if test="${userLogged.rule == 'ADMIN' || evangelizer.usuario.id == userLogged.id}">
											<a href="#" onclick="removeStudent(${student.id})" class="remove remove-student"></a>
										</c:if>
									</div>
								</c:forEach>
								<div class="new-contact">
									<a href="/intranet/post/add/student-form"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<div class=button-up>
			<img src="<%=request.getContextPath() %>/resources/css/imgs/top-botton.png">
		</div>
	
		<jsp:include page="/footer.jsp" />
	</body>
</html>