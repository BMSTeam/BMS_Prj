package bms.entity;

import java.io.Serializable;

import javax.persistence.*;

import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the Bank database table.
 * 
 */
@Entity
@NamedQuery(name="Bank.findAll", query="SELECT b FROM Bank b")
public class Bank implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="BankId")
	private int bankId;

	@Column(name="BankCode")
	private String bankCode;

	@Column(name="BankEngName")
	private String bankEngName;

	@Column(name="BankThName")
	private String bankThName;

	@Column(name="CreateBy")
	private String createBy;

	@Column(name="CreateDate")
	private Timestamp createDate;

	@Column(name="UpdateBy")
	private String updateBy;

	@Column(name="UpdateDate")
	private Timestamp updateDate;

	@Column(name="Version")
	private long version;
	
	@OneToMany(mappedBy = "bank", fetch= FetchType.EAGER)
    private List<JoinCustomerBank> joinCustomerBank;
	
	@OneToMany(mappedBy = "bank", fetch= FetchType.EAGER)
	private List<JoinCompanyBank> joinCompanyBank;

	public Bank() {
	}

	public int getBankId() {
		return this.bankId;
	}

	public void setBankId(int bankId) {
		this.bankId = bankId;
	}

	public String getBankCode() {
		return this.bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getBankEngName() {
		return this.bankEngName;
	}

	public void setBankEngName(String bankEngName) {
		this.bankEngName = bankEngName;
	}

	public String getBankThName() {
		return this.bankThName;
	}

	public void setBankThName(String bankThName) {
		this.bankThName = bankThName;
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

	public List<JoinCustomerBank> getJoinCustomerBank() {
		return joinCustomerBank;
	}

	public void setJoinCustomerBank(List<JoinCustomerBank> joinCustomerBank) {
		this.joinCustomerBank = joinCustomerBank;
	}

	public List<JoinCompanyBank> getJoinCompanyBank() {
		return joinCompanyBank;
	}

	public void setJoinCompanyBank(List<JoinCompanyBank> joinCompanyBank) {
		this.joinCompanyBank = joinCompanyBank;
	}

}