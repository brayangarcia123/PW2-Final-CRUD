package gmail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class GmailServlet extends HttpServlet {
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
 throws IOException {
	 resp.setContentType("text/html");
 
	 PrintWriter out = resp.getWriter();
 
	 UserService us = UserServiceFactory.getUserService();
	 User user = us.getCurrentUser();
 	
	 if(user == null){
		 resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
 	}else{
		 out.println("<!DOCTYPE html>"	 
		 + "<html>"
		 + "<head><title>Cuenta Google</title>"
		 + "<meta charset=utf-8;>"
		 + "<link rel='stylesheet' href=\"/CSS/bootstrap.min.css\">"
         + "<link rel='stylesheet' href=\"/CSS/cargando.css\">"
		 + ""
		 + "</head>"
		 + "<body>"
		 + "<h1>Cuenta Google</h1>"
		 + "<style>"
         + "h1{"
         +"text-align: center;"
         +"}"
         +"</style>"
         
         + "<div class=\"collapse navbar-collapse\" id=\"navegacion\">"
         + "<ul class=\"nav navbar-nav\">"
		 + "<li><br><a href='../'>REGRESAR A OPCIONES</a></li>"
		 + "<li><br><a href='"+ us.createLogoutURL(req.getRequestURI())+"'> CERRAR SESION </a></li>"
		 + "</ul>"
		 + "</div>"
		 
		 + "<div class=\"container\">" 
		 +"<br/><b>User :</b>"
		 +"<br/>getNickname retornó : "+user.getNickname()
		 +"<br/>getAuthDomain retornó : "+user.getAuthDomain()
		 +"<br/>getEmail retornó : "+user.getEmail()
		 +"<br/>getUserId retornó : "+user.getUserId()
		 +"<br/>getFederatedIdentity retornó : "+user.getFederatedIdentity()
		 +"<br/>"
		 +"<br/><b>UserService :</b>"
		 +"<br/>isUserAdmin retornó : "+us.isUserAdmin() 
		 +"<br/>isUserLoggedIn retornó : "+us.isUserLoggedIn()
		 +"<br/>getCurrentUser retornó : "+us.getCurrentUser()
		 +"<br/>"
		 +"</div>"
		 
		 + "</body></html>");
 	}
	 
	 
 }
}