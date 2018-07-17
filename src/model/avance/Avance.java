/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.avance;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Avance {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long codigo;
    @Persistent private String nombre;
    @Persistent private String apellido;
    @Persistent private String profesion;
    @Persistent private String telefono;
    @Persistent private String proyecto;
    @Persistent private String avance;
    @Persistent private String facturador;
    @Persistent private String total;
    @Persistent private String tiempo;
    
    public Avance(String nombre, String apellidos, String profesion,String telefono, String proyecto, String avance, String facturador, String total, String tiempo) {
    	
        this.nombre = nombre;
        this.apellido = apellidos;
        this.profesion = profesion;
        this.telefono = telefono;
        this.proyecto=proyecto;
        this.avance = avance;
        this.facturador = facturador;
        this.total = total;
        this.tiempo = tiempo;
    }
    
    
    public void setFacturador(String facturador) {
        this.facturador = facturador;
    }

    public String getFacturador() {
        return facturador;
    }    
    
    public void setTotal(String total) {
        this.total = total;
    }

    public String getTotal() {
        return total;
    } 
    
    
    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

    public String getTiempo() {
        return tiempo;
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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellidos) {
        this.apellido = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }
    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getProyecto() {
        return proyecto;
    }

    public void setProyecto(String proyecto) {
        this.proyecto=proyecto;
    }
    
    public String getAvance() {
        return avance;
    }

    public void setAvance(String av) {
        this.avance= av;
    }
    
}
