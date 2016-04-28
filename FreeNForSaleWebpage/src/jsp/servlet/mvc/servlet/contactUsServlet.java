package jsp.servlet.mvc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.LoggingFilter;

import jsp.servlet.mvc.bean.EmailBean;
import jsp.servlet.mvc.bean.ViewCartBean;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/contactUsServlet")
public class contactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String statusString;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contactUsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	//super.doGet(request, response);
		System.out.println("ContactuS controller servlet call...");
		Boolean status = true;
		try {
			
			Client client = Client.create();
			client.addFilter(new LoggingFilter());

			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/ContatcUsService/SendEmail");
			
			EmailBean bean = new EmailBean();
			if(request.getParameter("name")!=null){
				bean.setName(request.getParameter("name"));
			}
			if(request.getParameter("email")!=null){
				bean.setSendTo(request.getParameter("email"));
			}
			if(request.getParameter("message")!=null){
				bean.setName(request.getParameter("message"));
			}
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .accept(MediaType.APPLICATION_JSON)
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
			RequestDispatcher rd=request.getRequestDispatcher("index2.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	
    }
}
