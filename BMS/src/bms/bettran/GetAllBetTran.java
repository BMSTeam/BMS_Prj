package bms.bettran;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bms.ejb.BetTranRemote;

/**
 * Servlet implementation class GetAllBetTran
 */
@WebServlet("/Customer/GetAllBetTran")
public class GetAllBetTran extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllBetTran() {
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
			
			Context context = new InitialContext();
			BetTranRemote remote = (BetTranRemote) context.lookup("BMS.BetTranEJB");
			
			out.println(remote.getAllBetTran());
			
		} catch (Exception e) {
			out.println(e.getMessage());
		}
		
		out.close();
	}

}
