package jsp.servlet.mvc.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

import jsp.servlet.mvc.bean.CartBean;
import jsp.servlet.mvc.bean.EmailBean;
import jsp.servlet.mvc.bean.UpdateCartBean;
import jsp.servlet.mvc.bean.ViewCartBean;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/purchaseCartServlet")
public class purchaseCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String statusString;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public purchaseCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	//super.doGet(request, response);
		System.out.println("Purchase Cart controller servlet call...");
		Boolean status = true;
		try {
			
			Client client = Client.create();
			client.addFilter(new LoggingFilter());

			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/CartService/purchaseCart");
			
			UpdateCartBean bean = new UpdateCartBean();
			HttpSession session=request.getSession();
			bean.setRemoveItems((List<Integer>)session.getAttribute("removeList"));
			System.out.println("Remove Items: " + bean.getRemoveItems().size());
			int size= Integer.valueOf(request.getParameter("size"));
			System.out.println("Size of ArrayList " + size);
			List<CartBean> clist=new ArrayList<CartBean>();
			for(int i=0;i<size;i++){
				CartBean cb=new CartBean();
				cb.setAmount(request.getParameter("totalAmount"+i));
				System.out.println("AMount" + cb.getAmount());
				cb.setQuantity(Integer.parseInt(request.getParameter("quantity"+i)));
				cb.setUserId(Integer.parseInt(request.getParameter("UId")));
				cb.setInventoryId(Integer.parseInt(request.getParameter("itemId"+i)));
				cb.setSellerId(Integer.parseInt(request.getParameter("sellerId"+i)));
				clist.add(cb);
			}
			
			bean.setPaymentType("Cash");
			bean.setUpdateItems(clist);
			bean.setUserId(Integer.parseInt(request.getParameter("UId")));
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
