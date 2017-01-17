package bms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the EmployeeAuthen database table.
 * 
 */
@Entity
@Table(name="EmployeeAuthen")
@NamedQuery(name="EmployeeAuthenEntity.findAll", query="SELECT e FROM EmployeeAuthenEntity e")
public class EmployeeAuthenEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="UserName")
	private String userName;

	@Column(name="CreateBy")
	private String createBy;

	@Column(name="CreateDate")
	private Timestamp createDate;

	@Column(name="EmpId")
	private int empId;

	@Column(name="LastLogin")
	private Timestamp lastLogin;

	@Column(name="Password")
	private String password;

	@Column(name="UpdateBy")
	private String updateBy;

	@Column(name="UpdateDate")
	private Timestamp updateDate;

	@Column(name="Version")
	private Timestamp version;

	public EmployeeAuthenEntity() {
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

	public int getEmpId() {
		return this.empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public Timestamp getLastLogin() {
		return this.lastLogin;
	}

	public void setLastLogin(Timestamp lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public Timestamp getVersion() {
		return this.version;
	}

	public void setVersion(Timestamp version) {
		this.version = version;
	}

}