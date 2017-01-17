package bms.entity;

import java.io.Serializable;

import javax.persistence.*;

import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the Customer database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="Customer.findAll", 
		query="SELECT c FROM Customer c"),
	@NamedQuery(name="Customer.findByCondition", 
		query="SELECT c FROM Customer c WHERE c.userName=:user OR c.cusTel=:telelphone"),
})
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="UserName")
	private String userName;

	@Column(name="CreateBy")
	private String createBy;

	@Column(name="CreateDate")
	private Timestamp createDate;

	@Column(name="CusFirstName")
	private String cusFirstName;

	@Column(name="CusLastName")
	private String cusLastName;

	@Column(name="CusTel")
	private String cusTel;

	@Column(name="Remark")
	private String remark;

	@Column(name="UpdateBy")
	private String updateBy;

	@Column(name="UpdateDate")
	private Timestamp updateDate;

	@Column(name="Version")
	private long version;

	//bi-directional one-to-one association to Web
	@OneToOne
	@JoinColumn(name="FromWebId")
	private Web web;
	
	@OneToMany(mappedBy = "customer", fetch= FetchType.EAGER)
    private List<JoinCustomerBank> joinCustomerBank;

	public Customer() {
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getCusFirstName() {
		return this.cusFirstName;
	}

	public void setCusFirstName(String cusFirstName) {
		this.cusFirstName = cusFirstName;
	}

	public String getCusLastName() {
		return this.cusLastName;
	}

	public void setCusLastName(String cusLastName) {
		this.cusLastName = cusLastName;
	}

	public String getCusTel() {
		return this.cusTel;
	}

	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public Web getWeb() {
		return this.web;
	}

	public void setWeb(Web web) {
		this.web = web;
	}

	public List<JoinCustomerBank> getJoinCustomerBank() {
		return joinCustomerBank;
	}

	public void setJoinCustomerBank(List<JoinCustomerBank> joinCustomerBank) {
		this.joinCustomerBank = joinCustomerBank;
	}

}