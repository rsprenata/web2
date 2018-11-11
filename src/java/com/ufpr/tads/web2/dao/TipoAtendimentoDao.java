/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;


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
public class TipoAtendimentoDao {
    public List<TipoAtendimento> carregarTodos() { 
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<TipoAtendimento> tiposAtendimento = new ArrayList<TipoAtendimento>();
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_tipo_atendimento");
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                TipoAtendimento tipoAtendimento = new TipoAtendimento();
                
                tipoAtendimento.setId(rs.getInt("id_tipo_atendimento"));
                tipoAtendimento.setNome(rs.getString("nome_tipo_atendimento"));
                
                tiposAtendimento.add(tipoAtendimento);
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
        
        return tiposAtendimento;
    }
    public TipoAtendimento buscar(Integer idTipo) { 
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        TipoAtendimento tipoAtendimento = null;
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_tipo_atendimento WHERE id_tipo_atendimento = ?");
            stmt.setInt(1, idTipo);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                tipoAtendimento = new TipoAtendimento();
                
                tipoAtendimento.setId(rs.getInt("id_tipo_atendimento"));
                tipoAtendimento.setNome(rs.getString("nome_tipo_atendimento"));
                
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
        
        return tipoAtendimento;
    }
    
}
