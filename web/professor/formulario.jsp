<%-- 
    Document   : formulario.jsp
    Created on : 08/09/2016, 11:48:27
    Author     : Suélen
--%>

<%@page import="br.edu.ifsul.dao.ProfessorDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="professorDao" scope="session"
             type="ProfessorDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Professors</title>
        <script>
            function doSalvar(){
                document.getElementById("acao").value = 'salvar';
                document.getElementById("form").submit();
            }
            function doCancelar(){
                document.getElementById("acao").value = 'cancelar';
                document.getElementById("form").submit();
            }            
        </script>                        
    </head>
    <body>
        <h1>Edição de Professores</h1>
        <h2><%=professorDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletProfessor" method="POST">
           Código: <input type="text" name="id" id="id"
                           value="<%= professorDao.getObjetoSelecionado().getId() == null
                           ? "" : professorDao.getObjetoSelecionado().getId() %>"
                           size="6" readonly /><br/>
            
           Nome: <input type="text" name="nome" id="nome"
                           value="<%= professorDao.getObjetoSelecionado().getNome() == null
                           ? "" : professorDao.getObjetoSelecionado().getNome() %>"
                           size="20"/><br/>
           Email: <input type="text" name="email" id="email"
                           value="<%= professorDao.getObjetoSelecionado().getEmail()== null
                           ? "" : professorDao.getObjetoSelecionado().getEmail()%>"
                           size="20"/><br/>
           Nascimento: <input type="text" name="nascimento" id="nascimento"
                           value="<%= professorDao.getObjetoSelecionado().getNascimento()== null
                           ? "" : professorDao.getObjetoSelecionado().getNascimento()%>"
                           size="20"/><br/>
           Titulação: <input type="text" name="titulacao" id="titulacao"
                           value="<%= professorDao.getObjetoSelecionado().getTitulacao()== null
                           ? "" : professorDao.getObjetoSelecionado().getTitulacao() %>"
                           size="20"/><br/>
            <br/>
           Tópicos de Interesse: <input type="text" name="topicosDeInteresse" id="topicosDeInteresse"
                           value="<%= professorDao.getObjetoSelecionado().getTopicosDeInteresse()== null
                           ? "" : professorDao.getObjetoSelecionado().getTopicosDeInteresse() %>"
                           size="20"/><br/>               
            
            <br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
