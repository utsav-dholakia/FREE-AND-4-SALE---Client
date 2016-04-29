package jsp.servlet.mvc.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

import jsp.servlet.mvc.bean.InventoryBean;
import jsp.servlet.mvc.bean.ReviewBean;

/**
 * Servlet implementation class EditControllerServlet
 */
@WebServlet("/EditControllerServlet")
public class EditControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		List<ReviewBean> reviews = new ArrayList<ReviewBean>();
		int size = Integer.parseInt(request.getParameter("size").toString()); 
		for (int i =0; i<size; i++){
			ReviewBean review = new ReviewBean();
			review.setUserId(Integer.parseInt(request.getAttribute("uid").toString()));
			review.setSellerName(request.getParameter("sellername"+i));
			review.setRatings(Integer.parseInt(request.getParameter("rating"+i)));
			review.setSellerName(request.getParameter("comment"+i));
			reviews.add(review);
		}
		try {
			
			Client client = Client.create();
			client.addFilter(new LoggingFilter());
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/ReviewServices/saveReviews");
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .accept(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class,reviews);
			
			
			if (restResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd=request.getRequestDispatcher("index2.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
