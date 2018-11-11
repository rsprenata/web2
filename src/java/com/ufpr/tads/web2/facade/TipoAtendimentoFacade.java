/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.TipoAtendimento;
import com.ufpr.tads.web2.dao.AtendimentoDao;
import com.ufpr.tads.web2.dao.ClienteDao;
import com.ufpr.tads.web2.dao.TipoAtendimentoDao;
import java.util.List;

/**
 *
 * @author renata.pereira
 */
public class TipoAtendimentoFacade {
    private static final TipoAtendimentoDao aDao = new TipoAtendimentoDao();
    public static List<TipoAtendimento> buscarTodos() {
        return aDao.carregarTodos();
    }
    public static TipoAtendimento buscar(Integer tipo) {
        return aDao.buscar(tipo);
    }
    
}
