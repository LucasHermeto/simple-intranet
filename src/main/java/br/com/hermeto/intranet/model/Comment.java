package br.com.hermeto.intranet.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Comment {
	
	@Id @GeneratedValue
	private Long id;
	
	@ManyToOne
	private User usuario;
	
	private String descricao;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date data;
	
	@ManyToOne
	private Post postagem;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public User getUsuario() {
		return usuario;
	}
	public void setUsuario(User usuario) {
		this.usuario = usuario;
	}

	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}

	public Post getPostagem() {
		return postagem;
	}
	public void setPostagem(Post postagem) {
		this.postagem = postagem;
	}

}