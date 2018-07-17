/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.localll;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Localll {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long codigo;
    @Persistent private String local;

    @Persistent private String encargado;
    @Persistent private String telefono;
    @Persistent private String direccion;
    @Persistent private String email;
    
    public Localll(String local, String encargado,String telefono, String direccion) {
    	
        this.local = local;
       
        this.encargado = encargado;
        this.telefono = telefono;
        this.direccion = direccion;
        
    }
    
    public Long getCodigo() {
        return codigo;
    }
    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getTelefono() {
        return telefono;
    }
    public void setEncargado(String encargado) {
        this.encargado = encargado;
    }

    public String getEncargado() {
        return encargado;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    
    
    
    
}
