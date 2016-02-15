package br.com.hermeto.intranet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.hermeto.intranet.model.Evangelizer;
import br.com.hermeto.intranet.model.User;

@Repository
@Transactional
public class EvangelizerDao{
	
	@PersistenceContext
	private EntityManager manager;
	
	@Transactional
	public void add(Evangelizer evangelizer){
		manager.persist(evangelizer);
	}
	
	@Transactional
	public void remove(Long id){
		Evangelizer evangelizer = manager.find(Evangelizer.class, id);
		manager.remove(evangelizer);
	}
	
	@Transactional
	public void update(Evangelizer evangelizer, User usuario, String oldLogin){
		updateEvangelizer(evangelizer);
		
		User userOld = (User) manager.createQuery("SELECT u FROM User u WHERE u.login=:login")
				.setParameter("login", oldLogin).getSingleResult();
		updateUser(usuario, userOld);
	}
	
	@Transactional
	private void updateEvangelizer(Evangelizer evangelizer){
		Evangelizer evangelizerOld = manager.find(Evangelizer.class, evangelizer.getId());
		manager.detach(evangelizerOld);
		
		Evangelizer evangelizerNew = manager.merge(evangelizerOld);
	 
		evangelizerNew.setNome(evangelizer.getNome());
		evangelizerNew.setEmail(evangelizer.getEmail());
		evangelizerNew.setCiclo(evangelizer.getCiclo());
	}
	
	@Transactional
	private void updateUser(User usuario, User userOld){
		Query query = manager.createNativeQuery("UPDATE User SET login=:login, senha=:senha WHERE"
				+ " login=:oldLogin");
		query.setParameter("login", usuario.getLogin());
		query.setParameter("senha", usuario.getSenha());
		query.setParameter("oldLogin", userOld.getLogin());
		query.executeUpdate();
	}
	
	public List<?> getEvangelizers(){
		Query query = manager.createQuery("Select e from Evangelizer e");
		List<?> evangelizers = query.getResultList();
		
		return evangelizers;
	}
	
	public Evangelizer getEvangelizerById(Long id){
		Evangelizer evangelizer = manager.find(Evangelizer.class, id);
		
		return evangelizer;
	}

}
