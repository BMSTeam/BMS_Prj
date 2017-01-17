package bms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the EmployeeType database table.
 * 
 */
@Entity
@NamedQuery(name="EmployeeType.findAll", query="SELECT e FROM EmployeeType e")
public class EmployeeType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="EmpTypeId")
	private int empTypeId;

	@Column(name="CreateBy")
	private String createBy;

	@Column(name="CreateDate")
	private Timestamp createDate;

	@Column(name="EmpTypeName")
	private String empTypeName;

	@Column(name="UpdateBy")
	private String updateBy;

	@Column(name="UpdateDate")
	private Timestamp updateDate;

	@Column(name="Version")
	private long version;

	public EmployeeType() {
	}

	public int getEmpTypeId() {
		return this.empTypeId;
	}

	public void setEmpTypeId(int empTypeId) {
		this.empTypeId = empTypeId;
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

	public String getEmpTypeName() {
		return this.empTypeName;
	}

	public void setEmpTypeName(String empTypeName) {
		this.empTypeName = empTypeName;
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

}