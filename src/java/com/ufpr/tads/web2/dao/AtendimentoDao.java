package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Produto;
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
            
            Produto produto = new Produto();
            Cliente cliente = new Cliente();
            Usuario usuario = new Usuario();
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                
                produto.setId(rs.getInt("id_produto"));
                usuario.setId(rs.getInt("id_usuario"));
                cliente.setId(rs.getInt("id_cliente"));
                
                
                atendimento.setId(rs.getInt("id_atendimento"));
                atendimento.setData(rs.getDate("dt_hr_atendimento"));
                atendimento.setDescricao(rs.getString("dsc_atendimento"));
                atendimento.setProduto(produto);
                atendimento.setTipoAtendimento(rs.getInt("id_tipo_atendimento"));
                atendimento.setUsuario(usuario);
                atendimento.setCliente(cliente);
                
                atendimentos.add(atendimento);
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
        
        return atendimentos;
    }
    
    
    
}
