package br.com.hermeto.intranet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.hermeto.intranet.model.Period;

@Repository
@Transactional
public class PeriodDao {
	
	@PersistenceContext
	private EntityManager manager;
	
	@Transactional
	public void add(Period course){
		manager.persist(course);
	}
	
	@Transactional
	public void remove(Long id){
		Period ciclo = manager.find(Period.class, id);
		manager.remove(ciclo);
	}
	
	public List<?> getPeriods(){
		Query query = manager.createQuery("Select p from Period p");
		List<?> courses = query.getResultList();
		
		return courses;
	}
	
	public Period getPeriodById(Long id){
		Period course = manager.find(Period.class, id);
		
		return course;
	}
	
	public Period searchPeriod(String nome){
		Query query = manager.createQuery("select p from Period as p "
				+ "where p.nome =:nome");
		query.setParameter("nome", nome);
		
		Period period = (Period) query.getSingleResult();
		
		return period;
	}

}
