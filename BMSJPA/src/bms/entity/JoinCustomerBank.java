package bms.entity;

import java.io.Serializable;

import javax.persistence.*;

import java.sql.Timestamp;


/**
 * The persistent class for the JoinCustomerBank database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="JoinCustomerBank.findAll",
		query="SELECT j FROM JoinCustomerBank j"),
	@NamedQuery(name="JoinCustomerBank.getCustomerBankByUsername",
		query="SELECT j FROM JoinCustomerBank j WHERE j.status=1 AND j.id.userName=:userName")
})
public class JoinCustomerBank implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private JoinCustomerBankPK id;

	@Column(name="BankAccountNo")
	private String bankAccountNo;

	@Column(name="BankNo")
	private String bankNo;

	@Column(name="CreateBy")
	private String createBy;

	@Column(name="CreateDate")
	private Timestamp createDate;

	@Column(name="Status")
	private short status;

	@Column(name="UpdateBy")
	private String updateBy;

	@Column(name="UpdateDate")
	private Timestamp updateDate;

	@Column(name="Version")
	private long version;
	
	@ManyToOne
	@MapsId("userName")
    @JoinColumn(name = "UserName")
	private Customer customer;
	
	@ManyToOne
	@MapsId("bankId")
    @JoinColumn(name = "BankId")
	private Bank bank;

	public JoinCustomerBank() {
	}

	public JoinCustomerBankPK getId() {
		return this.id;
	}

	public void setId(JoinCustomerBankPK id) {
		this.id = id;
	}

	public String getBankAccountNo() {
		return this.bankAccountNo;
	}

	public void setBankAccountNo(String bankAccountNo) {
		this.bankAccountNo = bankAccountNo;
	}

	public String getBankNo() {
		return this.bankNo;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
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

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}

}