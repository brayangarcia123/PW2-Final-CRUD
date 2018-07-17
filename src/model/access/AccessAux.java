package model.access;

public class AccessAux {

	private Long id;
	private String role;
	private String recurso;
	private boolean estado;

	public AccessAux(Long id, String role, String recurso, boolean estado) {
		this.id = id;
		this.role = role;
		this.recurso = recurso;
		this.estado = estado;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getRecurso() {
		return recurso;
	}
	public void setRecurso(String recurso) {
		this.recurso = recurso;
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
