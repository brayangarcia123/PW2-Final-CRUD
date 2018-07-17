/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.equip;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Equip {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long codigo;
    @Persistent private String nombre;
    @Persistent private String modelo;
    @Persistent private String marca;
    @Persistent private String funusos;
    @Persistent private String descrip;
    @Persistent private boolean estado;
    public Equip(String nombre, String modelo, String marca, String funusos, String descrip,boolean estado) {
    	
        this.nombre = nombre;
        this.modelo = modelo;
        this.marca = marca;
        this.funusos = funusos;
        this.descrip = descrip;
        this.estado = estado;
    }
    
    public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public Long getCodigo() {
        return codigo;
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    
    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getMarca() {
        return marca;
    }
    
    
    public String getFuncion() {
        return funusos;
    }

    public void setFuncion(String funusos) {
        this.funusos = funusos;
    }

    public String getDescripccion() {
        return descrip;
    }

    public void setDescripccion(String descrip) {
        this.descrip = descrip;
    }
    public String getEstadoDescripcion(){
    	if(estado)
    		return "ACTIVO";
    	return "INACTIVO";
    }
    
    
    
}
