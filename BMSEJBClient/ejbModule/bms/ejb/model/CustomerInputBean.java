package bms.ejb.model;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class CustomerInputBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userName;
	private String firstName;
	private String lastName;
	private String telephone;
	private String webCode;
	private String remark;
	private List<Map<String,String>> banks;
	private String createBy;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getWebCode() {
		return webCode;
	}
	public void setWebCode(String webCode) {
		this.webCode = webCode;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public List<Map<String, String>> getBanks() {
		return banks;
	}
	public void setBanks(List<Map<String, String>> banks) {
		this.banks = banks;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
}