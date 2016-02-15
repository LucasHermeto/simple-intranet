package br.com.hermeto.intranet.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.hermeto.intranet.dao.EvangelizerDao;
import br.com.hermeto.intranet.dao.PeriodDao;
import br.com.hermeto.intranet.dao.PostDao;
import br.com.hermeto.intranet.dao.StudentDao;
import br.com.hermeto.intranet.model.Evangelizer;
import br.com.hermeto.intranet.model.Period;
import br.com.hermeto.intranet.model.Post;
import br.com.hermeto.intranet.model.Student;
import br.com.hermeto.intranetpaginator.Page;

@Controller
@RequestMapping("/post")
public class PostController extends br.com.hermeto.intranet.controller.Controller{
	
	@Autowired
	private PostDao postDao;
	@Autowired
	private EvangelizerDao evangelizerDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private PeriodDao periodDao;
	private Page paginator = new Page();
	private final double numberPerPage = 10.0;

	@RequestMapping("home")
	public String home() {
		return "post/welcome";
	}

	@RequestMapping("topics")
	public String topics(Model model) {
		List<?> topics = postDao.getTopics();
		model.addAttribute("topicsList", topics);

		return "post/topics";
	}
	
	private String substring(int value, String description){
		String newString = description.substring(0, value);
		boolean condition = true;
		
		do{
			if(!newString.endsWith(" ")){
				value ++;
				newString = description.substring(0, value);
			} else{
				condition = false;
			}
		}while(condition);
		
		return newString;
	}

	@RequestMapping("topics/{topicosId}/postagens")
	public String postagens(@PathVariable Long topicosId, Model model) {
		List<?> postagens = postDao.getPostsByTopicId(topicosId , 0, (int)numberPerPage);
		int topicId = 0;
		for(int i = 0; i < postagens.size(); i++){
			Post post = (Post) postagens.get(i);
			
			post.setDescricao(substring(post.getDescricao().length() / 4,
					post.getDescricao()));
			topicId = post.getTopico().getId().intValue();
		}
		model.addAttribute("postagensList", postagens);
		
		List<?> allPosts = postDao.getPostsByTopicId(topicosId);
		int postLength = paginator.totalPages(allPosts, numberPerPage);
		model.addAttribute("pages", postLength);
		
		model.addAttribute("thisPage", 1);
		model.addAttribute("topicId", topicId);

		return "post/posts";
	}
	
	@RequestMapping("topics/{topicosId}/postagens/pagina/{pageNumber}")
	public String postPages(@PathVariable Long topicosId,
			@PathVariable Long pageNumber, Model model){
		List<?> postagens;
		if(pageNumber == 1){
			postagens = postDao.getPostsByTopicId(topicosId , 0, (int)numberPerPage);
		}else{
			int first = (int) ((pageNumber-1)*numberPerPage);
			postagens = postDao.getPostsByTopicId(topicosId ,first, (int)numberPerPage);
		}
		int topicId = 0;
		for(int i = 0; i < postagens.size(); i++){
			Post post = (Post) postagens.get(i);
			
			post.setDescricao(substring(post.getDescricao().length() / 4,
					post.getDescricao()));
			topicId = post.getTopico().getId().intValue();
		}
		model.addAttribute("postagensList", postagens);
		
		List<?> allPosts = postDao.getPostsByTopicId(topicosId);
		int postLength = paginator.totalPages(allPosts, numberPerPage);
		model.addAttribute("pages", postLength);
		
		model.addAttribute("thisPage", pageNumber);
		model.addAttribute("topicId", topicId);
		
		return "post/posts";
	}
	
	@RequestMapping("topics/{topicoId}/postagens/{postagemId}")
	public String postagem(@PathVariable Long topicoId, @PathVariable Long postagemId,
			Model model){
		Post post = postDao.getPostById(postagemId);
		model.addAttribute("post", post);
		
		//Getting the files from the path
		File filePath = new File(path + "posts/" + post.getId());
		
		if(filePath.exists()){
			File[] files = filePath.listFiles();
			List<String> fileName = new ArrayList<>();
			for(File file : files){
				fileName.add(file.getName());
			}
			
			model.addAttribute("fileName", fileName);
		}
		
		return "post/post";
	}

