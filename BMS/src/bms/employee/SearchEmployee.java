package bms.employee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bms.ejb.EmployeeRemote;
import bms.ejb.model.EmployeeInputBean;

/**
 * Servlet implementation class SearchEmployee
 */
@WebServlet("/Employee/SearchEmployee")
public class SearchEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchEmployee() {
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
			String nickName = request.getParameter("nickName");
			String employeeType = request.getParameter("employeeType");
			String remark = request.getParameter("remark");
			
			EmployeeInputBean input = new EmployeeInputBean();
			input.setUserName(user);
			input.setFirstName(firstName);
			input.setLastName(lastName);
			input.setNickName(nickName);
			input.setEmployeeType(employeeType);
			input.setRemark(remark);
			
			Context context = new InitialContext();
			EmployeeRemote remote = (EmployeeRemote) context.lookup("BMS.EmployeeEJB");
			
			out.println(remote.searchEmployee(input));
			
		} catch (Exception e) {
			out.println(e.getMessage());
		}
		
		out.close();
	}

}
