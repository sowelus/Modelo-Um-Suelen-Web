package br.edu.ifsul.dao;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.util.Util;
import br.edu.ifsul.modelo.Especialidade;
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

public class EspecialidadeDAO implements Serializable {
    
    private Especialidade objetoSelecionado; 
    private String mensagem = ""; 
    private EntityManager em; 
    
    public EspecialidadeDAO(){
        em = EntityManagerUtil.getEntityManager(); 
    }
    
    public boolean validaObjeto(Especialidade obj){
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Especialidade>> erros = validador.validate(obj);
        if (erros.size() > 0){ 
            mensagem = ""; 
            mensagem += "Objeto com erros: <br/>";
            for (ConstraintViolation<Especialidade> erro : erros){
                mensagem += "Erro: "+erro.getMessage()+"<br/>";
            }
            return false;
        } else {
            return true;
        }
    }
    
    public List<Especialidade> getLista(){
        return em.createQuery("from Especialidade order by nome").getResultList();
    }
    
    public boolean salvar(Especialidade obj){
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
    
    public boolean remover(Especialidade obj){
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
    
    public Especialidade localizar(Integer id){
        return em.find(Especialidade.class, id);
    }

    public Especialidade getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Especialidade objetoSelecionado) {
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
