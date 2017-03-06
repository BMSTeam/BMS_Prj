package bms.entity;

import java.io.Serializable;

import javax.persistence.*;

import java.sql.Timestamp;


/**
 * The persistent class for the Employee database table.
 * 
 */
@Entity
@NamedQuery(name="Employee.findAll", query="SELECT e FROM Employee e")
public class Employee implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="EmpId")
	private int empId;

	@Column(name="CreateBy")
	private String createBy;

	@Column(name="CreateDate")
	private Timestamp createDate;

	@Column(name="EmpFirtsName")
	private String empFirtsName;

	@Column(name="EmpLastName")
	private String empLastName;

	@Column(name="EmpNickName")
	private String empNickName;

	@Column(name="EmpRemark")
	private String empRemark;

	@Column(name="EmpTypeId")
	private int empTypeId;

	@Column(name="UpdateBy")
	private String updateBy;

	@Column(name="UpdateDate")
	private Timestamp updateDate;

	@Column(name="Version")
	private long version;
	
	@OneToOne(mappedBy="employee")
	private EmployeeAuthen employeeAuth;

	public Employee() {
	}

	public int getEmpId() {
		return this.empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
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

	public String getEmpFirtsName() {
		return this.empFirtsName;
	}

	public void setEmpFirtsName(String empFirtsName) {
		this.empFirtsName = empFirtsName;
	}

	public String getEmpLastName() {
		return this.empLastName;
	}

	public void setEmpLastName(String empLastName) {
		this.empLastName = empLastName;
	}

	public String getEmpNickName() {
		return this.empNickName;
	}

	public void setEmpNickName(String empNickName) {
		this.empNickName = empNickName;
	}

	public String getEmpRemark() {
		return this.empRemark;
	}

	public void setEmpRemark(String empRemark) {
		this.empRemark = empRemark;
	}

	public int getEmpTypeId() {
		return this.empTypeId;
	}

	public void setEmpTypeId(int empTypeId) {
		this.empTypeId = empTypeId;
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

	public EmployeeAuthen getEmployeeAuth() {
		return employeeAuth;
	}

	public void setEmployeeAuth(EmployeeAuthen employeeAuth) {
		this.employeeAuth = employeeAuth;
	}

}