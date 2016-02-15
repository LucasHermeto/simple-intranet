<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta http-equiv="Content-Type" content="utf-8">
	<meta name="viewport" content="width=device-width">
	<title><%= request.getParameter("title") %></title>
	<link type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<link type="text/css" href="<%=request.getContextPath() %>/resources/css/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
	<link type="text/css" href="<%=request.getContextPath() %>/resources/css/themes/ui-lightness/jquery.ui.datepicker.css" rel="stylesheet">
	<link type="text/css" href="/intranet/resources/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.10.2.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-ui-1.10.4.custom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.slides.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js" ></script>
	<script src="/intranet/resources/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/paginator.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/resources/js/validator.js" charset="utf-8"></script>
	<script>
		$(document).ready(function(){
			$('.form-text input[type="image"]').hover(
					function(){
						rotate('+');
					}, // end mouseover
					function(){
						rotate('-');
					} // end mouseout
			); // end hover
		}); // end ready
		
 		function rotate(side){
			for(var i = 0; i <= 72; i++ ){
				var girar = i * 5;
				
				/* Mozilla */
				document.getElementById("image").style.transform = "rotate(" + side +"" + girar +"deg)";
				/* Opera, Chrome, and Safari */
				document.getElementById("image").style.WebkitTransform = "rotate(" + side +"" + girar +"deg)";
				/* IE 9 */
				document.getElementById("image").style.msTransform = "rotate(" + side +"" + girar +"deg)";
				
				/* Adiciona Atraso */
				document.getElementById("image").style.WebkitTransitionDuration = "1s";
				document.getElementById("image").style.transitionDuration = "1s";
			}
		}; 
	</script>
	<script>
		$(document).ready(function() {
			$('.user-menu a').click(function(){
				$this = $(this);
				$('.panel').slideUp();
				$('.user-menu a.active').removeClass('active');
				$this.addClass('active').blur();
				var panel = $this.attr('href');
				$(panel).slideDown(2000);
				return false;
			}); // end click
			
			$('.user-menu li:first a').click();
			
		}); // end ready
	</script>
	<script title="button-up">
		$(function(){
			var documentSize = $(document).height();
			var sizeWindow = $(window).height() + 80;
			
			$(window).scroll(function(){
				var position = $(window).scrollTop();
				$button = $(".button-up");
				if(position >= sizeWindow - (sizeWindow/3)){
					$button.fadeIn("slow");
					
				} else{
					$button.fadeOut("slow");
				}
			});
			$(".button-up").click(function(){
				$('body,html').animate({scrollTop:0},1000);
			});
		});
	</script>
	<script>
		$(document).ready(function(){
			//scrollPaginator
			var element = document.getElementById("aulas-paginator");
			var documentSize = $(document).height();
			var sizeWindow = $(window).height() + 80;
			var page = 2;
			$(window).scroll(function () {
				//Verify if we are on aulaTab
				if($('#aulaTab').hasClass('active')){
					if(page <= '${pages}'){
						documentSize = $(document).height();
						sizeWindow = $(window).height();
						var posicaoAtual = $(window).scrollTop();
			 			if ( posicaoAtual >= (documentSize - sizeWindow) ) {
			 				console.log(page);
							$("#aulas-cont" + page).load("/intranet/post/user-posts/${userLogged.id}/pagina/" + page);
							page++;
							
							var div = document.createElement("div");
							div.setAttribute("id", "aulas-cont" + page);
							element.appendChild(div);
							
						}
					} else{
						$("#aulas-cont" + page).html("Todas as aulas foram carregadas!")
							.attr("class", "end");
					}
				}
			});
		});
	</script>
	<c:if test="${userLogged.rule == 'ADMIN' || evangelizer.usuario.id == userLogged.id}">
		<script>
			function removeStudent(id){
				if(confirm("Você realmente deseja remover esse Aluno?")){
					$.post("/intranet/post/removeStudent", {'id' : id});
					$("#student_" + id).remove();
				}
			}
		</script>
		<script>
			function removePost(id){
				if(confirm("Você realmente deseja remover essa Aula?")){
					$.post("/intranet/post/removePost", {'id' : id});
					$("#post_" + id).remove();
				}
			}
		</script>
	</c:if>
	<c:if test="${userLogged.rule == 'ADMIN'}">
		<script type="text/javascript">
			function removeEvangelizer(id){
				if(confirm("Você realmente deseja remover esse Evangelizador?")){
					$.post("/intranet/post/removeEvangelizer", {'id' : id});
					$("#evangelizer_" + id).remove();
				}
			}
		</script>
		<script>
			function removeTopic(id){
				if(confirm("Você realmente deseja remover esse Topico?")){
					$.post("/intranet/post/removeTopic", {'id' : id});
					$("#topic_" + id).remove();
				}
			}
		</script>
	</c:if>
	<style>
	    #slides {
	      display: none;
	    }
	
	    #slides .slidesjs-navigation {
	      margin-top:5px;
	    }
	
	    a.slidesjs-next,
	    a.slidesjs-previous,
	    a.slidesjs-play,
	    a.slidesjs-stop {
	      background-image: url(resources/css/imgs/slide-show/btns-next-prev.png);
	      background-repeat: no-repeat;
	      display:block;
	      width:12px;
	      height:18px;
	      overflow: hidden;
	      text-indent: -9999px;
	      float: left;
	      margin-right:5px;
	    }
	
	    a.slidesjs-next {
	      margin-right:10px;
	      background-position: -12px 0;
	    }
	
	    a:hover.slidesjs-next {
	      background-position: -12px -18px;
	    }
	
	    a.slidesjs-previous {
	      background-position: 0 0;
	    }
	
	    a:hover.slidesjs-previous {
	      background-position: 0 -18px;
	    }
	
	    a.slidesjs-play {
	      width:15px;
	      background-position: -25px 0;
	    }
	
	    a:hover.slidesjs-play {
	      background-position: -25px -18px;
	    }
	
	    a.slidesjs-stop {
	      width:18px;
	      background-position: -41px 0;
	    }
	
	    a:hover.slidesjs-stop {
	      background-position: -41px -18px;
	    }
	
	    .slidesjs-pagination {
	      margin: 7px 0 0;
	      float: right;
	      list-style: none;
	    }
	
	    .slidesjs-pagination li {
	      float: left;
	      margin: 0 1px;
	    }
		
	    .slidesjs-pagination li a {
	      display: block;
	      width: 13px;
	      height: 0;
	      padding-top: 13px;
	      background-image: url(resources/css/imgs/slide-show/pagination.png);
	      background-position: 0 0;
	      float: left;
	      overflow: hidden;
	    }
	
	    .slidesjs-pagination li a.active,
	    .slidesjs-pagination li a:hover.active {
	      background-position: 0 -13px
	    }
	
	    .slidesjs-pagination li a:hover {
	      background-position: 0 -26px
	    }
	
	    #slides a:link,
	    #slides a:visited {
	      color: #333
	    }
	
	    #slides a:hover,
	    #slides a:active {
	      color: #9e2020
	    }
	
	    .navbar {
	      overflow: hidden
	    }
	    
	    
	  	.thumb {
	  	  height: 75px;
	  	  border: 1px solid #000;
	  	  margin: 10px 5px 0 0;
	  	}
	</style>
</head>