package br.edu.ifsul.dao;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.util.Util;
import br.edu.ifsul.modelo.Professor;
import java.io.Serializable;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

/**
 *
 * @author Suélen A. Camargo <s-a-camargo@hotmail.com>
 */

public class ProfessorDAO implements Serializable {
    
    private Professor objetoSelecionado; 
    private String mensagem = ""; 
    private EntityManager em; 
    
    public ProfessorDAO(){
        em = EntityManagerUtil.getEntityManager(); 
    }
    
    public boolean validaObjeto(Professor obj){
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Professor>> erros = validador.validate(obj);
        if (erros.size() > 0){ 
            mensagem = ""; 
            mensagem += "Objeto com erros: <br/>";
            for (ConstraintViolation<Professor> erro : erros){
                mensagem += "Erro: "+erro.getMessage()+"<br/>";
            }
            return false;
        } else {
            return true;
        }
    }
    
    public List<Professor> getLista(){
        return em.createQuery("from Professor order by nome").getResultList();
    }
    
    public boolean salvar(Professor obj){
        try {
            em.getTransaction().begin();
            if (obj.getId() == null){
                em.persist(obj); 
            } else {
                em.merge(obj); 
            }
            em.getTransaction().commit(); 
            mensagem = "Objeto persistido com sucesso";
            return true;
        } catch (Exception e){
            if (em.getTransaction().isActive() == false){ // verificando se a transação não esta ativa
                em.getTransaction().begin();
            } 
            em.getTransaction().rollback(); // desfazendo possivel alterações que ocorreram 
            mensagem = "Erro ao persistir objeto: "+Util.getMensagemErro(e);
            return false;
        }
    }
    
    public boolean remover(Professor obj){
        try {
            em.getTransaction().begin();// inicia uma transação
            em.remove(obj); // removendo o objeto
            em.getTransaction().commit(); // finalizando transação
            mensagem = "Objeto removido com sucesso";
            return true;
        } catch (Exception e){
            if (em.getTransaction().isActive() == false){ // verificando se a transação não esta ativa
                em.getTransaction().begin();
            } 
            em.getTransaction().rollback(); // desfazendo possivel alterações que ocorreram 
            mensagem = "Erro ao remover objeto: "+Util.getMensagemErro(e);
            return false;
        }
    } 
    
    public Professor localizar(Integer id){
        return em.find(Professor.class, id);
    }

    public Professor getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Professor objetoSelecionado) {
        this.objetoSelecionado = objetoSelecionado;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

}
