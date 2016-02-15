package br.com.hermeto.intranet.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Evangelizer{
	
	@Id @GeneratedValue
	private Long id;
	
	@NotNull(message="O nome deve ser preenchido") 
	@Size(min=5, message="O nome deve possuir mais de 5 caracteres")
	private String nome;
	
	@NotNull 
	private String email;
	
	@ManyToOne
	private Period ciclo;
	
	@OneToOne(mappedBy="evangelizador", cascade={CascadeType.REMOVE, CascadeType.PERSIST,
			CascadeType.DETACH, CascadeType.MERGE})
	private User usuario;

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
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Period getCiclo() {
		return ciclo;
	}
	public void setCiclo(Period ciclo) {
		this.ciclo = ciclo;
	}
	
	public User getUsuario() {
		return usuario;
	}
	public void setUsuario(User usuario) {
		this.usuario = usuario;
	}

}
