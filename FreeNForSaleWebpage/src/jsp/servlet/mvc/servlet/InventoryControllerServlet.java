package jsp.servlet.mvc.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

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
import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.LoggingFilter;

import jsp.servlet.mvc.bean.InventoryBean;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/InventoryControllerServlet")
public class InventoryControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InventoryControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	//super.doGet(request, response);
		System.out.println("InventoryControllerServlet Get call...");
		Boolean status = true;
		try {
			
			Client client = Client.create();
			client.addFilter(new LoggingFilter());
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/InventoryServices/InventoryForHomePage");
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .accept(MediaType.APPLICATION_JSON)
			    .get(ClientResponse.class);
			
			
			if (restResponse.getStatus() != 200) {
				status=false;
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
 
			Map<Integer,ArrayList<InventoryBean>> iBeans= restResponse.getEntity(new GenericType<Map<Integer,ArrayList<InventoryBean>>>(){});
			request.setAttribute("iBeans", iBeans);
			System.out.println(iBeans.get(1).get(0).getCategoryName());
			
		} catch (Exception e) {
			status= false;
			e.printStackTrace();
		}
		
		if(status){
			Map<Integer,ArrayList<InventoryBean>> iBeans=(Map<Integer,ArrayList<InventoryBean>>)request.getAttribute("iBeans");
			ArrayList<InventoryBean> featuredList=iBeans.get(1);
			System.out.println(featuredList.size());
			RequestDispatcher rd=request.getRequestDispatcher("index2.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	//super.doGet(request, response);
		System.out.println("InventoryControllerServlet Post call...");
		Boolean status = true;
		try {
			
			Client client = Client.create();
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/InventoryServices/InventoryForHomePage");
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .accept(MediaType.APPLICATION_JSON)
			    .get(ClientResponse.class);
			
			
			if (restResponse.getStatus() != 200) {
				status=false;
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
 
			Map<Integer,ArrayList<InventoryBean>> iBeans= restResponse.getEntity(new GenericType<Map<Integer,ArrayList<InventoryBean>>>(){});
			request.setAttribute("iBeans",iBeans);
			System.out.println(iBeans.get(1).get(0).getCategoryName());
			
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
