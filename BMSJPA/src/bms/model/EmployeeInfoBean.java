package bms.model;

import java.io.Serializable;

public class EmployeeInfoBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int empId;
	private String userName;
	private String empFirtsName;
	private String empLastName;
	private String empNickName;
	private int empTypeId;
	private String empRemark;
	
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmpFirtsName() {
		return empFirtsName;
	}
	public void setEmpFirtsName(String empFirtsName) {
		this.empFirtsName = empFirtsName;
	}
	public String getEmpLastName() {
		return empLastName;
	}
	public void setEmpLastName(String empLastName) {
		this.empLastName = empLastName;
	}
	public String getEmpNickName() {
		return empNickName;
	}
	public void setEmpNickName(String empNickName) {
		this.empNickName = empNickName;
	}
	public int getEmpTypeId() {
		return empTypeId;
	}
	public void setEmpTypeId(int empTypeId) {
		this.empTypeId = empTypeId;
	}
	public String getEmpRemark() {
		return empRemark;
	}
	public void setEmpRemark(String empRemark) {
		this.empRemark = empRemark;
	}

}
