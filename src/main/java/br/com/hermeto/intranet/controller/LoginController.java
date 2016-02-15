package br.com.hermeto.intranet.controller;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.hermeto.intranet.dao.UserDao;
import br.com.hermeto.intranet.model.User;
import br.com.hermeto.util.EncryptPassword;

@Controller
@RequestMapping("/")
public class LoginController {
	
	@Autowired
	private UserDao dao;
	
	@RequestMapping("login")
	public String login(){
		return "login-form";
	}
	
	@RequestMapping("entrar")
	public String efetuaLogin(HttpSession session, User usuario,
			HttpServletRequest request, Model model) throws NoSuchAlgorithmException{
		usuario.setSenha(EncryptPassword.convertPassword(usuario.getSenha()));
		if(dao.existsUser(usuario)){
			User userLogged = dao.searchUser(usuario.getLogin());
			session.setAttribute("userLogged", userLogged);
			return "post/welcome";
		}
		
		if(request.getSession().getAttribute("userLogged") != null){
			return "post/welcome";
		}
		
		model.addAttribute("erro", true);
		return "login-form";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:login";
	}

}
