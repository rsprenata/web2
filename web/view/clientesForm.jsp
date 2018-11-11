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
        <title>Clientes - Alterar</title>
        
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
                  <a class="nav-link js-scroll-trigger active" href="${pageContext.request.contextPath}/ClientesServlet">Cadastro de Clientes</a>
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
            
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">${form == 'alterar' ? 'Alterar' : 'Adicionar'} cliente</h3>
                        </div>
                        <div class="card-body">
                            <form id="formulario" action="ClientesServlet?action=${form == 'alterar' ? 'update' : 'new'}" method="post">
                                <c:if test="${form == 'alterar'}">
                                    <input type="hidden" name="id" value="${cliente.id}" />
                                </c:if>
                                <div class="form-group">
                                    <input id="cpf" class="form-control cpf" placeholder="CPF" type="text" name="cpf" value="${form == 'alterar' ? cliente.cpf : ''}" autofocus="" required maxlength="14" />
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Nome"  type="text" name="nome" value="${form == 'alterar' ? cliente.nome : ''}" required maxlength="100" />
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail"  type="email" name="email" value="${form == 'alterar' ? cliente.email : ''}" required maxlength="100" />
                                </div>
                                <div class="form-group">
                                    <input id="datepicker" class="form-control" placeholder="Data"  type="text" name="data" <c:if test="${form == 'alterar'}">value="<fmt:formatDate value="${cliente.data}" pattern="dd/MM/yyyy" />"</c:if> required maxlength="10" />
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Rua"  type="text" name="rua" value="${form == 'alterar' ? cliente.rua : ''}" required maxlength="100" />
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Número"  type="number" name="nr" value="${form == 'alterar' ? cliente.nr : ''}" required />
                                </div>
                                <div class="form-group">
                                    <input id="cep" class="form-control cep" placeholder="CEP"  type="text" name="cep" value="${form == 'alterar' ? cliente.cep : ''}" required maxlength="9" />
                                </div>
                                <div class="form-group">
                                    <select class="form-control" id="selectEstado" name="estado" required>
                                      <option value="">Estado</option>
                                      <c:forEach items="${estados}" var="estado">
                                          <option value="${estado.id}" ${form == 'alterar' && estado.id == cliente.cidade.idEstado ? 'selected' : ''}>${estado.nome} - ${estado.sigla}</option>
                                      </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" id="selectCidade" name="cidade" required>
                                      <option value="">Cidade</option>
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
