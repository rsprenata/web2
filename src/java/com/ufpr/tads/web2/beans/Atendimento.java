/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.beans;

import java.util.Date;
import java.util.List;

/**
 *
 * @author renata.pereira
 */
public class Atendimento {
    private Integer id;
    private Date data;
    private String descricao;
    private Produto produto;
    private Integer tipoAtendimento;
    private Cliente cliente;
    private Usuario usuario;
    private String resolvido;

    public Atendimento() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }

    public Integer getTipoAtendimento() {
        return tipoAtendimento;
    }

    public void setTipoAtendimento(Integer tipoAtendimento) {
        this.tipoAtendimento = tipoAtendimento;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getResolvido() {
        return resolvido;
    }

    public void setResolvido(String resolvido) {
        this.resolvido = resolvido;
    }
       
}
