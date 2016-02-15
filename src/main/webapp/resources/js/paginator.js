function paginator(totalPages, element, thisPage, url){
	
	//Converting the url
	if(url.search("pagina") != -1){
		url = url.slice(0, (url.lastIndexOf("pagina")-1));
	}
	
	var sectionElement = document.createElement("div");
	sectionElement.setAttribute("class", "pagination-numbers");
	
	// function to create paginator
	function createPages(){
		var para = document.createElement("span");
		if(i == thisPage){
			var node = document.createTextNode(i );
			para.setAttribute("class", "paginator selected");
			para.appendChild(node);
		}else{
			var subPara = document.createElement("a");
			var node = document.createTextNode(i);
			subPara.appendChild(node);
			subPara.setAttribute("href", url + "/pagina/" + i);
			para.setAttribute("class", "paginator");
			para.appendChild(subPara);
		}
		
		sectionElement.appendChild(para);
		element.appendChild(sectionElement);
	}
	
	function createInformer(actualPage){
		//Inform total of pages
		var paraPages = document.createElement("span");
		var nodePages = document.createTextNode("Página " + actualPage + " de " + totalPages);
		var wrapping = document.createElement("br");
		
		paraPages.setAttribute("class", "informer");
		
		paraPages.appendChild(nodePages);
		element.appendChild(paraPages);
		element.appendChild(wrapping);
	}
	
	function createElements(text,page){
		var firstPara  = document.createElement("span");
		var subFirstPara = document.createElement("a");
		var firstNode = document.createTextNode(text);
		
		// create the attributes of the 'a' element
		subFirstPara.setAttribute("href", url + "/pagina/" + page)
		// create the attributes of the 'span' element
		firstPara.setAttribute("class", "paginator");
		
		subFirstPara.appendChild(firstNode);
		firstPara.appendChild(subFirstPara);
		sectionElement.appendChild(firstPara);
		element.appendChild(sectionElement);
	}
	
	// Verify if have to do pagination
	if(totalPages > 1){
		if(isNaN(thisPage) == false){
			createInformer(thisPage);
			if((thisPage-1) != 0){
				if((thisPage-1) >= 3){
					createElements("<< Primeira", 1);
				}
				createElements("<<", (thisPage-1));
			}
		} else{
			createInformer(1);
			thisPage = 1;
		}
		
		// Create pagination to number of pages less than other number like (6)
		var totalPaginatorNumber = 4;
		console.log(thisPage < totalPaginatorNumber)
		if(thisPage < totalPaginatorNumber){
			for(i = 1; i < totalPages+1; i++){
				createPages();
			}
		}else{
			var test = parseInt(thisPage) + 3;
			
			if(thisPage > 2){
				if(test > totalPages){
					test-=1;
					for(i = thisPage - 2; i < test; i++){
						if(i == totalPages){
							test-=1;
							createPages();
						}else{
							createPages();
						}
					}
				}else{
					for(i = thisPage - 2; i < test; i++){
						createPages();
					}
				}
			}else{
				for(i = thisPage; i < test; i++){
					createPages();
				}
			}
		}
		
		// Create a ref to the last page
		if(thisPage != (totalPages)){
			createElements(">>", (thisPage+1));
			if(thisPage != (totalPages-1))
				createElements("Última >>", totalPages);
		}
	}
}