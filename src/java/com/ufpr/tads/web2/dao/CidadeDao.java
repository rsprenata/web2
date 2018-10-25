package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Cidade;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Estado;
import com.ufpr.tads.web2.beans.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CidadeDao {
    public List<Cidade> carregarByEstado(Integer estadoId) {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Cidade> cidades = new ArrayList<Cidade>();
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_cidade WHERE id_estado = ?");
            stmt.setInt(1, estadoId);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Cidade cidade = new Cidade();
                
                cidade.setId(rs.getInt("id_cidade"));
                cidade.setNome(rs.getString("nome_cidade"));
                cidade.setIdEstado(rs.getInt("id_estado"));
                
                cidades.add(cidade);
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
        
        return cidades;
    }
    
    public Cidade carregarUma(Integer cidadeId) {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Cidade cidade = null;
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_cidade WHERE id_cidade = ?");
            stmt.setInt(1, cidadeId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                cidade = new Cidade();
                
                cidade.setId(rs.getInt("id_cidade"));
                cidade.setNome(rs.getString("nome_cidade"));
                cidade.setIdEstado(rs.getInt("id_estado"));
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
        
        return cidade;
    }
}
