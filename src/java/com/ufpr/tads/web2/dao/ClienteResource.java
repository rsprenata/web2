/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.google.gson.Gson;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.exceptions.ErroBuscandoClienteException;
import com.ufpr.tads.web2.facade.ClientesFacade;
import java.sql.SQLException;
import java.util.ArrayList;
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
@Path("clientes")
public class ClienteResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of ClienteResource
     */
    public ClienteResource() {
    }

    /**
     * Retrieves representation of an instance of com.ufpr.tads.web2.dao.ClienteResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getClientes() {
        List<Cliente> clientes = new ArrayList<Cliente>();
        try {
            clientes = ClientesFacade.buscarTodos();
        } catch (ErroBuscandoClienteException ex) {
            Logger.getLogger(ClienteResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        Gson gson = new Gson();
        String x = gson.toJson(clientes);
        GenericEntity<List<Cliente>> lista = new GenericEntity<List<Cliente>>(clientes){};
        return Response.ok().entity(lista).build();
    }
}
