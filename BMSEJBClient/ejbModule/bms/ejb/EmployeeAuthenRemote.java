package bms.ejb;

import javax.ejb.Remote;

import bms.ejb.model.EmployeeInputBean;

@Remote
public interface EmployeeAuthenRemote {
	boolean getEmployeeHash(String username, String password);
	public String resetPassword(EmployeeInputBean employee);
}
