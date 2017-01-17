package bms.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import bms.entity.EmployeeAuthen;
import bms.utils.BCrypt;

@Stateless(mappedName="BMS.EmployeeAuthenEJB")
public class EmployeeAuthenEJB implements EmployeeAuthenRemote {
	
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

}
