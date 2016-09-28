<%-- 
    Document   : listar
    Created on : 08/09/2016, 10:35:16
    Author     : jorge
--%>

<%@page import="br.edu.ifsul.modelo.Professor"%>
<%@page import="br.edu.ifsul.dao.ProfessorDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="professorDao" scope="session"
             type="ProfessorDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de professores</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h2>Professores</h2>
        <h2><%=professorDao.getMensagem()%></h2>
        <a href="ServletProfessor?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Nascimento</th>
                    <th>Titulação</th>
                    <th>Tópicos de Interesse</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for(Professor c : professorDao.getLista()){  // inicio do laço de repetição                  
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getNascimento()%></td>
                    <td><%=c.getTitulacao()%></td>
                    <td><%=c.getTopicosDeInteresse()%></td>
                    
                    <td><a href="ServletProfessor?acao=alterar&id=<%=c.getId()%>">Alterar</a></td>
                    <td><a href="ServletProfessor?acao=excluir&id=<%=c.getId()%>">Excluir</a></td>
                </tr>
                <%
                    } // fim do laço de repetição
                %>
            </tbody>
        </table>
    </body>
</html>
