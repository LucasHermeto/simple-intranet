package br.com.hermeto.intranet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.hermeto.intranet.model.Post;
import br.com.hermeto.intranet.model.Topic;

@Repository
@Transactional
public class PostDao{
	
	@PersistenceContext
	private EntityManager manager;
	
	@Transactional
	public void addPost(Post post){
		manager.persist(post);
	}
	
	@Transactional
	public void addTopic(Topic topic){
		manager.persist(topic);
	}
	
	public List<?> getTopics(){
		Query query = manager.createQuery("Select t from Topic t");
		List<?> topicos = query.getResultList();
		
		return topicos;
	}
	
	public Topic getTopicById(Long id){
		manager.getTransaction().begin();
		
		Topic topic = manager.find(Topic.class, id);
		
		manager.getTransaction().commit();
		
		return topic;
	}
	
	public Topic searchTopic(String nome){
		Query query = manager.createQuery("select t from Topic as t "
				+ "where t.nome =:nome");
		query.setParameter("nome", nome);
		
		Topic topic = (Topic) query.getSingleResult();
		
		return topic;
	}
	
	public List<?> getPosts(){
		Query query = manager.createQuery("select p from Post p");
		List<?> postagens = query.getResultList();
		
		return postagens;
	}
	
	public List<?> getPostsByTopicId(Long id){
		Query query = manager.createQuery(" select p from Post p where topico_id=:topicoId");
		query.setParameter("topicoId", id);
		
		List<?> postagens = query.getResultList();
		
		return postagens;
	}
	
	public List<Post> getPostsByTopicId(Long id, int first, int last){
		Query query = manager.createQuery(" select p from Post p where topico_id=:topicoId");
		query.setParameter("topicoId", id);
		query.setFirstResult(first);
		query.setMaxResults(last);
		return query.getResultList();
	}
	
	public List<?> getPostByUserId(Long id){
		Query query = manager.createQuery(" select p from Post p where usuario_id=:usuarioId");
		query.setParameter("usuarioId", id);
		return query.getResultList();
	}
	
	public List<Post> getPostByUserId(Long id, int first, int last){
		Query query = manager.createQuery(" select p from Post p where usuario_id=:usuarioId");
		query.setParameter("usuarioId", id);
		query.setFirstResult(first);
		query.setMaxResults(last);
		
		return query.getResultList();
	}
	
	@Transactional
	public void updatePost(Post post){
		Post postOld = manager.find(Post.class, post.getId());
		manager.detach(postOld);
		
		Post postNew = manager.merge(postOld);
		
		postNew.setNome(post.getNome());
		postNew.setDescricao(post.getDescricao());
		postNew.setDateLastEdit(post.getDateLastEdit());
	}
	
	public Post getPostById(Long id){
		return manager.find(Post.class, id);
	}
	
	@Transactional
	public void removePost(Long id){
		Post post = manager.find(Post.class, id);
		manager.remove(post);
	}
	
	@Transactional
	public void removeTopic(Long id){
		Topic topic = manager.find(Topic.class, id);
		manager.remove(topic);
	}
	
}

