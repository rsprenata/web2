/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.google.gson.Gson;
import com.ufpr.tads.web2.beans.Produto;
import com.ufpr.tads.web2.facade.ProdutoFacade;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * REST Web Service
 *
 * @author renata
 */
@Path("produtos")
public class ProdutoResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of ProdutoResource
     */
    public ProdutoResource() {
    }

    /**
     * Retrieves representation of an instance of com.ufpr.tads.web2.dao.ProdutoResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getProdutos() {
        List<Produto> produtos = ProdutoFacade.buscarTodos();
        Gson gson = new Gson();
        String x = gson.toJson(produtos);
        GenericEntity<List<Produto>> lista = new GenericEntity<List<Produto>>(produtos){};
        return Response.ok().entity(lista).build();
    }
    
    @GET
    @Path("/{codigo}")
    @Produces(MediaType.APPLICATION_JSON)
    public Produto getProdutos(@PathParam("codigo") int codigo) {
        Produto produto = ProdutoFacade.buscar(codigo);
        
        return produto;
    }
    
   
    
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public void adicionarProduto(Produto produto) {
        ProdutoFacade.inserir(produto);
    }
    
    @PUT
    @Path("/{codigo}")
    @Consumes(MediaType.APPLICATION_JSON)
    public void editarProduto(Produto produto, @PathParam("codigo") int codigo) {
        produto.setId(codigo);
        ProdutoFacade.alterar(produto);
    }
    
    @DELETE
    @Path("/{codigo}")
    @Consumes(MediaType.APPLICATION_JSON)
    public void deletarProduto(@PathParam("codigo") int codigo) {
        ProdutoFacade.remover(codigo);
    }
}
