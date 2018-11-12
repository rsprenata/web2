package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Produto;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.exceptions.ClienteNaoExisteException;
import com.ufpr.tads.web2.exceptions.ErroBuscandoAtendimentoException;
import com.ufpr.tads.web2.exceptions.ErroBuscandoClienteException;
import com.ufpr.tads.web2.exceptions.ErroEfetuarAtendimentoException;
import com.ufpr.tads.web2.facade.ClientesFacade;
import com.ufpr.tads.web2.facade.ProdutoFacade;
import com.ufpr.tads.web2.facade.TipoAtendimentoFacade;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;


public class AtendimentoDao {
    public List<Atendimento> buscarByUsuario(Integer idUsuario) throws ErroBuscandoAtendimentoException { 
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Atendimento> atendimentos = new ArrayList<Atendimento>();
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_atendimento WHERE id_usuario = ?");
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            
            Produto produto = new Produto();
            Cliente cliente = new Cliente();
            Usuario usuario = new Usuario();
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                
                produto = ProdutoFacade.buscar(rs.getInt("id_produto"));
                usuario.setId(rs.getInt("id_usuario"));                
                try {
                    cliente = ClientesFacade.buscar(rs.getInt("id_cliente"));
                } catch (ClienteNaoExisteException ex) {
                    Logger.getLogger(AtendimentoDao.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ErroBuscandoClienteException ex) {
                    Logger.getLogger(AtendimentoDao.class.getName()).log(Level.SEVERE, null, ex);
                }
                atendimento.setId(rs.getInt("id_atendimento"));
                atendimento.setData(rs.getDate("dt_hr_atendimento"));
                atendimento.setDescricao(rs.getString("dsc_atendimento"));
                atendimento.setProduto(produto);
                atendimento.setTipoAtendimento(rs.getInt("id_tipo_atendimento"));
                atendimento.setUsuario(usuario);
                atendimento.setCliente(cliente);
                atendimento.setResolvido(rs.getString("res_atendimento"));
                
                atendimentos.add(atendimento);
            }
        } catch (SQLException exception) {
            throw new ErroBuscandoAtendimentoException();
        } finally {
            try { 
                if (rs != null)
                    rs.close(); 

                if (stmt != null)
                    stmt.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException exception) {throw new ErroBuscandoAtendimentoException();}
        }
        
        return atendimentos;
    }
    
    public Atendimento buscar(Integer idAtendimento) throws ErroBuscandoAtendimentoException { 
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection connection = connectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Atendimento atendimento = null;
        
        try { 
            stmt = connection.prepareStatement("SELECT * FROM tb_atendimento WHERE id_atendimento = ?");
            stmt.setInt(1, idAtendimento);
            rs = stmt.executeQuery();
            
            Produto produto = new Produto();
            Cliente cliente = new Cliente();
            Usuario usuario = new Usuario();
            while (rs.next()) {
                atendimento = new Atendimento();
                
                produto = ProdutoFacade.buscar(rs.getInt("id_produto"));
                usuario.setId(rs.getInt("id_usuario"));
                
                atendimento.setTipo(TipoAtendimentoFacade.buscar(rs.getInt("id_tipo_atendimento")));        
                cliente = ClientesFacade.buscar(rs.getInt("id_cliente"));   
                atendimento.setId(rs.getInt("id_atendimento"));
                atendimento.setData(rs.getDate("dt_hr_atendimento"));
                atendimento.setDescricao(rs.getString("dsc_atendimento"));
                atendimento.setProduto(produto);
                atendimento.setTipoAtendimento(rs.getInt("id_tipo_atendimento"));
                atendimento.setUsuario(usuario);
                atendimento.setCliente(cliente);
                atendimento.setResolvido(rs.getString("res_atendimento"));
                
            }
        } catch (SQLException | ErroBuscandoClienteException | ClienteNaoExisteException exception) {
            throw new ErroBuscandoAtendimentoException();
        } finally {
            try { 
                if (rs != null)
                    rs.close(); 

                if (stmt != null)
                    stmt.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException exception) {throw new ErroBuscandoAtendimentoException();}
        }
        
        return atendimento;
    }
    
    public void atender(Atendimento atendimento) throws ErroEfetuarAtendimentoException{
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            ConnectionFactory connectionFactory = new ConnectionFactory();
            con = connectionFactory.getConnection();

            stmt = con.prepareStatement("INSERT INTO tb_atendimento (dt_hr_atendimento, dsc_atendimento, \n" +
"		id_produto, id_tipo_atendimento, id_cliente, id_usuario, res_atendimento) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)");
            stmt.setDate(1, new java.sql.Date(atendimento.getData().getTime()));
            stmt.setString(2, atendimento.getDescricao());
            stmt.setInt(3, atendimento.getProduto().getId());
            stmt.setInt(4, atendimento.getTipoAtendimento());
            stmt.setInt(5, atendimento.getCliente().getId());
            stmt.setInt(6, atendimento.getUsuario().getId());
            stmt.setString(7, atendimento.getResolvido());
            stmt.executeUpdate();   
        }
        catch (SQLException ex) {
            throw new ErroEfetuarAtendimentoException();
        } finally {
            try { 
                if (stmt != null)
                    stmt.close();
                if (con != null)
                    con.close();
            } catch (SQLException exception) {throw new ErroEfetuarAtendimentoException();}
        }
    }
    
    
    
}
