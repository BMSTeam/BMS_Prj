package bms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the JoinCompanyBank database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="JoinCompanyBank.findAll",
			query="SELECT j FROM JoinCompanyBank j"),
	@NamedQuery(name="JoinCompanyBank.getAllCompanyBankOnlyActive",
			query="SELECT j FROM JoinCompanyBank j WHERE j.status=1")
})
public class JoinCompanyBank implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private JoinCompanyBankPK id;

	@Column(name="AccountName")
	private String accountName;

	@Column(name="CreateBy")
	private String createBy;

	@Column(name="CreateDate")
	private Timestamp createDate;

	@Column(name="Remark")
	private String remark;

	@Column(name="Status")
	private short status;

	@Column(name="UpdateBy")
	private String updateBy;

	@Column(name="UpdateDate")
	private Timestamp updateDate;

	@Column(name="Version")
	private long version;
	
	@ManyToOne
	@MapsId("bankId")
    @JoinColumn(name = "BankId")
	private Bank bank;

	public JoinCompanyBank() {
	}

	public JoinCompanyBankPK getId() {
		return this.id;
	}

	public void setId(JoinCompanyBankPK id) {
		this.id = id;
	}

	public String getAccountName() {
		return this.accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
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

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public short getStatus() {
		return this.status;
	}

	public void setStatus(short status) {
		this.status = status;
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

	public long getVersion() {
		return this.version;
	}

	public void setVersion(long version) {
		this.version = version;
	}

	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}

}