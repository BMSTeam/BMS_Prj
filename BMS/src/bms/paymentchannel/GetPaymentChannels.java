package bms.paymentchannel;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bms.ejb.PaymentChannelRemote;

/**
 * Servlet implementation class GetPaymentChannels
 */
@WebServlet("/PaymentChannel/GetPaymentChannels")
public class GetPaymentChannels extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPaymentChannels() {
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
			PaymentChannelRemote remote = (PaymentChannelRemote) context.lookup("BMS.PaymentChannelEJB");
			
			out.println(remote.getAllPaymentChannel());
			
		} catch (Exception e) {
			out.println(e.getMessage());
		}
		
		out.close();
	}

}
