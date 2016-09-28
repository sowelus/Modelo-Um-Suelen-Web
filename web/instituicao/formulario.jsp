<%-- 
    Document   : formulario
    Created on : 25/09/2016, 21:54:55
    Author     : Suélen A. Camargo <s-a-camargo@hotmail.com>
--%>

<%@page import="br.edu.ifsul.dao.InstituicaoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="instituicaoDao" scope="session"
             type="InstituicaoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Instituições</title>
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
        <h2>Edição de Instituições</h2>
        <h2><%=instituicaoDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletInstituicao" method="POST">
            Código: <input type="text" name="id" id="id"
                           value="<%= instituicaoDao.getObjetoSelecionado().getId() == null
                           ? "" : instituicaoDao.getObjetoSelecionado().getId() %>"
                           size="6" readonly /><br/>
            Nome: <input type="text" name="nome" id="nome"
                           value="<%= instituicaoDao.getObjetoSelecionado().getNome()== null
                           ? "" : instituicaoDao.getObjetoSelecionado().getNome() %>"
                           size="20"/><br/>
            Ano Fundacao: <input type="text" name="anoFundacao" id="anoFundacao"
                           value="<%= instituicaoDao.getObjetoSelecionado().getAnoFundacao()== null
                           ? "" : instituicaoDao.getObjetoSelecionado().getAnoFundacao()%>"
                           size="20"/><br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/> 
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
