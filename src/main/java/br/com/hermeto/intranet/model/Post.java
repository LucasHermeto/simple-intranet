package br.com.hermeto.intranet.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Post {
	
	@Id @GeneratedValue
	private Long id;
	
	private String nome;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date data;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date dateLastEdit;
	
	private String descricao;
	
	@OneToMany(mappedBy="postagem", cascade=CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Comment> comentarios = new ArrayList<Comment>();
	
	@ManyToOne
	private Topic topico;
	
	@ManyToOne
	private User usuario;
	
	@ManyToOne
	private Period ciclo;

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

	public Date getDateLastEdit() {
		return dateLastEdit;
	}
	public void setDateLastEdit(Date dateLastEdit) {
		this.dateLastEdit = dateLastEdit;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public List<Comment> getComentarios() {
		return comentarios;
	}
	public void setComentarios(Comment comentario) {
		this.comentarios.add(comentario);
	}
	
	public Topic getTopico() {
		return topico;
	}
	public void setTopico(Topic topico) {
		this.topico = topico;
	}

	public User getUsuario() {
		return usuario;
	}
	public void setUsuario(User usuario) {
		this.usuario = usuario;
	}
	public Period getCiclo() {
		return ciclo;
	}
	public void setCiclo(Period ciclo) {
		this.ciclo = ciclo;
	}

}
