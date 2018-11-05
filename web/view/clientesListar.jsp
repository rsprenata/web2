<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Clientes - Listar</title>
        
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
                  <a class="nav-link js-scroll-trigger active" href="${pageContext.request.contextPath}/ClientesServlet">Cadastro de Clientes</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/AtendimentoServlet">Atendimentos</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/LogoutServlet">Sair</a>
                </li>
              </ul>
            </div>
        </nav>
        <div class="container wrapper">
            <h1>Olá ${logado.nome}</h1>

            <c:if test="${msg != null}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    ${msg}
                </div>
            </c:if>
            <div class="text-center form-group">
                <a href="ClientesServlet?action=formNew" class="btn btn-success">NOVO</a>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>CPF</th>
                        <th>Nome</th>
                        <th>E-mail</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${clientes}" var="cliente">
                        <tr>
                            <td><div class="cpf">${cliente.cpf}</div></td>
                            <td>${cliente.nome}</td>
                            <td>${cliente.email}</td>
                            <td>
                                <a href="ClientesServlet?action=show&id=${cliente.id}" class="btn"><i class="fas fa-eye"></i></a>
                                <a href="ClientesServlet?action=formUpdate&id=${cliente.id}" class="btn"><i class="fas fa-edit"></i></a>
                                <button class="btn btn-link btnRemover" onclick="confirmarRemover('${cliente.id}')"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
            
        <div class="modal fade" id="modalConfirmarRemover" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Confirmar</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Deseja realmente remover este cliente?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <a id="linkRemover" class="btn btn-primary">Confirmar</a>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jQuery-Mask-Plugin-master/dist/jquery.mask.min.js"></script>
        <script>
            $(document).ready(function() {
                $(".cpf").mask("000.000.000-00");
            });
            function confirmarRemover(idCliente) {
                $('#modalConfirmarRemover #linkRemover').attr("href", "ClientesServlet?action=remove&id=" + idCliente);
                $('#modalConfirmarRemover').modal("show");
            }
        </script>
    </body>
    <footer class="footer">
        <div class="footer-copyright text-center">
            Em caso de problemas contactar a administradora: ${configuracao.email}
        </div>
    </footer>
</html>
