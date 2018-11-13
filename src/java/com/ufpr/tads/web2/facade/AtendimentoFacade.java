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
import com.ufpr.tads.web2.exceptions.ErroBuscandoAtendimentoException;
import com.ufpr.tads.web2.exceptions.ErroEfetuarAtendimentoException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author renata.pereira
 */
public class AtendimentoFacade {
    private static final AtendimentoDao aDao = new AtendimentoDao();
    public static List<Atendimento> buscarByUsuario(Integer idUsuario) {
        try {
            return aDao.buscarByUsuario(idUsuario);
        } catch (ErroBuscandoAtendimentoException ex) {
            Logger.getLogger(AtendimentoFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static Atendimento buscar(Integer idAtendimento) {
        try {
            return aDao.buscar(idAtendimento);
        } catch (ErroBuscandoAtendimentoException ex) {
            Logger.getLogger(AtendimentoFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void atender(Atendimento at) {
        try {
            aDao.atender(at);
        } catch (ErroEfetuarAtendimentoException ex) {
            Logger.getLogger(AtendimentoFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
