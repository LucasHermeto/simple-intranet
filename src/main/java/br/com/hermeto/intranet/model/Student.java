package br.com.hermeto.intranet.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Student{
	
	@Id @GeneratedValue
	private Long id;
	
	@NotNull(message="O nome deve ser preenchido") 
	@Size(min=5, message="O nome deve possuir mais de 5 caracteres")
	private String nome;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date dataNascimento;
	
	@NotNull(message="O nome da mãe deve ser preenchido")
	@Size(min=5, message="O nome da mãe deve possuir mais de 5 caracteres")
	private String nomeMae;
	
	@NotNull(message="O nome do pai deve ser preednchido")
	@Size(min=5, message="O nome do pai deve possuir mais de 5 caracteres")
	private String nomePai;
	
	private String telefone;
	
	private String endereco;
	
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
	
	public Date getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	
	public String getNomeMae() {
		return nomeMae;
	}
	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}

	public String getNomePai() {
		return nomePai;
	}
	public void setNomePai(String nomePai) {
		this.nomePai = nomePai;
	}

	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	public Period getCiclo() {
		return ciclo;
	}
	public void setCiclo(Period turma) {
		this.ciclo = turma;
	}
	
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

}
