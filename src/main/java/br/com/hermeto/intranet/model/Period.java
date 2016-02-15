package br.com.hermeto.intranet.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class Period {
	
	@Id @GeneratedValue
	private Long id;
	
	private String nome;
	
	@OneToMany(mappedBy="ciclo")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Evangelizer> evangelizers = new ArrayList<>();
	
	@OneToMany(mappedBy="ciclo")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Student> students = new ArrayList<>();
	
	@OneToMany(mappedBy="ciclo")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Post> posts = new ArrayList<>();

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public List<Evangelizer> getEvangelizers() {
		return evangelizers;
	}
	
	public void setEvangelizers(Evangelizer evangelizer) {
		this.evangelizers.add(evangelizer);
	}

	public List<?> getStudents() {
		return students;
	}
	public void setStudents(Student student) {
		this.students.add(student);
	}
	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(Post post) {
		this.posts.add(post);
	}

}