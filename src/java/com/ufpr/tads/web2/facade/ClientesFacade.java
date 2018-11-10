package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.dao.ClienteDao;
import com.ufpr.tads.web2.exceptions.CPFDuplicadoClienteException;
import com.ufpr.tads.web2.exceptions.CPFInvalidoClienteException;
import com.ufpr.tads.web2.exceptions.ClienteNaoExisteException;
import com.ufpr.tads.web2.exceptions.ErroBuscandoClienteException;
import com.ufpr.tads.web2.exceptions.ErroEditandoClienteException;
import com.ufpr.tads.web2.exceptions.ErroInserindoClienteException;
import com.ufpr.tads.web2.exceptions.ErroRemovendoClienteException;
import java.util.List;

public class ClientesFacade {
    private static final ClienteDao cDao = new ClienteDao();

    public static void inserir(Cliente c) throws ErroInserindoClienteException {
        cDao.adicionarUm(c);
    }

    public static void alterar(Cliente c) throws ErroEditandoClienteException {
        cDao.editarUm(c);
    }

    public static Cliente buscar(int id) throws ClienteNaoExisteException, ErroBuscandoClienteException {
        return cDao.carregarUm(id);
    }

    public static List<Cliente> buscarTodos() throws ErroBuscandoClienteException {
        return cDao.carregarTodos();
    }

    public static void remover(int id) throws ErroRemovendoClienteException {
        cDao.removerUm(id);
    }

    public static void validar(Cliente cliente) throws CPFDuplicadoClienteException, ErroBuscandoClienteException, CPFInvalidoClienteException {
        cDao.validar(cliente);
    }
}
