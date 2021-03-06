<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="erro.jsp"%>
<c:if test="${sessionScope.logado == null}">
    <c:set var="msg" value="Usuário deve se autenticar para acessar o sistema." scope="request" />
    <jsp:forward page="index.jsp" />
</c:if>
<jsp:useBean id="logado" class="com.ufpr.tads.web2.beans.LoginBean" scope="session" />
<jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application" />
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Atendimentos - Listar</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fontawesome-free-5.3.1-web/css/all.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="container navbar-nav">
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/ClientesServlet">Cadastro de Clientes</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Atendimentos
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="${pageContext.request.contextPath}/AtendimentoServlet?action=efetuarForm">Efetuar atendimento</a>
                      <a class="dropdown-item" href="${pageContext.request.contextPath}/AtendimentoServlet?action=mostrar">Mostrar atendimentos</a>
                    </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/LogoutServlet">Sair</a>
                </li>
              </ul>
            </div>
        </nav>
        <div class="container wrapper">
            <h1>Olá ${logado.nome}</h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Data</th>
                        <th>Cliente</th>
                        <th>Produto</th>
                    </tr>
                </thead>
                <tbody>
                    <!--data/hora, produto e nome do cliente. Deve apresentar um botão de detalhes que apresenta a
                              tela atendimentoDetalhes.jsp ; -->
                    <c:forEach items="${atendimentos}" var="atendimento">
                        <tr>
                            <td><fmt:formatDate value="${atendimento.data}" pattern="dd/MM/yyyy HH:mm" /></td>
                            <td>${atendimento.cliente.nome}</td>
                            <td>${atendimento.produto.nome}</td>
                            <td>
                                <a href="AtendimentoServlet?action=detalhes&id=${atendimento.id}" class="btn"><i class="fas fa-eye"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jQuery-Mask-Plugin-master/dist/jquery.mask.min.js"></script>
    </body>
    <footer class="footer">
        <div class="footer-copyright text-center">
            Em caso de problemas contactar a administradora: ${configuracao.email}
        </div>
    </footer>
</html>
