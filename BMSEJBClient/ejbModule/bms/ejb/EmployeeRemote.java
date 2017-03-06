package bms.ejb;

import javax.ejb.Remote;

import bms.ejb.model.EmployeeInputBean;

@Remote
public interface EmployeeRemote {
	public String getEmployeeType();
	public String searchEmployee(EmployeeInputBean employee);
	public String addEmployee(EmployeeInputBean employee);
	public String editEmployee(EmployeeInputBean employee);
	public String deleteEmployee(int employee);
}
