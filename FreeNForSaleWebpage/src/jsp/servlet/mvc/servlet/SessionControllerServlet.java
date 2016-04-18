package jsp.servlet.mvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/SessionControllerServlet")
public class SessionControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		
		LoginBean bean=new LoginBean();
		bean.setName(name);
		bean.setPassword(password);
		request.setAttribute("bean",bean);

		Boolean status = false;
		try {
			
			Client client = Client.create();
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/loginservices/checkuservalidity");
			/*MultivaluedMap formData = new MultivaluedMapImpl();
			formData.add("username", name);
			formData.add("password", password);*/
			//webResource.header("secretKey", "1234567890");
			ClientResponse restResponse = webResource
			    .type(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class, bean);
			
			
			if (restResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
 
			
			String statusString = restResponse.getEntity(String.class);
			System.out.println(statusString);
			status = Boolean.parseBoolean(statusString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(status){
			HttpSession session = request.getSession();
			session.setAttribute("USER", name);
			RequestDispatcher rd=request.getRequestDispatcher("welcome-page.jsp");
			rd.forward(request, response);
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("login-error.jsp");
			rd.forward(request, response);
		}
	}

}
