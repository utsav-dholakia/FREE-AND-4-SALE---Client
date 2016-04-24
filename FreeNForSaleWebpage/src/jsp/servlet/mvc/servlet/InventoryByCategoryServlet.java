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

import jsp.servlet.mvc.bean.InventoryBean;
import jsp.servlet.mvc.bean.LoginBean;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/InventoryByCategoryServlet")
public class InventoryByCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InventoryByCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	//super.doGet(request, response);
		System.out.println("Calling Inventory by category Id Service");
		Boolean status = true;
		
		String categoryName = request.getParameter("name");
		//String password=request.getParameter("password");
		System.out.println("input param : " + categoryName);
		InventoryBean bean=new InventoryBean();
		bean.setCategoryName(categoryName);
		bean.setCategoryId(1);
		//bean.setPassword(password);
		request.setAttribute("bean",bean);

		try {
			
			Client client = Client.create();
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/InventoryServices/InventoryByCategoryId");
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .accept(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class,bean);
			
			
			if (restResponse.getStatus() != 200) {
				status=false;
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
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
			System.out.println("status = true");
			RequestDispatcher rd=request.getRequestDispatcher("products.jsp");
			rd.forward(request, response);
			return;
		}
		else
		{
			System.out.println("status = false");
			RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
			return;
		}
	
    }
}
