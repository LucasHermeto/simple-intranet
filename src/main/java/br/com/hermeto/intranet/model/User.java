package br.com.hermeto.intranet.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class User {
	
	@Id @GeneratedValue
	private Long id;
	
	@Column
	@NotNull 
	private String login;
	
	@Column
	@NotNull 
	@Size(min=6, max=20, message="O tamanho deve ser entre 6 e 20 caracteres")
	private String senha;
	
	@OneToMany(mappedBy="usuario")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Post> postagens = new ArrayList<Post>();
	
	@OneToMany(mappedBy="usuario")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Comment> comentarios = new ArrayList<Comment>();
	
	@OneToOne
	private Evangelizer evangelizador;
	
	private String rule;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public List<Post> getPostagens() {
		return postagens;
	}
	public void setPostagens(Post postagem) {
		this.postagens.add(postagem);
	}
	public void setPostagensList(List<Post> postagens){
		this.postagens = postagens;
	}
	
	public List<Comment> getComentarios() {
		return comentarios;
	}
	public void setComentarios(Comment comentario) {
		this.comentarios.add(comentario);
	}
	
	public Evangelizer getEvangelizador() {
		return evangelizador;
	}
	public void setEvangelizador(Evangelizer evangelizador) {
		this.evangelizador = evangelizador;
	}
	
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}

}
