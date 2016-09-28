<%-- 
    Document   : formulario
    Created on : 25/09/2016, 22:54:55
    Author     : Suélen A. Camargo <s-a-camargo@hotmail.com>
--%>

<%@page import="br.edu.ifsul.modelo.Instituicao"%>
<%@page import="br.edu.ifsul.dao.InstituicaoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="instituicaoDao" scope="session"
             type="InstituicaoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de instituicões</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Instituições</h2>
        <h2><%=instituicaoDao.getMensagem()%></h2>
        <a href="ServletInstituicao?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Ano Fundacao</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                  for(Instituicao e :instituicaoDao.getLista() )  {
                %>  
                <tr>
                    <td><%=e.getId()%></td>
                    <td><%=e.getNome()%></td>
                    <td><%=e.getAnoFundacao()%></td>
                    <td><a href="ServletInstituicao?acao=alterar&id=<%=e.getId()%>">Alterar</a></td>
                    <td><a href="ServletInstituicao?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>    
                    
            </tbody>
        </table>
    </body>
</html>
