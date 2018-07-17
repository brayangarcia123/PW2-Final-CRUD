package controller.userss;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import model.userss.Userss;
import model.role.*;
import model.resource.*;
import model.access.*;

@SuppressWarnings("serial")
public class Index extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();

		if(user == null){
			resp.sendRedirect(us.createLoginURL(req.getRequestURI()));}
		else if(us.isUserAdmin() || accesoRecurso(user.getEmail(),req.getRequestURI())){

			PersistenceManager pm = PMF.get().getPersistenceManager();
			Query query = pm.newQuery(Userss.class);

			//query.setOrdering("nombre descending");
			List<Userss> array = (List<Userss>)query.execute("select from Userss");
			List<Role> arrayRol = new ArrayList<Role>();

			for(Userss usuario:array){
				Role rol = pm.getObjectById(Role.class,usuario.getIdRol());
				arrayRol.add(rol);
			}

			req.setAttribute("array", array);
			req.setAttribute("arrayRol", arrayRol);
			try {
				req.getRequestDispatcher("/WEB-INF/Views/User/Index.jsp").forward(req, resp);
				query.closeAll();

			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
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
