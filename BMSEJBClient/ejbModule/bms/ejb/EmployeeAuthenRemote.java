package bms.ejb;

import javax.ejb.Remote;

@Remote
public interface EmployeeAuthenRemote {
	boolean getEmployeeHash(String username, String password);
}
