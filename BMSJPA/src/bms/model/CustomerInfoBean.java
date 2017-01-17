package bms.model;

import java.io.Serializable;
import java.util.List;

public class CustomerInfoBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userName;
	private String cusFirstName;
	private String cusLastName;
	private String cusTel;
	private String remark;
	private List<BankInfoBean> banks;
	private WebInfoBean web;
	private List<BetTranInfoBean> betTrans;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCusFirstName() {
		return cusFirstName;
	}
	public void setCusFirstName(String cusFirstName) {
		this.cusFirstName = cusFirstName;
	}
	public String getCusLastName() {
		return cusLastName;
	}
	public void setCusLastName(String cusLastName) {
		this.cusLastName = cusLastName;
	}
	public String getCusTel() {
		return cusTel;
	}
	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public List<BankInfoBean> getBanks() {
		return banks;
	}
	public void setBanks(List<BankInfoBean> banks) {
		this.banks = banks;
	}
	public WebInfoBean getWeb() {
		return web;
	}
	public void setWeb(WebInfoBean web) {
		this.web = web;
	}
	public List<BetTranInfoBean> getBetTrans() {
		return betTrans;
	}
	public void setBetTrans(List<BetTranInfoBean> betTrans) {
		this.betTrans = betTrans;
	}
}