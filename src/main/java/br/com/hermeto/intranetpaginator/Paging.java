package br.com.hermeto.intranetpaginator;

import java.util.List;

public interface Paging {
	
	int totalPages(List<?> objects, double numberPerPage);

}
