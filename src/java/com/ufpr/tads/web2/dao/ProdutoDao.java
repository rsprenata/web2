/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Produto;
import com.ufpr.tads.web2.beans.TipoAtendimento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author renata.pereira
 */
public class ProdutoDao {

    public List<Produto> carregarTodos() {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Produto> produtos = new ArrayList<Produto>();
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_produto");
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Produto produto = new Produto();
                
                produto.setId(rs.getInt("id_produto"));
                produto.setNome(rs.getString("nome_produto"));
                
                produtos.add(produto);
            }
        } catch (SQLException exception) {
            throw new RuntimeException("Erro. Origem="+exception.getMessage());
        } finally {
            if (rs != null)
                try { rs.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar rs. Ex="+exception.getMessage()); }
            if (stmt != null)
                try { stmt.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar stmt. Ex="+exception.getMessage()); }
            if (connection != null)
                try { connection.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar conexão. Ex="+exception.getMessage()); }
        }
        
        return produtos;
    }
    
    public Produto buscarUm(Integer id) {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Produto produto = null;
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_produto WHERE id_produto = ?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                produto = new Produto();
                
                produto.setId(rs.getInt("id_produto"));
                produto.setNome(rs.getString("nome_produto"));
                
            }
        } catch (SQLException exception) {
            throw new RuntimeException("Erro. Origem="+exception.getMessage());
        } finally {
            if (rs != null)
                try { rs.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar rs. Ex="+exception.getMessage()); }
            if (stmt != null)
                try { stmt.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar stmt. Ex="+exception.getMessage()); }
            if (connection != null)
                try { connection.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar conexão. Ex="+exception.getMessage()); }
        }
        
    
        
        return produto;
    }
    
    public void removerUm(Integer id){
    ConnectionFactory connectionFactory = new ConnectionFactory();
    Connection connection = connectionFactory.getConnection();
    PreparedStatement stmt = null;

    try {
        stmt = connection.prepareStatement("DELETE FROM tb_produto WHERE id_produto = ?");
        stmt.setInt(1, id);
        stmt.executeUpdate();
    } catch (SQLException exception) {
        throw new RuntimeException(exception.getMessage());
    } finally {
        if (stmt != null)
            try { stmt.close(); }
        catch (SQLException exception) { System.out.println("Erro ao fechar stmt. Ex="+exception.getMessage()); }
        if (connection != null)
            try { connection.close(); }
        catch (SQLException exception) { System.out.println("Erro ao fechar conexão. Ex="+exception.getMessage()); }
    }
}

public void editarUm(Produto produto){
    ConnectionFactory connectionFactory = new ConnectionFactory();
    Connection connection = connectionFactory.getConnection();
    PreparedStatement stmt = null;

    try {
        stmt = connection.prepareStatement("UPDATE tb_produto "
            + "SET nome_produto = ? WHERE id_produto = ?");
        stmt.setString(1, produto.getNome());
        stmt.setInt(2, produto.getId());
        stmt.executeUpdate();
    } catch (SQLException exception) {
        throw new RuntimeException(exception.getMessage());
    } finally {
        if (stmt != null)
            try { stmt.close(); }
        catch (SQLException exception) { System.out.println("Erro ao fechar stmt. Ex="+exception.getMessage()); }
        if (connection != null)
            try { connection.close(); }
        catch (SQLException exception) { System.out.println("Erro ao fechar conexão. Ex="+exception.getMessage()); }
    }
}

public void adicionarUm(Produto produto){
    ConnectionFactory connectionFactory = new ConnectionFactory();
    Connection connection = connectionFactory.getConnection();
    PreparedStatement stmt = null;

    try {
        stmt = connection.prepareStatement("INSERT INTO tb_produto (nome_produto) VALUES (?)");
        stmt.setString(1, produto.getNome());
        stmt.executeUpdate();
    } catch (SQLException exception) {
        throw new RuntimeException(exception.getMessage());
    } finally {
        if (stmt != null)
            try { stmt.close(); }
        catch (SQLException exception) { System.out.println("Erro ao fechar stmt. Ex="+exception.getMessage()); }
        if (connection != null)
            try { connection.close(); }
        catch (SQLException exception) { System.out.println("Erro ao fechar conexão. Ex="+exception.getMessage()); }
    }
}
    
}
