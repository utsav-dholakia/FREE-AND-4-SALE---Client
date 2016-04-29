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

import jsp.servlet.mvc.bean.CartBean;
import jsp.servlet.mvc.bean.ViewCartBean;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/AddToCartControllerServlet")
public class AddToCartControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String statusString;
	private static CartBean cartBean;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	//super.doGet(request, response);
		System.out.println("Add To Cart controller servlet POST call...");
		Boolean status = true;
		try {
			
			Client client = Client.create();
			client.addFilter(new LoggingFilter());
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/CartService/addToCart");
			
			cartBean = new CartBean();
			cartBean.setUserId((Integer)request.getSession().getAttribute("UID"));
			cartBean.setAmount(request.getParameter("price"));
			cartBean.setInventoryId(Integer.parseInt(request.getParameter("itemId")));
			cartBean.setQuantity(1);
			
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .accept(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class, cartBean);
			
			
			if(restResponse.getStatus() == 400)
			{
				statusString = restResponse.getEntity(String.class);
				status=false;
//				if(statusString.equals("-1"))
//				{
//					System.out.println(statusString);
//				}
			}
			
			//List<ViewCartBean> cartList= restResponse.getEntity(new GenericType<List<ViewCartBean>>(){});
			//System.out.println(cartList.get(0).getItemName());
			//request.setAttribute("cartList",cartList);

		} catch (Exception e) {
			status= false;
			e.printStackTrace();
		}
		
		if(status){
			System.out.println(statusString);
			RequestDispatcher rd=request.getRequestDispatcher("checkout.jsp");
			rd.forward(request, response);
		}
		else
		{
			System.out.println(statusString);
			RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	
    }
}
