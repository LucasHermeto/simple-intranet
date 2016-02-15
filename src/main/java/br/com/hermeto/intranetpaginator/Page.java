package br.com.hermeto.intranetpaginator;

import java.util.List;

public class Page implements Paging{
	
	private int pageLength;
	
	@Override
	public int totalPages(List<?> objects, double numberPerPage) {		
		float pageLengthRound = (float) (objects.size() / numberPerPage);
		pageLength = (int) Math.ceil(pageLengthRound); 
		
		return pageLength;
	}
}
