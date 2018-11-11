/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.dao.AtendimentoDao;
import com.ufpr.tads.web2.dao.ClienteDao;
import java.util.List;

/**
 *
 * @author renata.pereira
 */
public class AtendimentoFacade {
    private static final AtendimentoDao aDao = new AtendimentoDao();
    public static List<Atendimento> buscarByUsuario(Integer idUsuario) {
        return aDao.buscarByUsuario(idUsuario);
    }
    public static Atendimento buscar(Integer idAtendimento) {
        return aDao.buscar(idAtendimento);
    }
    public static void atender(Atendimento at) {
        aDao.atender(at);
    }
}
