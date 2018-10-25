package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Cidade;
import com.ufpr.tads.web2.dao.CidadeDao;
import java.util.List;

public class CidadesFacade {
    private static final  CidadeDao cDao = new CidadeDao();

    public static List<Cidade> carregarByEstado(Integer estadoId) {
        return cDao.carregarByEstado(estadoId);
    }

    public static Cidade carregarUma(Integer cidadeId) {
        return cDao.carregarUma(cidadeId);
    }
}
