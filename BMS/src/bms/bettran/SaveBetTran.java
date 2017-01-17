package bms.bettran;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bms.ejb.BetTranRemote;
import bms.ejb.model.BetTranInputBean;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class SaveBetTran
 */
@WebServlet("/BetTran/SaveBetTran")
public class SaveBetTran extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveBetTran() {
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
		
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		try {
			
			BufferedReader reader = request.getReader();
			while((line = reader.readLine()) != null)
				jb.append(line);
			
			JsonParser parser = new JsonParser();
			JsonObject o = parser.parse(jb.toString()).getAsJsonObject();
			
			BetTranInputBean btib = new BetTranInputBean();
			
			btib.setTranType(o.get("tranType").getAsString());
			btib.setTranDate(o.get("tranDate").getAsString());
			btib.setTranTime(o.get("tranTime").getAsString());
			btib.setUserName(o.get("tranUserName").getAsString());
			btib.setWebCode(o.get("tranWebCode").getAsString());
			btib.setCompBankCode(o.get("tranCompBankCode").getAsString());
			btib.setCompBankAcc(o.get("tranCompBankAcc").getAsString());
			btib.setChannelCode(o.get("tranChannelCode").getAsString());
			btib.setAmount(o.get("tranAmount").getAsBigDecimal());
			btib.setFreeFee(o.get("tranFreeFee").getAsBigDecimal());
			
			HttpSession session = request.getSession();
			btib.setCreateBy((String) session.getAttribute("username"));
			
			Context context = new InitialContext();
			BetTranRemote remote = (BetTranRemote) context.lookup("BMS.BetTranEJB");

			out.println(remote.saveBetTran(btib));
			
		} catch (Exception e) {
			out.println(e.getMessage());
		}
		
		out.close();
	}

}
