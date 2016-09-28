package br.edu.ifsul.dao;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.util.Util;
import br.edu.ifsul.modelo.Aluno;
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

public class AlunoDAO implements Serializable {
    
    private Aluno objetoSelecionado; 
    private String mensagem = ""; 
    private EntityManager em; 
    
    public AlunoDAO(){
        em = EntityManagerUtil.getEntityManager(); 
    }
    
    public boolean validaObjeto(Aluno obj){
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Aluno>> erros = validador.validate(obj);
        if (erros.size() > 0){ 
            mensagem = ""; 
            mensagem += "Objeto com erros: <br/>";
            for (ConstraintViolation<Aluno> erro : erros){
                mensagem += "Erro: "+erro.getMessage()+"<br/>";
            }
            return false;
        } else {
            return true;
        }
    }
    
    public List<Aluno> getLista(){
        return em.createQuery("from Aluno order by nome").getResultList();
    }
    
    public boolean salvar(Aluno obj){
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
    
    public boolean remover(Aluno obj){
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
    
    public Aluno localizar(Integer id){
        return em.find(Aluno.class, id);
    }

    public Aluno getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Aluno objetoSelecionado) {
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
