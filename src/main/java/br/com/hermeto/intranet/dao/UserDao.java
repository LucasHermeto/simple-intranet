package br.com.hermeto.intranet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.hermeto.intranet.model.User;

@Repository
@Transactional
public class UserDao {
	
	@PersistenceContext
	private EntityManager manager;
	
	@Transactional
	public void add(User user){
		manager.persist(user);
	}
	
	@Transactional
	public void remove(Long id){
		User user = manager.find(User.class, id);
		manager.remove(user);
	}
	
	public boolean existsUser(User user) {
		Query query = manager.createQuery("select u from User as u "
			+ "where u.login =:paramLogin"
			+ " and u.senha =:paramSenha");
		query.setParameter("paramLogin", user.getLogin());
		query.setParameter("paramSenha", user.getSenha());
		
		List<?> u = query.getResultList();
		return checksExistence(u);
	}
	
	public boolean checksUser(User user){
		Query query = manager.createQuery("select u from User as u "
				+ "where u.login =:login");
		query.setParameter("login", user.getLogin());
		
		List<?> u = query.getResultList();
		
		return checksExistence(u);
	}
	
	private boolean checksExistence(List<?> u){
		if(u.size() == 1){
			return true;
		} else{
			return false;
		}
	}
	
	public User searchUser(String login){
		Query query = manager.createQuery("select u from User as u "
				+ "where u.login =:login");
		query.setParameter("login", login);
		
		User usuario = (User) query.getSingleResult();
		
		return usuario;
	}
	
	public User getUserById(Long id){
		User user = manager.find(User.class, id);
		
		return user;
	}

}
