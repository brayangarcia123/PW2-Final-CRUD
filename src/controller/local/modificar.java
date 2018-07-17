package controller.local;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import model.localll.*;

import javax.jdo.PersistenceManager;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import model.access.Access;
import model.resource.Resource;
import model.role.Role;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controller.userss.PMF;
import model.access.Access;
import model.equip.*;
import model.resource.Resource;
import model.userss.Userss;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

@SuppressWarnings("serial")
public class modificar extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();

		if(user == null){
			resp.sendRedirect(us.createLoginURL(req.getRequestURI()));}
		else if(us.isUserAdmin() || accesoRecurso(user.getEmail(),req.getRequestURI())){
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try {
			
			String codigo = req.getParameter("codigo");
			Long codigoLong = Long.parseLong(codigo); 
			Localll prof = pm.getObjectById(Localll.class,codigoLong);
			req.setAttribute("profesor",prof);
			req.getRequestDispatcher("/WEB-INF/Views/Localll/modificar.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			pm.close();
		}
	}
		else {

			try {
				req.getRequestDispatcher("/WEB-INF/Views/AccesoDenegado.jsp").forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
			//Realizar la persistencia
		String codigo = req.getParameter("codigo");
		String local = req.getParameter("local");
		
		String encargado = req.getParameter("encargado");
		String telefono = req.getParameter("telefono");
		String direccion = req.getParameter("direccion");
		
		
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try{
			Long codigoLong = Long.parseLong(codigo);
			
			Localll prof = pm.getObjectById(Localll.class,codigoLong);
			prof.setLocal(local);
			
			prof.setEncargado(encargado);
			prof.setTelefono(telefono);
			prof.setDireccion(direccion);
			
			
		}
		catch(Exception e){
			System.out.println("Se produjo un Error");
		}
		finally{
			pm.close();
		}
			resp.sendRedirect("/localll");
	}
	
	private boolean accesoRecurso(String gmail,String url){

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery(Userss.class);
		query.setFilter("email == idParam");
		query.declareParameters("String idParam");

		List<Userss> array = (List<Userss>) query.execute(gmail);

		if(array.size()> 0 ){

			Userss usuario = array.get(0);
			Query query1 = pm.newQuery(Resource.class);
			query1.setFilter("url == idParam");
			query1.declareParameters("String idParam");

			List<Resource> arrayRecurso = (List<Resource>)query1.execute(url);


			if(arrayRecurso.size() > 0 ){

				Resource recurso = arrayRecurso.get(0);

				Long idRol = usuario.getIdRol();
				Long idRecurso = recurso.getId();

				Query query2 = pm.newQuery(Access.class);
				query2.setFilter("idRole == idParam && idRecurso == idParam2");
				query2.declareParameters("Long idParam , Long idParam2");
				System.out.println("das");

				List<Access> arrayAcceso = (List<Access>)query2.execute(idRol,idRecurso);

				if(arrayAcceso.size()>0){
					pm.close();
					return true;
				}
			}

		}
		pm.close();
		return false;
	}
}

