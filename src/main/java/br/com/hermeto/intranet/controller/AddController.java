package br.com.hermeto.intranet.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.hermeto.intranet.dao.EvangelizerDao;
import br.com.hermeto.intranet.dao.PeriodDao;
import br.com.hermeto.intranet.dao.PostDao;
import br.com.hermeto.intranet.dao.StudentDao;
import br.com.hermeto.intranet.dao.UserDao;
import br.com.hermeto.intranet.model.Evangelizer;
import br.com.hermeto.intranet.model.Period;
import br.com.hermeto.intranet.model.Post;
import br.com.hermeto.intranet.model.Student;
import br.com.hermeto.intranet.model.Topic;
import br.com.hermeto.intranet.model.User;
import br.com.hermeto.util.EncryptPassword;
import br.com.hermeto.util.StringUtils;

@Controller
@RequestMapping("/post/add")
public class AddController extends br.com.hermeto.intranet.controller.Controller{
	@Autowired
	private PostDao postDao;
	@Autowired
	private EvangelizerDao evangelizerDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private PeriodDao periodDao;
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("add")
	public String add(){
		return "post/add/add";
	}
	
	@RequestMapping("student-form")
	public String studentForm(Model model, HttpServletRequest request){
		List<?> periods = new ArrayList<>();
		periods = periodDao.getPeriods();
		
		model.addAttribute("periodsList", periods);
		return "post/add/student-form";
	}
	
	@RequestMapping("student")
	public String addStudent(HttpServletRequest request,
			@RequestParam("image") MultipartFile image, Model model){
		
		Student student = new Student();
		
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
			return "post/welcome";
		}
		
		String nomeMae = request.getParameter("nomeMae");
		student.setNomeMae(nomeMae);
		
		String nomePai = request.getParameter("nomePai");
		student.setNomePai(nomePai);
		
		String telefone = request.getParameter("telefone");
		student.setTelefone(telefone);
		
		String endereco = request.getParameter("endereco");
		student.setEndereco(endereco);
		
		studentDao.addStudent(student);
		
		if(!image.isEmpty()){
			try {
				addFile("students", student.getId(), image);
			} catch (IOException e) {
				model.addAttribute("erro", "Erro ao copiar o arquivo");
				return "post/welcome";
			}
		}
		model.addAttribute("message", "O seu Aluno foi adicionada com sucesso");
		return "post/welcome";
	}

	@RequestMapping("post-form")
	public String postForm(Model model) {
		List<?> topics = postDao.getTopics();
		model.addAttribute("topicsList", topics);
		
		return "post/add/post-form";
	}

	@RequestMapping("post")
	public String addPost(@RequestParam("files") MultipartFile files[],
			Model model, HttpServletRequest request) {
		
		// Creating post
		Post post = new Post();
		
		String nome = request.getParameter("nome");
		post.setNome(nome);
		
		String descricao = request.getParameter("descricao");
		post.setDescricao(descricao);
		
		Date data = new Date(System.currentTimeMillis());
		post.setData(data);
		
		String newTopicName = request.getParameter("topic");
		Topic topic = postDao.searchTopic(newTopicName);
		post.setTopico(topic);
		
		User user = (User) request.getSession().getAttribute("userLogged");
		post.setUsuario(user);
		
		Period ciclo = user.getEvangelizador().getCiclo();
		post.setCiclo(ciclo);
		
		postDao.addPost(post);
		if(files.length != 0 ){
			for(MultipartFile file : files){
				String name = file.getOriginalFilename();
				
				try {
					byte[] bytes = file.getBytes();
					
					// Creating the directory to store file
					Long postId = post.getId();
					File dir = new File(path + "posts/" + postId);
					if (!dir.exists())
						dir.mkdirs();
					
					// Create the file on server
					File serverFile = new File(dir.getAbsolutePath()
							+ File.separator + StringUtils.normalizeFilename(name));
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					
				} catch (Exception e) {
					model.addAttribute("erro", "Caso não tenha adicionado nenhum arquivo ignore esse erro - "
							+ "Falha no upload do arquivo:" + name + "(" + e.getMessage() + ")");
					return "post/welcome";
				}
			}
		}
		model.addAttribute("message", "A sua postagem foi adicionada com sucesso");
		
		return "post/welcome";
	}
	
	@RequestMapping("evangelizer-form")
	public String evangelizerForm(Model model,
			HttpSession session){
		User user = (User) session.getAttribute("userLogged");
		User userRule = new User();
		userRule.setRule("ADMIN");
		
		if(user.getRule().equals(userRule.getRule())){
		
			List<?> periods = periodDao.getPeriods();
			model.addAttribute("periodsList", periods);
			
			return "post/add/evangelizer-form";
		}
		return "post/welcome";
	}
	
	@RequestMapping("evangelizer")
	public String addEvangelizer(@RequestParam("image") MultipartFile image,
			Model model, HttpServletRequest request) throws NoSuchAlgorithmException{
		Evangelizer evangelizer = new Evangelizer();
		
		String nome = request.getParameter("nome");
		evangelizer.setNome(nome);
		
		String email = request.getParameter("email");
		evangelizer.setEmail(email);
		
		String newPeriodName = request.getParameter("ciclo");
		Period period = periodDao.searchPeriod(newPeriodName);
		evangelizer.setCiclo(period);
		
		User user = new User();
		user.setLogin(email);
		if(userDao.checksUser(user)){
			model.addAttribute("erro", "Email do Usuário já existe");
			return "post/add/evangelizer-form";
		}
		user.setSenha(EncryptPassword.convertPassword(request.getParameter("senha")));
		user.setEvangelizador(evangelizer);
		
		evangelizer.setUsuario(user);
		
		evangelizerDao.add(evangelizer);
		
		if(!image.isEmpty()){
			try {
				addFile("evangelizers", evangelizer.getId(), image);
			} catch (IOException e) {
				model.addAttribute("erro", "Erro ao copiar o arquivo");
				return "post/welcome";
			}
		}
		
		model.addAttribute("message", "O seu Evangelizador foi adicionada com sucesso");
		return "post/welcome";
		
	}
	
	@RequestMapping("topic-form")
	public String topicForm(HttpSession session){
		User user = (User) session.getAttribute("userLogged");
		User userRule = new User();
		userRule.setRule("ADMIN");
		
		if(user.getRule().equals(userRule.getRule())){
			return "post/add/topic-form";
		}
		return "post/welcome";
	}
	
	@RequestMapping("topic")
	public String addTopic(Model model,
			HttpServletRequest request, Topic topic){
		
		Date data = new Date(System.currentTimeMillis());
		topic.setData(data);
		
		postDao.addTopic(topic);
		
		model.addAttribute("message", "O T�pico foi adicionado com sucesso");
		
		return "post/welcome";
	}
	
	@RequestMapping("ciclo-form")
	public String cicloForm(HttpSession session){
		User user = (User) session.getAttribute("userLogged");
		User userRule = new User();
		userRule.setRule("ADMIN");
		
		if(user.getRule().equals(userRule.getRule())){
			return "post/add/ciclo-form";
		}
		return "post/welcome";
	}
	
	@RequestMapping("ciclo")
	public String addCiclo(Model model,
			HttpServletRequest request, Period period){
		periodDao.add(period);
		
		model.addAttribute("message", "O Ciclo foi adicionando com sucesso");
		
		return "post/welcome";
	}

}
