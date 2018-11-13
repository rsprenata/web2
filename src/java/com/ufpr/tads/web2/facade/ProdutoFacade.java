/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Produto;
import com.ufpr.tads.web2.dao.AtendimentoDao;
import com.ufpr.tads.web2.dao.ClienteDao;
import com.ufpr.tads.web2.dao.ProdutoDao;
import java.util.List;

/**
 *
 * @author renata.pereira
 */
public class ProdutoFacade {
    private static final ProdutoDao pDao = new ProdutoDao();
    public static List<Produto> buscarTodos() {
        return pDao.carregarTodos();
    }
    public static Produto buscar(Integer id) {
        return pDao.buscarUm(id);
    }
    public static void remover(int id) {
    pDao.removerUm(id);
    }
    public static void alterar(Produto p){
        pDao.editarUm(p);
    }
    public static void inserir(Produto p) {
        pDao.adicionarUm(p);
    }
    
}
