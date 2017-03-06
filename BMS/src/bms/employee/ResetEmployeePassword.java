package bms.employee;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bms.ejb.EmployeeAuthenRemote;
import bms.ejb.model.EmployeeInputBean;

import com.google.gson.Gson;

/**
 * Servlet implementation class ResetEmployeePassword
 */
@WebServlet("/Employee/ResetPassword/*")
public class ResetEmployeePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetEmployeePassword() {
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
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        if(request.getPathInfo().equals("/Form")) {
        	request.setAttribute("resetEmployee", request.getParameter("resetEmployee"));
    		RequestDispatcher rd = request.getRequestDispatcher("/resetemployee.jsp");
    		rd.forward(request, response);
        } else if(request.getPathInfo().equals("/Reset")) {
        	
        	PrintWriter out = response.getWriter();
			
			StringBuffer jb = new StringBuffer();
			String line = null;
			
			try {
				
				BufferedReader reader = request.getReader();
				while((line = reader.readLine()) != null)
					jb.append(line);
				
				Gson gson = new Gson();
				EmployeeInputBean employee = gson.fromJson(jb.toString(), EmployeeInputBean.class);
				
				HttpSession session = request.getSession();
				employee.setCreateBy((String) session.getAttribute("username"));
				
				Context context = new InitialContext();
				EmployeeAuthenRemote remote = (EmployeeAuthenRemote) context.lookup("BMS.EmployeeAuthenEJB");

				out.println(remote.resetPassword(employee));
				
			} catch (Exception e) {
				out.println(e.getMessage());
			}
			
			out.close();
        }
	}

}