	@RequestMapping("evangelizers")
	public String evangelizers(Model model) {
		List<?> evangelizers = evangelizerDao.getEvangelizers();
		model.addAttribute("evangelizersList", evangelizers);

		return "post/evangelizers";
	}

	@RequestMapping("user/{userId}")
	public String user(@PathVariable Long userId, Model model) {
		Evangelizer evangelizer = evangelizerDao.getEvangelizerById(userId);
		if (evangelizer.getNome() == "" || evangelizer.getNome() == null) {
			evangelizer.setNome("null");
			return "post/user";
		}
		
		List<Post> postagens = postDao.getPostByUserId(userId, 0, (int)numberPerPage);
		for(int i = 0; i < postagens.size(); i++){
			Post post = (Post) postagens.get(i);
			
			post.setDescricao(substring(post.getDescricao().length() / 4,
					post.getDescricao()));
		}
		evangelizer.getUsuario().setPostagensList(postagens);
		
		List<?> allPosts = postDao.getPostByUserId(userId);
		int postLength = paginator.totalPages(allPosts, numberPerPage);
		model.addAttribute("pages", postLength);
		
		model.addAttribute("evangelizer", evangelizer);

		return "post/user";
	}
	
	@RequestMapping("user-posts/{userId}/pagina/{pageNumber}")
	public String userPosts(@PathVariable Long userId,
			@PathVariable Long pageNumber, Model model){
		Evangelizer evangelizer = evangelizerDao.getEvangelizerById(userId);
		
		int first = (int) ((pageNumber-1)*numberPerPage);
		List<?> postagens = postDao.getPostByUserId(userId ,first, (int)numberPerPage);
		
		for(int i = 0; i < postagens.size(); i++){
			Post post = (Post) postagens.get(i);
			
			post.setDescricao(substring(post.getDescricao().length() / 4,
					post.getDescricao()));
		}
		model.addAttribute("userPosts", postagens);
		
		model.addAttribute("evangelizer", evangelizer);
		
		return "post/user-posts";
	}
	
	@RequestMapping("periods")
	public String periods(Model model){
		List<?> periods = periodDao.getPeriods();
		model.addAttribute("periodList", periods);
		
		return "post/periods";
	}
	
	@RequestMapping("periods/{periodId}/students")
	public String students(@PathVariable Long periodId,
			Model model){
		List<?> students = studentDao.getStudentsByPeriodId(periodId);
		Period period = periodDao.getPeriodById(periodId);
		model.addAttribute("students", students);
		model.addAttribute("ciclo", period.getNome());
		
		return "post/students";
	}
	
	@RequestMapping("student/{studentId}")
	public String student(@PathVariable Long studentId, Model model){
		Student student = studentDao.getStudentById(studentId);
		model.addAttribute("student", student);
		
		return "post/student";
	}
	
	@RequestMapping("add")
	public String add(){
		return "post/add/add";
	}

	@RequestMapping("removeEvangelizer")
	public void removeEvangelizer(Long id) {
		evangelizerDao.remove(id);
		
		File file = new File(path + "evangelizers/" + id + ".jpg");
		file.delete();
	}
	
	@RequestMapping("removeStudent")
	public void removeStudent(Long id){
		studentDao.remove(id);
		
		File file = new File(path + "students/" + id + ".jpg");
		file.delete();
	}
	
	@RequestMapping("removeTopic")
	public void removeTopic(Long id) {
		postDao.removeTopic(id);
	}

	@RequestMapping("removePost")
	public void removePost(Long id) {
		postDao.removePost(id);
		
		File f = new File(path + "posts/" + id);
		removeFile(f);
	}
	
	public void removeFile (File f) {  
        if (f.isDirectory()) {  
            File[] files = f.listFiles();  
            for (int i = 0; i < files.length; ++i) {  
                removeFile(files[i]);  
            }  
        }  
        f.delete();  
    } 
}
