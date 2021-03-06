package jsp.servlet.mvc.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.sun.jersey.api.client.filter.LoggingFilter;

import jsp.servlet.mvc.bean.RegisterBean;
import jsp.servlet.mvc.bean.LoginBean;

/**
 * Servlet implementation class SessionControllerServlet
 */
@WebServlet("/ProfileControllerServlet")
public class ProfileControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static RegisterBean bean; 
    private static LoginBean loginBean;
    private static RegisterBean updatedBean;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ProfileControllerServlet Post call...");
		response.setContentType("text/html");
		
		bean=new RegisterBean();
		
		
		String password=request.getParameter("password");
		bean.setPassword(password);
		String name=request.getParameter("name");
		bean.setName(name);
		if(request.getParameter("year") != null && !request.getParameter("year").equals("") &&
				request.getParameter("month") != null &&  !request.getParameter("month").equals("") &&
				request.getParameter("day") != null && !request.getParameter("day").equals("")) 
		{
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String day=request.getParameter("day");
			try {
				String bdate = year+ " "+ month + " " + day;
				SimpleDateFormat df = new SimpleDateFormat("yyyy dd MM");
				Date date = df.parse(bdate);
				long epoch = date.getTime();
				bean.setBdate(epoch);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		String email=request.getParameter("email");
		bean.setEmail(email);
	    String phone=request.getParameter("phone");
	    bean.setPhone(phone); 
	    if(request.getParameter("street") != null && 
	    	request.getParameter("city") != null)
		{
			String street=request.getParameter("street");
			String city=request.getParameter("city");
			bean.setStreet(street);
		    bean.setCity(city);
		}
		Integer state=Integer.parseInt(request.getParameter("state"));
		bean.setState(state);
	    if(request.getParameter("zipcode") != null && !request.getParameter("zipcode").equals(""))
		{
			Integer zipcode=Integer.parseInt(request.getParameter("zipcode"));
			bean.setZipcode(zipcode);
		}
		if(request.getParameter("sex") != null && !request.getParameter("sex").equals(""))
		{
			String sex=request.getParameter("sex");
			bean.setSex(sex);
		}
		if(request.getParameter("ssn") != null && !request.getParameter("ssn").equals(""))
		{
			Long ssn=888252535L;
			bean.setSsn(ssn);
		}
		
		bean.setUid(Integer.parseInt(request.getParameter("uid")));
		request.setAttribute("bean",bean);

		Boolean status = true;
		try {
			
			Client client = Client.create();
			client.addFilter(new LoggingFilter());

			WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/profileservices/updateprofile");
			
			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
			    .type(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class, bean);
			
			updatedBean = restResponse.getEntity(RegisterBean.class);

			if(restResponse.getStatus()!=200)
			{
				status=false;
				if(updatedBean.equals("-1"))
				{
					System.out.println(updatedBean);
				}
			}
 
		} catch (Exception e) {
			status= false;
			e.printStackTrace();
		}
		
		if(status)
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("login-error.jsp");
			rd.forward(request, response);
		}
	}

}
