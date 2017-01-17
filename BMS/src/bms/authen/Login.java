package bms.authen;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import bms.ejb.EmployeeAuthenRemote;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		Map<String,String> msg = new HashMap<String,String>();
		Gson gson = new Gson();
		
		try {
			
			Context context = new InitialContext();
			EmployeeAuthenRemote remote = (EmployeeAuthenRemote) context.lookup("BMS.EmployeeAuthenEJB");
			
			if(remote.getEmployeeHash(username, password)) {
				msg.put("result", "true");
				msg.put("detail", "Login success.");
				
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setMaxInactiveInterval(180*60);
			} else {
				msg.put("result", "false");
				msg.put("detail", "Login fail.");
			}
			
		} catch (NamingException e) {
			msg.put("result", "false");
			msg.put("detail", e.getMessage());
		}
		
		out.println(gson.toJson(msg));
		out.close();
	}

}
