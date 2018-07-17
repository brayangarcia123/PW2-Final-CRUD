/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.access;
import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import controller.role.PMF;
import model.resource.Resource;
import model.role.Role;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Access {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
    @Persistent private Long idRole;
    @Persistent private Long idRecurso;
    @Persistent private boolean estado;

    public Access (Long idRole,Long idRecurso, boolean estado) {
        this.idRole = idRole;
        this.idRecurso = idRecurso;
        this.estado = estado;
        
    }
	
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIdRole() {
		return idRole;
	}

	public void setIdRole(Long idRole) {
		this.idRole = idRole;
	}

	public Long getIdRecurso() {
		return idRecurso;
	}

	public void setIdRecurso(Long idRecurso) {
		this.idRecurso = idRecurso;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public String estadoDescripcion(){
    	if(estado)
    		return "ACTIVO";
    	return "INACTIVO";
    }

}
