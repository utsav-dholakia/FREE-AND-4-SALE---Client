package jsp.servlet.mvc.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

import jsp.servlet.mvc.bean.InventoryBean;
import jsp.servlet.mvc.bean.ItemDetailBean;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/SingleItemControllerServlet")
public class SingleItemControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static InventoryBean inventoryBean;
    private static String statusString;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingleItemControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("Single Item Controller Servlet Post call...");
		Boolean status = true;
		
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		System.out.println("input param : " + itemId);
		//bean=new LoginBean();
		inventoryBean = new InventoryBean();
		inventoryBean.setItemId(itemId);
		//bean.setName(itemName);
		request.setAttribute("bean",inventoryBean);

		try {
			
			Client client = Client.create();
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/InventoryServices/FetchMoreDetails");
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .accept(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class,inventoryBean);
			
			
			if(restResponse.getStatus() == 400)
			{
				statusString = restResponse.getEntity(String.class);
				status=false;
				if(statusString.equals("-1"))
				{
					System.out.println(statusString);
				}
			}
 
			ItemDetailBean iBeans = restResponse.getEntity(ItemDetailBean.class);
			request.setAttribute("iBeans", iBeans);
			System.out.println(iBeans.getInventoryName());
			
		} catch (Exception e) {
			status= false;
			e.printStackTrace();
		}
		
		if(status){
			System.out.println("forwarding to single.jsp");
			RequestDispatcher rd=request.getRequestDispatcher("single.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	
    }
}
