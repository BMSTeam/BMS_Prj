package bms.entity;

import java.io.Serializable;

import javax.persistence.*;

import java.sql.Timestamp;


/**
 * The persistent class for the Web database table.
 * 
 */
@Entity
@NamedQuery(name="Web.findAll", query="SELECT w FROM Web w")
public class Web implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="WebId")
	private int webId;

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

	@Column(name="WebCode")
	private String webCode;

	@Column(name="WebURL")
	private String webURL;

	//bi-directional one-to-one association to Customer
	@OneToOne(mappedBy="web")
	private Customer customer;

	public Web() {
	}

	public int getWebId() {
		return this.webId;
	}

	public void setWebId(int webId) {
		this.webId = webId;
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

	public String getWebCode() {
		return this.webCode;
	}

	public void setWebCode(String webCode) {
		this.webCode = webCode;
	}

	public String getWebURL() {
		return this.webURL;
	}

	public void setWebURL(String webURL) {
		this.webURL = webURL;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}