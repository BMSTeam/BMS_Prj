package bms.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import bms.entity.EmployeeAuthenEntity;
import bms.utils.BCrypt;

@Stateless(mappedName = "EmployeeAuthen-EJB")
public class EmployeeAuthen implements EmployeeAuthenRemote {
	
	@PersistenceContext(unitName = "BMSJPA")
    private EntityManager em;

	@Override
	public boolean getEmployeeHash(String username, String password) {
		
		boolean result = false;
		
		EmployeeAuthenEntity entity = em.find(EmployeeAuthenEntity.class, username);
		
		if(entity != null) {
			String hashed = entity.getPassword();
			
			if (BCrypt.checkpw(password, hashed)) {
				result = true;
			}
		}
		
		return result;
	}

}
