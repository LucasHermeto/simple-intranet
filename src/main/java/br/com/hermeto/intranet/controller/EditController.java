package br.com.hermeto.intranet.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.hermeto.intranet.dao.EvangelizerDao;
import br.com.hermeto.intranet.dao.PeriodDao;
import br.com.hermeto.intranet.dao.PostDao;
import br.com.hermeto.intranet.dao.StudentDao;
import br.com.hermeto.intranet.model.Evangelizer;
import br.com.hermeto.intranet.model.Period;
import br.com.hermeto.intranet.model.Post;
import br.com.hermeto.intranet.model.Student;
import br.com.hermeto.intranet.model.User;
import br.com.hermeto.util.EncryptPassword;

@Controller
@RequestMapping("post/edit")
public class EditController extends br.com.hermeto.intranet.controller.Controller{
	
	@Autowired
	private PostDao postDao;
	@Autowired
	private EvangelizerDao evangelizerDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private PeriodDao periodDao;
	
	@RequestMapping("evangelizer/{evangelizerId}")
	public String editEvangelizer(@PathVariable Long evangelizerId, Model model){
		Evangelizer evangelizer = evangelizerDao.getEvangelizerById(evangelizerId);
		model.addAttribute("evangelizer", evangelizer);
		
		List<?> periodsList = periodDao.getPeriods();
		model.addAttribute("periodsList", periodsList);
		
		return "post/edit/edit-evangelizer";
	}
	
	@RequestMapping("evangelizer/edit-evangelizer")
	public String editEvangelizer(@RequestParam("image") MultipartFile image,
			Model model, HttpServletRequest request) throws NoSuchAlgorithmException{
		Evangelizer evangelizer = new Evangelizer();
		
		String id = request.getParameter("id");
		Long idLong = Long.parseLong(id);
		evangelizer.setId(idLong);
		
		String nome = request.getParameter("nome");
		evangelizer.setNome(nome);
		
		String email = request.getParameter("email");
		evangelizer.setEmail(email);
		
		String newPeriodName = request.getParameter("ciclo");
		Period period = periodDao.searchPeriod(newPeriodName);
		evangelizer.setCiclo(period);
		
		String senha = request.getParameter("senha");
		User user = new User();
		user.setLogin(email);
		user.setSenha(EncryptPassword.convertPassword(senha));
		
		evangelizer.setUsuario(user);
		
		evangelizerDao.update(evangelizer, user, request.getParameter("oldLogin"));
		
		if(!image.isEmpty()){
			try {
				addFile("evangelizers", evangelizer.getId(), image);
			} catch (IOException e) {
				model.addAttribute("erro", "Erro ao copiar o arquivo");
				return "post/evangelizers";
			}
		}
		model.addAttribute("message", "Atualização realizada com sucesso!");
		
		List<?> evangelizers = evangelizerDao.getEvangelizers();
		model.addAttribute("evangelizersList", evangelizers);
		
		return "post/evangelizers";
	}
	
	@RequestMapping("student/{studentId}")
	public String editStudent(@PathVariable Long studentId, Model model){
		Student student = studentDao.getStudentById(studentId);
		model.addAttribute("student", student);
		
		List<?> periodsList = periodDao.getPeriods();
		model.addAttribute("periodsList", periodsList);
		
		return "post/edit/edit-student";
		
	}
	
	@RequestMapping("student/edit-student")
	public String editStudent(@RequestParam("image") MultipartFile image,
			Model model, HttpServletRequest request){
		Student student = new Student();
		
		String id = request.getParameter("id");
		Long idLong = Long.parseLong(id);
		student.setId(idLong);
		
		String nome = request.getParameter("nome");
		student.setNome(nome);
		
		String newPeriodName = request.getParameter("period");
		Period period = periodDao.searchPeriod(newPeriodName);
		student.setCiclo(period);
		
		try {
			String dataEmTexto = request.getParameter("dataNascimento");
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
			student.setDataNascimento(date);
		} catch (ParseException e) {
			model.addAttribute("erro", "Erro ao formatar a data");
			
			List<?> periods = periodDao.getPeriods();
			model.addAttribute("ciclos", periods);
			
			return "post/students";
		} catch (NullPointerException e){
			model.addAttribute("erro", "Erro ao formatar a data");
			
			List<?> periods = periodDao.getPeriods();
			model.addAttribute("ciclos", periods);
			
			return "post/students";
		}
		
		String nomeMae = request.getParameter("nomeMae");
		student.setNomeMae(nomeMae);
		
		String nomePai = request.getParameter("nomePai");
		student.setNomePai(nomePai);
		
		String telefone = request.getParameter("telefone");
		student.setTelefone(telefone);
		
		String endereco = request.getParameter("endereco");
		student.setEndereco(endereco);
		
		studentDao.updateStudent(student);
		
		if(!image.isEmpty()){
			try {
				addFile("students", student.getId(), image);
			} catch (IOException e) {
				model.addAttribute("erro", "Erro ao copiar o arquivo");
				return "post/welcome";
			}
		}
		
		model.addAttribute("message", "O seu Aluno foi editado com sucesso");
		
		List<?> periods = periodDao.getPeriods();
		model.addAttribute("ciclos", periods);
		return "post/students";
	}
	
	@RequestMapping("post/{postId}")
	public String editPost(@PathVariable Long postId,
			Model model){
		Post post = postDao.getPostById(postId);
		
		File filePath = new File(path + "posts/" + post.getId());
		
		if(filePath.exists()){
			File[] files = filePath.listFiles();
			List<String> fileName = new ArrayList<>();
			for(File file : files){
				fileName.add(file.getName());
			}
			
			model.addAttribute("fileName", fileName);
		}
		
		model.addAttribute("post", post);
		
		return "post/edit/edit-post";
	}
	
	@RequestMapping("post/edit-post")
	public String editPost(HttpServletRequest request,
			Model model){
		Post post = new Post();
		
		String titulo = request.getParameter("nome");
		post.setNome(titulo);
		String descricao = request.getParameter("descricao");
		post.setDescricao(descricao);
		Date data = new Date(System.currentTimeMillis());
		post.setDateLastEdit(data);
		Long id = Long.parseLong(request.getParameter("id"));
		post.setId(id);
		
		postDao.updatePost(post);
		
		model.addAttribute("message", "A sua Postagem foi editada com sucesso");
		
		return "post/welcome";
	}

}
