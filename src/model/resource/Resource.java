/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Resource {
	
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
    @Persistent private String url;
    @Persistent private Date fecha;//Fecha de Creacion
    @Persistent private boolean estado;

    public Resource (String url,Date fechaCreacion, boolean estado) {
    	
        this.url = url;
        this.fecha = fechaCreacion;
        this.estado = estado;
        
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String nombre) {
		this.url = nombre;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
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
    public String fechaDescripcion(){
    	
    	SimpleDateFormat format=new SimpleDateFormat("dd MMMM 'del' YYYY HH:mm:s ");
        format.setTimeZone(TimeZone.getTimeZone("America/Lima"));
        return format.format(fecha);
    }
    
}
