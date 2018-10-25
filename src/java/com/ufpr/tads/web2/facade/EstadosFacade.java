package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Estado;
import com.ufpr.tads.web2.dao.EstadoDao;
import java.util.List;

public class EstadosFacade {
    private static final EstadoDao eDao = new EstadoDao();

    public static List<Estado> buscarTodos() {
        return eDao.carregarTodos();
    }

    public static Estado carregarUm(Integer estadoId) {
        return eDao.carregarUm(estadoId);
    }
}
