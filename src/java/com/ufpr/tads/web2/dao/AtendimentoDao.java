package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.facade.CidadesFacade;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AtendimentoDao {
    public List<Atendimento> carregarTodos() { 
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Atendimento> atendimentos = new ArrayList<Atendimento>();
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_atendimento");
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                
                atendimento.setId(rs.getInt("id_atendimento"));
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
    
}
