package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.LoginBean;
import com.ufpr.tads.web2.beans.Produto;
import com.ufpr.tads.web2.beans.TipoAtendimento;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.ConnectionFactory;
import com.ufpr.tads.web2.exceptions.ClienteNaoExisteException;
import com.ufpr.tads.web2.exceptions.ErroBuscandoClienteException;
import com.ufpr.tads.web2.facade.AtendimentoFacade;
import com.ufpr.tads.web2.facade.ClientesFacade;
import com.ufpr.tads.web2.facade.EstadosFacade;
import com.ufpr.tads.web2.facade.ProdutoFacade;
import com.ufpr.tads.web2.facade.TipoAtendimentoFacade;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author renata.pereira
 */
@WebServlet(name = "RelatoriosServlet", urlPatterns = {"/RelatoriosServlet"})
public class RelatoriosServlet extends HttpServlet {

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
                List<TipoAtendimento> tipos = TipoAtendimentoFacade.buscarTodos();
                request.setAttribute("tipos", tipos);
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/relatoriosListar.jsp");
                rd.forward(request, response);
                
                //AQUI SÃO OS RELATORIOS
            } else if ("clientes".equals(action) ||
                        "atendimentosIntervalo".equals(action) ||
                        "atendimentos".equals(action) ||
                        "atendimentosTipo".equals(action)) {
                
                //ALGUNS PRECISAM DE PARAMETROS
                HashMap params = new HashMap();
                if ("atendimentosIntervalo".equals(action)) {
                    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                    try {
                        params.put("inicio", new java.sql.Date(formato.parse(request.getParameter("inicio")).getTime()));
                        params.put("fim", new java.sql.Date(formato.parse(request.getParameter("fim")).getTime()));
                    } catch (ParseException ex) {
                        Logger.getLogger(RelatoriosServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else if ("atendimentosTipo".equals(action)) {
                    params.put("tipoId", Integer.parseInt(request.getParameter("tipoId")));
                }
                
                try {
                    gerarRelatorio(action, params, request, response);
                } catch (Exception ex) {
                    request.setAttribute("msg", "Erro ao gerar relatório");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/relatoriosListar.jsp");
                    rd.forward(request, response);
                }
            }
        } else {
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/index.jsp");
            rd.forward(request, response);
        }
    }
    
    public void gerarRelatorio(String relatorio, HashMap params, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Connection con = null;
        try {
            ConnectionFactory connectionFactory = new ConnectionFactory();
            con = connectionFactory.getConnection();
            
            String jasper = request.getContextPath() + "/"+ relatorio +".jasper";
            String host = "http://" + request.getServerName() + ":" + request.getServerPort();
            
            URL jasperURL = new URL(host + jasper);
            
            byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, con);
            
            if (bytes != null) {
                response.setContentType("application/pdf");
                
                OutputStream ops = response.getOutputStream();
                
                ops.write(bytes);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    throw e;
                }
            }
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