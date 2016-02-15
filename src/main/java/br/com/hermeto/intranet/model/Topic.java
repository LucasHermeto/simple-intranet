package br.com.hermeto.intranet.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Topic {
	
	@Id @GeneratedValue
	private Long id;
	
	private String nome;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date data;
	
	@OneToMany(mappedBy="topico", cascade=CascadeType.REMOVE)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Post> postagens = new ArrayList<Post>();
	
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

	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	
	public List<Post> getPostagens() {
		return postagens;
	}
	public void setPostagens(Post postagem) {
		this.postagens.add(postagem);
	}

}