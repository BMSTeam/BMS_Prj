package bms.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class BetTranInfoBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int NumRow;
	private long tranId;
	private String tranDate;
	private String tranTime;
	private String userName;
	private String webCode;
	private String compBankCode;
	private String compBankAcc;
	private String cusBankCode;
	private String cusBankAcc;
	private String tranType;
	private String channelCode;
	private BigDecimal amount;
	private BigDecimal credit;
	private BigDecimal balance;
	private BigDecimal freeFee;
	private String remark;
	private int approveStatus;
	private String approveBy;
	private String createBy;
	private String createDate;
	private String updateBy;
	private String updateDate;
	
	public int getNumRow() {
		return NumRow;
	}
	public void setNumRow(int numRow) {
		NumRow = numRow;
	}
	public long getTranId() {
		return tranId;
	}
	public void setTranId(long tranId) {
		this.tranId = tranId;
	}
	public String getTranDate() {
		return tranDate;
	}
	public void setTranDate(String tranDate) {
		this.tranDate = tranDate;
	}
	public String getTranTime() {
		return tranTime;
	}
	public void setTranTime(String tranTime) {
		this.tranTime = tranTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getWebCode() {
		return webCode;
	}
	public void setWebCode(String webCode) {
		this.webCode = webCode;
	}
	public String getCompBankCode() {
		return compBankCode;
	}
	public void setCompBankCode(String compBankCode) {
		this.compBankCode = compBankCode;
	}
	public String getCompBankAcc() {
		return compBankAcc;
	}
	public void setCompBankAcc(String compBankAcc) {
		this.compBankAcc = compBankAcc;
	}
	public String getCusBankCode() {
		return cusBankCode;
	}
	public void setCusBankCode(String cusBankCode) {
		this.cusBankCode = cusBankCode;
	}
	public String getCusBankAcc() {
		return cusBankAcc;
	}
	public void setCusBankAcc(String cusBankAcc) {
		this.cusBankAcc = cusBankAcc;
	}
	public String getTranType() {
		return tranType;
	}
	public void setTranType(String tranType) {
		this.tranType = tranType;
	}
	public String getChannelCode() {
		return channelCode;
	}
	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public BigDecimal getCredit() {
		return credit;
	}
	public void setCredit(BigDecimal credit) {
		this.credit = credit;
	}
	public BigDecimal getBalance() {
		return balance;
	}
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
	public BigDecimal getFreeFee() {
		return freeFee;
	}
	public void setFreeFee(BigDecimal freeFee) {
		this.freeFee = freeFee;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getApproveStatus() {
		return approveStatus;
	}
	public void setApproveStatus(int approveStatus) {
		this.approveStatus = approveStatus;
	}
	public String getApproveBy() {
		return approveBy;
	}
	public void setApproveBy(String approveBy) {
		this.approveBy = approveBy;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
}
