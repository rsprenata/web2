<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application" />
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Erro</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="card error-form">
                        <div class="card-header">
                            <h3 class="card-title">ERRO</h3>
                        </div>
                        <div class="card-body">
                            <div class="alert alert-danger" role="alert">
                                ${pageContext.exception.message}
                            </div>
                            <div class="alert alert-danger" role="alert">
                                ${pageContext.out.flush()}
                                ${pageContext.exception.printStackTrace(pageContext.response.writer)}
                            </div>
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
