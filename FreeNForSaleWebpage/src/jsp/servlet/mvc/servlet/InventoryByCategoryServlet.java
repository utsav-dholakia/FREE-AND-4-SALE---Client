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
import jsp.servlet.mvc.bean.LoginBean;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/InventoryByCategoryServlet")
public class InventoryByCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static InventoryBean bean; 
    private static String statusString;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InventoryByCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("InventoryByCategoryServlet Post call...");
		Boolean status = true;
		
		String categoryId = request.getParameter("categoryId");
		System.out.println("input param : " + categoryId);
		bean=new InventoryBean();
		bean.setCategoryId(Integer.parseInt(categoryId));
		request.setAttribute("bean",bean);

		try {
			
			Client client = Client.create();
			client.addFilter(new LoggingFilter());
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/InventoryServices/InventoryByCategoryId");
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .accept(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class,bean);
			
			
			if(restResponse.getStatus() == 400)
			{
				statusString = restResponse.getEntity(String.class);
				status=false;
				if(statusString.equals("-1"))
				{
					System.out.println(statusString);
				}
			}
 
			ArrayList<InventoryBean> iBeans= restResponse.getEntity(new GenericType<ArrayList<InventoryBean>>(){});
			System.out.println("iBeans size:" + iBeans.size());
			for(int i = 0 ; i < iBeans.size(); i++)
				System.out.println(iBeans.get(i).getInventoryName());
			
		} catch (Exception e) {
			status= false;
			e.printStackTrace();
		}
		
		if(status){
			RequestDispatcher rd=request.getRequestDispatcher("products.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	
    }
}
