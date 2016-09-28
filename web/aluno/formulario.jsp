<%-- 
    Document   : formulario
    Created on : 26/09/2016, 20:30:55
    Author     : Suélen A. Camargo <s-a-camargo@hotmail.com>
--%>

<%@page import="br.edu.ifsul.dao.AlunoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="alunoDao" scope="session"
             type="AlunoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Alunos</title>
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
        <h2>Edição de Alunos</h2>
        <h2><%=alunoDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletAluno" method="POST">
            Código: <input type="text" name="id" id="id"
                           value="<%= alunoDao.getObjetoSelecionado().getId() == null
                           ? "" : alunoDao.getObjetoSelecionado().getId() %>"
                           size="6" readonly /><br/>
            Nome: <input type="text" name="nome" id="nome"
                           value="<%= alunoDao.getObjetoSelecionado().getNome()== null
                           ? "" : alunoDao.getObjetoSelecionado().getNome() %>"
                           size="20"/><br/>
            Email: <input type="text" name="email" id="email"
                           value="<%= alunoDao.getObjetoSelecionado().getEmail()== null
                           ? "" : alunoDao.getObjetoSelecionado().getEmail()%>"
                           size="20"/><br/>
            Data Nascimento (DD/MM/AA): <input type="text" name="nascimento" id="nascimento"
                           value="<%= alunoDao.getObjetoSelecionado().getNascimento()== null
                           ? "" : alunoDao.getObjetoSelecionado().getNascimento()%>"
                           size="8"/><br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/> 
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
