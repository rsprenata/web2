/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.google.gson.Gson;
import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.facade.AtendimentoFacade;
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
@Path("atendimentos")
public class AtendimentoResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of AtendimentoResource
     */
    public AtendimentoResource() {
    }

    /**
     * Retrieves representation of an instance of com.ufpr.tads.web2.dao.AtendimentoResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAtendimentos() {
        List<Atendimento> atendimentos = AtendimentoFacade.buscarTodos();
        Gson gson = new Gson();
        String x = gson.toJson(atendimentos);
        GenericEntity<List<Atendimento>> lista = new GenericEntity<List<Atendimento>>(atendimentos){};
        return Response.ok().entity(lista).build();
    }
    
    @GET
    @Path("/{codigo}")
    @Produces(MediaType.APPLICATION_JSON)
    public Atendimento getAtendimentos(@PathParam("codigo") int codigo) {
        Atendimento produto = AtendimentoFacade.buscar(codigo);
        
        return produto;
    }
    
   
    
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public void adicionarAtendimento(Atendimento atendimento) {
        AtendimentoFacade.atender(atendimento);
    }
    
    @PUT
    @Path("/{codigo}")
    @Consumes(MediaType.APPLICATION_JSON)
    public void resolver(Atendimento atendimento, @PathParam("codigo") int codigo) {
        atendimento.setId(codigo);
        AtendimentoFacade.resolver(atendimento);
    }
}
