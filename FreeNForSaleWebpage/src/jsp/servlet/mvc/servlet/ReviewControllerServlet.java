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
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import javax.ws.rs.core.MediaType;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.LoggingFilter;

import jsp.servlet.mvc.bean.CartBean;
import jsp.servlet.mvc.bean.ReviewBean;

/**
 * Servlet implementation class ReviewControllerServlet
 */
@WebServlet("/ReviewControllerServlet")
public class ReviewControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CartBean bean; 
    private static ReviewBean reviewGet;
    private static String statusString;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		List<ReviewBean> reviewList= new ArrayList<ReviewBean>();
		try {
			
			HttpSession session = request.getSession(false);
			
			bean.setUserId(Integer.parseInt(session.getAttribute("UID").toString()));
			
			Client client = Client.create();
			client.addFilter(new LoggingFilter());
			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/ReviewServices/getReviews");
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .type(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class, bean);
			Map<Integer, ReviewBean> reviewMap= restResponse.getEntity(new GenericType<Map<Integer, ReviewBean> >(){});
			for (Map.Entry<Integer, ReviewBean> entry : reviewMap.entrySet())
			{
//			    System.out.println(entry.getKey() + "/" + entry.getValue());
			    reviewList.add(entry.getValue());
			}
			request.setAttribute("reviews",reviewList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd=request.getRequestDispatcher("review.jsp");
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
