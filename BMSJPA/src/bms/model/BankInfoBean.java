package bms.model;

import java.io.Serializable;

public class BankInfoBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String bankNo;
	private String bankAccountNo;
	private int bankId;
	private String bankCode;
	private String bankEngName;
	private String bankThName;
	
	public String getBankNo() {
		return bankNo;
	}
	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}
	public String getBankAccountNo() {
		return bankAccountNo;
	}
	public void setBankAccountNo(String bankAccountNo) {
		this.bankAccountNo = bankAccountNo;
	}
	public int getBankId() {
		return bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getBankEngName() {
		return bankEngName;
	}
	public void setBankEngName(String bankEngName) {
		this.bankEngName = bankEngName;
	}
	public String getBankThName() {
		return bankThName;
	}
	public void setBankThName(String bankThName) {
		this.bankThName = bankThName;
	}
}
