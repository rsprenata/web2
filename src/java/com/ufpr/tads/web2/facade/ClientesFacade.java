package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.dao.ClienteDao;
import java.util.List;

public class ClientesFacade {
    private static final ClienteDao cDao = new ClienteDao();

    public static void inserir(Cliente c) {
        cDao.adicionarUm(c);
    }

    public static void alterar(Cliente c) {
        cDao.editarUm(c);
    }

    public static Cliente buscar(int id) {
        return cDao.carregarUm(id);
    }

    public static List<Cliente> buscarTodos() {
        return cDao.carregarTodos();
    }

    public static void remover(int id) {
        cDao.removerUm(id);
    }

    public static int validar(Cliente cliente) {
        return cDao.validar(cliente);
    }
}
