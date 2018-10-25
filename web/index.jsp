<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="erro.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application" />
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    </head>
    <body style="height: 100%;">
        <div class="container" style="min-height: calc(100vh - 60px);">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card login-form">
                        <div class="card-header">
                            <h3 class="card-title">Login</h3>
                        </div>
                        <div class="card-body">
                            <c:if test="${msg != null}">
                                <div class="alert alert-danger" role="alert">
                                    ${msg}
                                </div>
                            </c:if>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <input class="form-control" placeholder="Login" type="text" name="login" autofocus="" />
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Senha" type="password" name="senha" />
                                </div>
                                <button class="btn btn-lg btn-success btn-block" type="submit">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    </body>
    <footer class="footer">
        <div class="footer-copyright text-center">
            Em caso de problemas contactar a administradora: ${configuracao.email}
        </div>
    </footer>
</html>
