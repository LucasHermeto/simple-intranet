<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="head.jsp">
		<jsp:param value="Bem vindo" name="title"/>
	</jsp:include>
	<body>
		<jsp:include page="header.jsp" />
		<script>
			$('.carousel').carousel({
				interval: 2000
			})
		</script>
		<section class="index">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
		
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="/intranet/resources/css/imgs/slide-show/1.jpg" class="center">
					</div>
					<div class="item">
						<img src="/intranet/resources/css/imgs/slide-show/2.jpg" class="center">
					</div>
					<div class="item">
						<img src="/intranet/resources/css/imgs/slide-show/3.jpg" class="center">
					</div>
					<div class="item">
						<img src="/intranet/resources/css/imgs/slide-show/4.jpg" class="center">
					</div>
				</div>
		
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> 
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> 
				<a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</section>
		<jsp:include page="footer.jsp" />
	</body>
</html>