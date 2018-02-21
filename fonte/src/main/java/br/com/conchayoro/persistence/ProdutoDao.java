package br.com.conchayoro.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.conchayoro.entity.Produto;

public class ProdutoDao {
	 
	private EntityManagerFactory entityManagerFactory;
 
	private EntityManager entityManager;
 
	public ProdutoDao(){
 
		this.entityManagerFactory = Persistence.createEntityManagerFactory("persistence_unit_conchayoro");
 
		this.entityManager = this.entityManagerFactory.createEntityManager();
	}
 
	public void incluir(Produto produto){
 
		this.entityManager.getTransaction().begin();
		this.entityManager.persist(produto);
		this.entityManager.getTransaction().commit();
	}
 
	public void alterar(Produto produto){
 
		this.entityManager.getTransaction().begin();
		this.entityManager.merge(produto);
		this.entityManager.getTransaction().commit();
	}
	
	public void excluir(Integer codigo){
		 
		Produto produto = this.consultar(codigo);
 
		this.entityManager.getTransaction().begin();
		this.entityManager.remove(produto);
		this.entityManager.getTransaction().commit();
 
	}
 
	@SuppressWarnings("unchecked")
	public List<Produto> listar(){
 
		return this.entityManager.createQuery("SELECT p FROM Produto p ORDER BY p.nome").getResultList();
	}
 
	public Produto consultar(Integer codigo){
 
		return this.entityManager.find(Produto.class, codigo);
	}
 
}