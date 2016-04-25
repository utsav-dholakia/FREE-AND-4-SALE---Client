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

import jsp.servlet.mvc.bean.LoginBean;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/SessionControllerServlet")
public class SessionControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static LoginBean bean;  
    private static String statusString;
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
		System.out.println("SessionControllerServlet Post call...");
		response.setContentType("text/html");
		
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		
		bean=new LoginBean();
		bean.setName(name);
		bean.setPassword(password);
		request.setAttribute("loginbean",bean);

		Boolean status = true;
		try {
			
			Client client = Client.create();
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/loginservices/checkuservalidity");
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .type(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class, bean);
			
			if(restResponse.getStatus() == 400)
			{
				statusString = restResponse.getEntity(String.class);
				status=false;
				if(statusString.equals("-1"))
				{
					System.out.println(statusString);
				}
			}
			
			
			
		} catch (Exception e) {
			status= false;
			e.printStackTrace();
		}
	
		if(status){
			HttpSession session = request.getSession();
			session.setAttribute("UID", statusString);
			session.setAttribute("USER", name);
			System.out.println("redirecting to inventorycontroller");
			RequestDispatcher rd=request.getRequestDispatcher("InventoryControllerServlet");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("USER", "-1");
			RequestDispatcher rd=request.getRequestDispatcher("login-error.jsp");
			rd.forward(request, response);
		}
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		bean=new LoginBean();
		HttpSession session = request.getSession();
		session.invalidate();
		RequestDispatcher rd=request.getRequestDispatcher("InventoryControllerServlet");
		rd.forward(request, response);
	}

}
