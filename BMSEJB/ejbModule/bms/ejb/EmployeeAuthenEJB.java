package bms.ejb;

import java.sql.Timestamp;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import bms.ejb.model.EmployeeInputBean;
import bms.entity.Employee;
import bms.entity.EmployeeAuthen;
import bms.utils.BCrypt;

@Stateless(mappedName="BMS.EmployeeAuthenEJB")
public class EmployeeAuthenEJB implements EmployeeAuthenRemote {
	
	Logger logger = LogManager.getLogger(EmployeeAuthenEJB.class);
	
	@PersistenceContext(unitName = "BMSJPA")
    private EntityManager em;

	@Override
	public boolean getEmployeeHash(String username, String password) {
		
		boolean result = false;
		
		EmployeeAuthen entity = em.find(EmployeeAuthen.class, username);
		
		if(entity != null) {
			String hashed = entity.getPassword();
			
			if (BCrypt.checkpw(password, hashed)) {
				result = true;
			}
		}
		
		return result;
	}

	@Override
	public String resetPassword(EmployeeInputBean employee) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			Employee emp = em.find(Employee.class, Integer.parseInt(employee.getEmpId()));
			EmployeeAuthen empAuth = emp.getEmployeeAuth();
			
			empAuth.setPassword(BCrypt.hashpw(employee.getPassword(), BCrypt.gensalt()));
			empAuth.setUpdateDate(new Timestamp(System.currentTimeMillis()));
			empAuth.setUpdateBy(employee.getCreateBy());
			
			em.persist(empAuth);
			em.flush();
			
			jsonObj.addProperty("response", "success");
			jsonObj.addProperty("message", "Reset password complete.");
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}

}
