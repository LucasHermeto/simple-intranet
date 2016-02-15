package br.com.hermeto.intranet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.hermeto.intranet.model.Student;

@Repository
@Transactional
public class StudentDao {
	
	@PersistenceContext
	private EntityManager manager;
	
	@Transactional
	public void addStudent(Student student){
		manager.persist(student);
	}
	
	@Transactional
	public void updateStudent(Student student){
		 Student studentOld = manager.find(Student.class, student.getId());
		 manager.detach(studentOld);
		 
		 Student studentNew = manager.merge(studentOld);
		 
		 studentNew.setNome(student.getNome());
		 studentNew.setDataNascimento(student.getDataNascimento());
		 studentNew.setNomeMae(student.getNomeMae());
		 studentNew.setNomePai(student.getNomePai());
		 studentNew.setCiclo(student.getCiclo());
	}
	
	@Transactional
	public void remove(Long id){
		Student student = manager.find(Student.class, id);
		manager.remove(student);
	}
	
	public List<?> getStudents(){
		Query query = manager.createQuery("Select s from Student s");
		List<?> students = query.getResultList();
		
		return students;
	}
	
	public List<?> getStudentsByPeriodId(Long id){
		Query query = manager.createQuery("Select s from Student s where ciclo_id=:cicloId");
		query.setParameter("cicloId", id);
		
		List<?> students = query.getResultList();
		
		return students;
	}
	
	public Student getStudentById(Long id){
		Student student = manager.find(Student.class, id);
		
		return student;
	}

}
