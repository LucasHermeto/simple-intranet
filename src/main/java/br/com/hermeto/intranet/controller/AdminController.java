package br.com.hermeto.intranet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.hermeto.intranet.dao.EvangelizerDao;

@Controller
@RequestMapping("/admin/post")
public class AdminController {
	
	@Autowired
	EvangelizerDao evangelizerDao;
	
	@RequestMapping("removeEvangelizer")
	public void removeEvangelizer(Long id){
		evangelizerDao.remove(id);
	}

}
