package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.ClienteDao;
import com.ufpr.tads.web2.dao.UsuarioDao;
import com.ufpr.tads.web2.exceptions.CPFDuplicadoClienteException;
import com.ufpr.tads.web2.exceptions.CPFInvalidoClienteException;
import com.ufpr.tads.web2.exceptions.ClienteNaoExisteException;
import com.ufpr.tads.web2.exceptions.ErroBuscandoClienteException;
import com.ufpr.tads.web2.exceptions.ErroEditandoClienteException;
import com.ufpr.tads.web2.exceptions.ErroInserindoClienteException;
import com.ufpr.tads.web2.exceptions.ErroRemovendoClienteException;
import java.util.List;

public class UsuarioFacade {
    private static final UsuarioDao cDao = new UsuarioDao();
    public static List<Usuario> buscarTodos() {
        return cDao.carregarTodos();
    }
    public static Usuario buscar(Integer id) {
        return cDao.carregar(id);
    }
}
