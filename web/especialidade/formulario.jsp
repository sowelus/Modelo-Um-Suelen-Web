<%-- 
    Document   : formulario
    Created on : 25/09/2016, 21:54:55
    Author     : Su�len A. Camargo <s-a-camargo@hotmail.com>
--%>

<%@page import="br.edu.ifsul.dao.EspecialidadeDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="especialidadeDao" scope="session"
             type="EspecialidadeDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edi��o de Especialidades</title>
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
        <h2>Edi��o de Especialidades</h2>
        <h2><%=especialidadeDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletEspecialidade" method="POST">
            C�digo: <input type="text" name="id" id="id"
                           value="<%= especialidadeDao.getObjetoSelecionado().getId() == null
                           ? "" : especialidadeDao.getObjetoSelecionado().getId() %>"
                           size="6" readonly /><br/>
            Nome: <input type="text" name="nome" id="nome"
                           value="<%= especialidadeDao.getObjetoSelecionado().getNome()== null
                           ? "" : especialidadeDao.getObjetoSelecionado().getNome() %>"
                           size="6"/><br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/> 
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
