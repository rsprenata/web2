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
        <title>Relatórios - Listar</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fontawesome-free-5.3.1-web/css/all.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1.custom/jquery-ui.min.css">
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

            <c:if test="${msg != null}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    ${msg}
                </div>
            </c:if>
            <div class="row">
                <div class="col-md-12">
                    <select class="form-control" id="selectRelatorio">
                        <option value="">Selecione o relatório</option>
                        <option value="1">Clientes ordenados por nome</option>
                        <option value="2">Atendimentos entre datas</option>
                        <option value="3">Todos atendimentos resolvidos</option>
                        <option value="4">Atendimentos por tipo</option>
                    </select>
                </div>
            </div>
            <div id="parametrosRelatorio1" class="row col-md-12 parametrizacao" style="display: none;">
                <form action="${pageContext.request.contextPath}/RelatoriosServlet" method="POST" target="_blank">
                    <input type="hidden" value="clientes" name="action" />
                    <br/>
                    <div class="row col-md-12 text-center">
                        <button class="btn btn-lg btn-success" type="submit">
                            <i class="fa fa-file-pdf-o pull-left"></i> Gerar
                        </button>
                    </div>
                </form>
            </div>
            <div id="parametrosRelatorio2" class="row col-md-12 parametrizacao" style="display: none;">
                <form action="${pageContext.request.contextPath}/RelatoriosServlet" method="POST" target="_blank">
                    <input type="hidden" value="atendimentosIntervalo" name="action" />
                    <br/>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="datepicker">Data inicio</label>
                                <input id="datepicker" class="form-control" placeholder="Data"  type="text" name="inicio"  required />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="datepicker2">Data fim</label>
                                <input id="datepicker2" class="form-control" placeholder="Data"  type="text" name="fim" required/>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="row col-md-12 text-center">
                        <button class="btn btn-lg btn-success" type="submit">
                            <i class="fa fa-file-pdf-o pull-left"></i> Gerar
                        </button>
                    </div>
                </form>
            </div>
            <div id="parametrosRelatorio3" class="row col-md-12 parametrizacao" style="display: none;">
                <form action="${pageContext.request.contextPath}/RelatoriosServlet" method="POST" target="_blank">
                    <input type="hidden" value="atendimentos" name="action" />
                    <br/>
                    <br/>
                    <div class="row col-md-12 text-center">
                        <button class="btn btn-lg btn-success" type="submit">
                            <i class="fa fa-file-pdf-o pull-left"></i> Gerar
                        </button>
                    </div>
                </form>
            </div>
            <div id="parametrosRelatorio4" class="row col-md-12 parametrizacao" style="display: none;">
                <form action="${pageContext.request.contextPath}/RelatoriosServlet" method="POST" target="_blank">
                    <input type="hidden" value="atendimentosTipo" name="action" />
                    <br/>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <select class="form-control" id="selectTipoAtendimento" name="tipoId" required>
                                  <option value="">Tipo de Atendimento</option>
                                  <c:forEach items="${tipos}" var="tipo">
                                      <option value="${tipo.id}">
                                          ${tipo.nome}
                                      </option>
                                  </c:forEach>
                                </select>
                            </div>  
                        </div>
                    </div>
                    <br/>
                    <div class="row col-md-12 text-center">
                        <button class="btn btn-lg btn-success" type="submit">
                            <i class="fa fa-file-pdf-o pull-left"></i> Gerar
                        </button>
                    </div>
                </form>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jQuery-Mask-Plugin-master/dist/jquery.mask.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function() {
                $( "#datepicker" ).datepicker();
                $( "#datepicker" ).datepicker( "option", "dateFormat", "dd/mm/yy" );
                $( "#datepicker2" ).datepicker();
                $( "#datepicker2" ).datepicker( "option", "dateFormat", "dd/mm/yy" );
            });
            $('#selectRelatorio').change(function (e) {
                var relatorio_id = this.value;

                if (relatorio_id) {
                    $('.parametrizacao').hide(255);
                    $('#parametrosRelatorio' + relatorio_id).show(510);
                }
            });
            
        </script>
    </body>
    <footer class="footer">
        <div class="footer-copyright text-center">
            Em caso de problemas contactar a administradora: ${configuracao.email}
        </div>
    </footer>
</html>
