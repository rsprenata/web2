/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Cidade;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Estado;
import com.ufpr.tads.web2.beans.LoginBean;
import com.ufpr.tads.web2.beans.Produto;
import com.ufpr.tads.web2.beans.TipoAtendimento;
import com.ufpr.tads.web2.exceptions.ClienteNaoExisteException;
import com.ufpr.tads.web2.exceptions.ErroBuscandoClienteException;
import com.ufpr.tads.web2.facade.AtendimentoFacade;
import com.ufpr.tads.web2.facade.ClientesFacade;
import com.ufpr.tads.web2.facade.EstadosFacade;
import com.ufpr.tads.web2.facade.ProdutoFacade;
import com.ufpr.tads.web2.facade.TipoAtendimentoFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author renata.pereira
 */
@WebServlet(name = "AtendimentoServlet", urlPatterns = {"/AtendimentoServlet"})
public class AtendimentoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        LoginBean lb = (LoginBean)session.getAttribute("logado");
        
        if (lb != null) {
            String action = request.getParameter("action");

            if ("list".equals(action) || null == action || "".equals(action)) {
                List<Atendimento> atendimentos = AtendimentoFacade.buscarTodos();
                request.setAttribute("atendimentos", atendimentos);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/atendimentoListar.jsp");
                rd.forward(request, response);
            } else if ("show".equals(action)) {
                Integer id = Integer.parseInt(request.getParameter("id"));
                Cliente cliente;
                try {
                    cliente = ClientesFacade.buscar(id);
                    
                    request.setAttribute("cliente", cliente);
                    request.setAttribute("estado", EstadosFacade.carregarUm(cliente.getCidade().getIdEstado()));
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/atendimentoListar.jsp");
                    rd.forward(request, response);
                } catch (ClienteNaoExisteException | ErroBuscandoClienteException ex) {
                    request.setAttribute("msg", ex.getMessage());
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/AtendimentoServlet?action=list");
                    rd.forward(request, response);
                }
            } else if ("new".equals(action)) {
                
                String dataTela = request.getParameter("dataAtual");
                SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yy HH:mm");
                try{
                    Date data = formato.parse(dataTela);
                }catch(Exception e){
                    
                }
                
                Integer idTipoAtendimento = Integer.parseInt(request.getParameter("tipoAtendimento"));
                
                
                Integer produto = Integer.parseInt(request.getParameter("produto"));
               
                
                
                Integer cliente = Integer.parseInt(request.getParameter("cliente"));
                
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/atendimento.jsp");
                rd.forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/index.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
