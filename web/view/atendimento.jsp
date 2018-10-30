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
        <title>Mostrar Atendimentos</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fontawesome-free-5.3.1-web/css/all.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1.custom/jquery-ui.min.css">
    </head>
    <body>
        <!--menu -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="container navbar-nav">
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="ClientesServlet">Cadastro de Clientes</a>
                </li>               
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger active" href="AtendimentoServlet">Atendimentos</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="LogoutServlet">Sair</a>
                </li>
              </ul>
            </div>
        </nav>
        <div class="container wrapper">
            <h1>Olá ${logado.nome}</h1>
            
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Atendimento</h3>
                        </div>
                        <div class="card-body">
                            <form id="formulario" action="AtendimentoServlet?action=new" method="post">                               
                            <jsp:useBean id="now" class="java.util.Date" />
                            <fmt:formatDate var="dataAtual" value="${now}" pattern="dd/MM/yyyy HH:mm" />
                                <div class="form-group">
                                    <input class="form-control" id="dataAtual" name="dataAtual" value="${dataAtual}" readonly/>
                                      
                                </div>
                                
                                <div class="form-group">
                                    <select class="form-control" id="selectTipoAtendimento" name="tipoAtendimento" required>
                                      <option value="">Tipo de Atendimento</option>
                                      <c:forEach items="${tiposAtendimento}" var="tipo">
                                          <option value="${tipo.id}">
                                              ${tipo.nome}
                                          </option>
                                      </c:forEach>
                                    </select>
                                </div>                               
                                <div class="form-group">
                                    <select class="form-control" id="selectCliente" name="cliente" required>
                                      <option value="">Cliente</option>
                                      <c:forEach items="${clientes}" var="cliente">
                                          <option value="${cliente.id}">
                                              ${cliente.nome}/CPF:${cliente.cpf}
                                          </option>
                                      </c:forEach>
                                    </select>
                                </div>  
                                <div class="form-group">
                                    <select class="form-control" id="selectProduto" name="produto" required> <!--multiple pode selecionar mais de 1 com ctrl -->
                                        <option value="">Produto</option>
                                      <c:forEach items="${produtos}" var="produto">
                                          <option value="${produto.id}">
                                              ${produto.nome}
                                          </option>
                                      </c:forEach>
                                    </select>
                                </div>
                                <button class="btn btn-lg btn-success btn-block" type="submit">
                                    ${form == 'alterar' ? 'Alterar' : 'Salvar'}
                                </button>
                                <a href="ClientesServlet" class="btn btn-lg btn-light btn-block">Cancelar</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
        <c:if test="${erro != null}">
            <div class="modal fade" id="modalErro" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">ERRO</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ${erro}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        
        <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jQuery-Mask-Plugin-master/dist/jquery.mask.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
        
        <script type="text/javascript" >
            $(document).ready(function() {
                $("#selectEstado").change(function() {
                  getCidades();
                });
                
                $('.cpf').mask('000.000.000-00', {reverse: true});
                $('.cep').mask('00000-000');
                $( "#datepicker" ).datepicker();
                $( "#datepicker" ).datepicker( "option", "dateFormat", "dd/mm/yy" );
                <c:if test="${form == 'alterar'}">
                    $("#datepicker").datepicker( "setDate" , "<fmt:formatDate value="${cliente.data}" pattern="dd/MM/yyyy" />" );
                </c:if>
            });
            
            <c:if test="${erro != null}">
                $('#modalErro').modal("show");
            </c:if>
            
            $("#formulario").submit(function(e) {
                $("#cpf").val($("#cpf").cleanVal());
                $("#cep").val($("#cep").cleanVal());
            });

            function getCidades(){
                var estadoId = $("#selectEstado").val();
                var url = "AJAXServlet";
                $.ajax({
                        url : url, // URL da sua Servlet
                        data : {
                            estadoId : estadoId
                        }, // Parâmetro passado para a Servlet
                        dataType : 'json',
                        success : function(data) {
                            // Se sucesso, limpa e preenche a combo de cidade
                            // alert(JSON.stringify(data));
                            $("#selectCidade").empty();
                            $("#selectCidade").append('<option value="">Cidade</option>');
                            $.each(data, function(i, obj) {
                                var option = '<option value=' + obj.id;
                                <c:if test="${form == 'alterar'}">
                                    var clienteCidadeId = '${cliente.cidade.id}';
                                    if (obj.id == clienteCidadeId) {
                                        option += ' selected ';
                                    }
                                </c:if>
                                option += '>' + obj.nome + '</option>';
                                $("#selectCidade").append(option);
                            });
                        },
                        error : function(request, textStatus, errorThrown) {
                            alert(request.status + ', Error: ' + request.statusText);
                             // Erro
                        }
                    });
            } 
            <c:if test="${form == 'alterar'}">
                getCidades();
            </c:if>
        </script>
    </body>
    <footer class="footer">
        <div class="footer-copyright text-center">
            Em caso de problemas contactar a administradora: ${configuracao.email}
        </div>
    </footer>
</html>