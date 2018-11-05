package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.exceptions.ClienteNaoExisteException;
import com.ufpr.tads.web2.exceptions.ErroInserindoClienteException;
import com.ufpr.tads.web2.facade.CidadesFacade;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ClienteDao {
    public List<Cliente> carregarTodos() {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Cliente> clientes = new ArrayList<Cliente>();
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_cliente");
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Cliente cliente = new Cliente();
                
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setCpf(rs.getString("cpf_cliente"));
                cliente.setNome(rs.getString("nome_cliente"));
                cliente.setEmail(rs.getString("email_cliente"));
                cliente.setData(new Date(rs.getTimestamp("data_cliente").getTime()));
                cliente.setRua(rs.getString("rua_cliente"));
                cliente.setNr(rs.getInt("nr_cliente"));
                cliente.setCep("cep_cliente");
                cliente.setCidade(CidadesFacade.carregarUma(rs.getInt("id_cidade")));
                
                clientes.add(cliente);
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
        
        return clientes;
    }
    
    public Cliente carregarUm(Integer id) throws ClienteNaoExisteException {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Cliente cliente = null;
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_cliente WHERE id_cliente = ?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                cliente = new Cliente();
                
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setCpf(rs.getString("cpf_cliente"));
                cliente.setNome(rs.getString("nome_cliente"));
                cliente.setEmail(rs.getString("email_cliente"));
                cliente.setData(new Date(rs.getDate("data_cliente").getTime()));
                cliente.setRua(rs.getString("rua_cliente"));
                cliente.setNr(rs.getInt("nr_cliente"));
                cliente.setCep(rs.getString("cep_cliente"));
                cliente.setCidade(CidadesFacade.carregarUma(rs.getInt("id_cidade")));
            } else throw new ClienteNaoExisteException();
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
        
        return cliente;
    }
    
    public void removerUm(Integer id) {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        
        try { 
            stmt = connection.prepareStatement("DELETE FROM tb_cliente WHERE id_cliente = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException exception) {
            throw new RuntimeException("Erro. Origem="+exception.getMessage());
        } finally {
            if (stmt != null)
                try { stmt.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar stmt. Ex="+exception.getMessage()); }
            if (connection != null)
                try { connection.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar conexão. Ex="+exception.getMessage()); }
        }
    }
    
    public void editarUm(Cliente cliente) {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        
        try { 
            stmt = connection.prepareStatement("UPDATE tb_cliente "
                    + "SET cpf_cliente = ?, nome_cliente = ?, email_cliente = ?, data_cliente = ? , rua_cliente = ?, nr_cliente = ?, cep_cliente = ?, id_cidade = ? "
                    + "WHERE id_cliente = ?");
            stmt.setString(1, cliente.getCpf());
            stmt.setString(2, cliente.getNome());
            stmt.setString(3, cliente.getEmail());
            stmt.setDate(4, new java.sql.Date(cliente.getData().getTime()));
            stmt.setString(5, cliente.getRua());
            stmt.setInt(6, cliente.getNr());
            stmt.setString(7, cliente.getCep());
            stmt.setInt(8, cliente.getCidade().getId());
            stmt.setInt(9, cliente.getId());
            stmt.executeUpdate();
        } catch (SQLException exception) {
            throw new RuntimeException("Erro. Origem="+exception.getMessage());
        } finally {
            if (stmt != null)
                try { stmt.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar stmt. Ex="+exception.getMessage()); }
            if (connection != null)
                try { connection.close(); }
                catch (SQLException exception) { System.out.println("Erro ao fechar conexão. Ex="+exception.getMessage()); }
        }
    }
    
    public void adicionarUm(Cliente cliente) throws ErroInserindoClienteException {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            stmt = connection.prepareStatement("INSERT INTO tb_cliente (cpf_cliente, nome_cliente, email_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade) VALUES "
                    + "(?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, cliente.getCpf());
            stmt.setString(2, cliente.getNome());
            stmt.setString(3, cliente.getEmail());
            stmt.setDate(4, new java.sql.Date(cliente.getData().getTime()));
            stmt.setString(5, cliente.getRua());
            stmt.setInt(6, cliente.getNr());
            stmt.setString(7, cliente.getCep());
            stmt.setInt(8, cliente.getCidade().getId());
            stmt.executeUpdate();
        } catch (SQLException exception) {
            throw new ErroInserindoClienteException();
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
    }
    
    public int validar(Cliente cliente) {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            stmt = connection.prepareStatement("SELECT * FROM tb_cliente WHERE cpf_cliente = ? AND id_cliente != ?");
            stmt.setString(1, cliente.getCpf());
            stmt.setInt(2, cliente.getId());
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return 1;
            }
            
            stmt = connection.prepareStatement("SELECT * FROM tb_cliente WHERE email_cliente = ? AND id_cliente != ?");
            stmt.setString(1, cliente.getEmail());
            stmt.setInt(2, cliente.getId());
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return 2;
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
        
        return 3;
    }
}
