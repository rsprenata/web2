package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.LoginBean;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.UsuarioDao;
import java.util.List;
//facade tem que ser validado RENATA SOARES 24/10/2018
public class LoginFacade {
    private static final  UsuarioDao uDao = new UsuarioDao();
    
    public static void validar(Usuario u) {
        return uDao.loginValido(u);
    }
    
    public static List<Usuario> carregarTodos() {
        return uDao.carregarTodos();
    }
    
    public static void novo(Usuario u) {
        uDao.cadastrarNovo(u);
    }
}
