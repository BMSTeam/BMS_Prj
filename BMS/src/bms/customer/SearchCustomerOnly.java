package bms.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bms.ejb.CustomerRemote;
import bms.ejb.model.CustomerInputBean;

/**
 * Servlet implementation class SearchCustomerOnly
 */
@WebServlet("/Customer/SearchCustomerOnly")
public class SearchCustomerOnly extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCustomerOnly() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("Content-Type", "text/xml; charset=UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		try {
			
			String user = request.getParameter("userName");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String telelphone = request.getParameter("telephone");
			String webCode = request.getParameter("webCode");
			
			CustomerInputBean input = new CustomerInputBean();
			input.setUserName(user);
			input.setFirstName(firstName);
			input.setLastName(lastName);
			input.setTelephone(telelphone);
			input.setWebCode(webCode);
			
			Context context = new InitialContext();
			CustomerRemote remote = (CustomerRemote) context.lookup("BMS.CustomerEJB");
			
			out.println(remote.searchCustomerOnly(input));
			
		} catch (Exception e) {
			out.println(e.getMessage());
		}
		
		out.close();
	}

}
