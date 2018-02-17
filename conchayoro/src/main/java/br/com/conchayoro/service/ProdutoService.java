package br.com.conchayoro.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import br.com.conchayoro.entity.Produto;
import br.com.conchayoro.persistence.ProdutoDao;

@Path("/produto")
public class ProdutoService {

	private final  ProdutoDao produtoDao = new ProdutoDao();

	@Path("/incluir")
	@POST	
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})	
	public String incluir(Produto produto){

		Produto entity = new Produto();

		entity.setNome(produto.getNome());
		entity.setUnidade(produto.getUnidade());
		entity.setPrecoUnitario(produto.getPrecoUnitario());

		produtoDao.incluir(entity);

		return "Registro incluído com sucesso!";

	}

	@Path("/alterar")
	@PUT
	@Produces("application/json; charset=UTF-8")
	@Consumes("application/json; charset=UTF-8")	
	public String alterar(Produto produto){

		Produto entity = new Produto();
		entity.setId(produto.getId());
		entity.setNome(produto.getNome());
		entity.setUnidade(produto.getUnidade());
		entity.setPrecoUnitario(produto.getPrecoUnitario());

		produtoDao.alterar(entity);

		return "Registro alterado com sucesso!";

	}

	@Path("/excluir/{codigo}")
	@DELETE
	@Produces("application/json; charset=UTF-8")		
	public String excluir(@PathParam("codigo") Integer codigo){

		produtoDao.excluir(codigo);

		return "Registro excluido com sucesso!";

	}

	@Path("/listar")
	@GET
	@Produces("application/json; charset=UTF-8")	
	public List<Produto> listar(){

		return produtoDao.listar();
	}

	@Path("/consultar/{codigo}")
	@GET
	@Produces("application/json; charset=UTF-8")	
	public Produto consultar(@PathParam("codigo") Integer codigo){

		Produto entity = produtoDao.consultar(codigo);

		if(entity != null)
			return entity;

		return null;
	}



}