package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.UsuarioDao;
import com.ufpr.tads.web2.exceptions.UsuarioSenhaInvalidosException;

public class LoginFacade {
    private static final  UsuarioDao uDao = new UsuarioDao();
    
    public static Usuario loginValido(String login, String senha) throws UsuarioSenhaInvalidosException {
        return uDao.loginValido(login, senha);
    }
    
}
