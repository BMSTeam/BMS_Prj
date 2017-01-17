package bms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.math.BigDecimal;


/**
 * The persistent class for the BetTran database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="BetTran.findAll", 
		query="SELECT b FROM BetTran b"),
	@NamedQuery(name="BetTran.findByUser", 
		query="SELECT b FROM BetTran b WHERE b.userName = :user")
})
public class BetTran implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="TranId")
	private long tranId;

	@Column(name="Amount")
	private BigDecimal amount;

	@Column(name="AppoveBy")
	private String appoveBy;

	@Column(name="AppoveStatus")
	private short appoveStatus;

	@Column(name="Balance")
	private BigDecimal balance;

	@Column(name="ChannelCode")
	private String channelCode;

	@Column(name="CompBankAcc")
	private String compBankAcc;

	@Column(name="CompBankCode")
	private String compBankCode;

	@Column(name="CreateBy")
	private String createBy;

	@Column(name="CreateDate")
	private Timestamp createDate;

	@Column(name="Credit")
	private BigDecimal credit;

	@Column(name="CusBankAcc")
	private String cusBankAcc;

	@Column(name="CusBankCode")
	private String cusBankCode;

	@Column(name="FreeFee")
	private BigDecimal freeFee;

	@Column(name="Remark")
	private String remark;

	@Column(name="TranDate")
	private String tranDate;

	@Column(name="TranTime")
	private String tranTime;

	@Column(name="TranType")
	private String tranType;

	@Column(name="UpdateBy")
	private String updateBy;

	@Column(name="UpdateDate")
	private Timestamp updateDate;

	@Column(name="UserName")
	private String userName;

	@Column(name="Version")
	private long version;

	@Column(name="WebCode")
	private String webCode;

	public BetTran() {
	}

	public long getTranId() {
		return this.tranId;
	}

	public void setTranId(long tranId) {
		this.tranId = tranId;
	}

	public BigDecimal getAmount() {
		return this.amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getAppoveBy() {
		return this.appoveBy;
	}

	public void setAppoveBy(String appoveBy) {
		this.appoveBy = appoveBy;
	}

	public short getAppoveStatus() {
		return this.appoveStatus;
	}

	public void setAppoveStatus(short appoveStatus) {
		this.appoveStatus = appoveStatus;
	}

	public BigDecimal getBalance() {
		return this.balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public String getChannelCode() {
		return this.channelCode;
	}

	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}

	public String getCompBankAcc() {
		return this.compBankAcc;
	}

	public void setCompBankAcc(String compBankAcc) {
		this.compBankAcc = compBankAcc;
	}

	public String getCompBankCode() {
		return this.compBankCode;
	}

	public void setCompBankCode(String compBankCode) {
		this.compBankCode = compBankCode;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public BigDecimal getCredit() {
		return this.credit;
	}

	public void setCredit(BigDecimal credit) {
		this.credit = credit;
	}

	public String getCusBankAcc() {
		return this.cusBankAcc;
	}

	public void setCusBankAcc(String cusBankAcc) {
		this.cusBankAcc = cusBankAcc;
	}

	public String getCusBankCode() {
		return this.cusBankCode;
	}

	public void setCusBankCode(String cusBankCode) {
		this.cusBankCode = cusBankCode;
	}

	public BigDecimal getFreeFee() {
		return this.freeFee;
	}

	public void setFreeFee(BigDecimal freeFee) {
		this.freeFee = freeFee;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTranDate() {
		return this.tranDate;
	}

	public void setTranDate(String tranDate) {
		this.tranDate = tranDate;
	}

	public String getTranTime() {
		return this.tranTime;
	}

	public void setTranTime(String tranTime) {
		this.tranTime = tranTime;
	}

	public String getTranType() {
		return this.tranType;
	}

	public void setTranType(String tranType) {
		this.tranType = tranType;
	}

	public String getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Timestamp getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getVersion() {
		return this.version;
	}

	public void setVersion(long version) {
		this.version = version;
	}

	public String getWebCode() {
		return this.webCode;
	}

	public void setWebCode(String webCode) {
		this.webCode = webCode;
	}

}