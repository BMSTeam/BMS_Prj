package bms.ejb;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import bms.ejb.model.EmployeeInputBean;
import bms.entity.Employee;
import bms.entity.EmployeeAuthen;
import bms.entity.EmployeeType;
import bms.model.EmployeeInfoBean;
import bms.model.EmployeeTypeInfoBean;
import bms.utils.BCrypt;
import bms.utils.BMSUtil;

@Stateless(mappedName="BMS.EmployeeEJB")
public class EmployeeEJB implements EmployeeRemote {
	
	Logger logger = LogManager.getLogger(EmployeeEJB.class);
	
	@PersistenceContext(unitName = "BMSJPA")
	private EntityManager em;

	@Override
	public String getEmployeeType() {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			TypedQuery<EmployeeType> empType = em.createNamedQuery("EmployeeType.findAll", EmployeeType.class);
			List<EmployeeType> typeList = empType.getResultList();
			
			List<EmployeeTypeInfoBean> empTypeList = new ArrayList<EmployeeTypeInfoBean>();
			for(EmployeeType t : typeList) {
				
				EmployeeTypeInfoBean bean = new EmployeeTypeInfoBean();
				bean.setTypeId(t.getEmpTypeId());
				bean.setTypeName(t.getEmpTypeName());
				
				empTypeList.add(bean);
			}
			
			Map<String, Object> lempTypeMap = new HashMap<String, Object>();
			lempTypeMap.put("employeeTypes", empTypeList);
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(lempTypeMap));
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}

	@Override
	public String searchEmployee(EmployeeInputBean employee) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			String sql = "SELECT e FROM Employee e WHERE 1=1 ";
			
			if(BMSUtil.isNotNull(employee.getUserName())) {
				sql += String.format("AND e.employeeAuth.userName = '%s'", employee.getUserName());
			}
			if(BMSUtil.isNotNull(employee.getFirstName())) {
				sql += String.format("AND e.empFirtsName = '%s'", employee.getFirstName());
			}
			if(BMSUtil.isNotNull(employee.getLastName())) {
				sql += String.format("AND e.empLastName = '%s'", employee.getLastName());
			}
			if(BMSUtil.isNotNull(employee.getNickName())) {
				sql += String.format("AND e.empNickName = '%s'", employee.getNickName());
			}
			if(BMSUtil.isNotNull(employee.getEmployeeType())) {
				sql += String.format("AND e.empTypeId = %s", employee.getEmployeeType());
			}
			if(BMSUtil.isNotNull(employee.getRemark())) {
				sql += "AND e.empRemark LIKE '%" + employee.getRemark() + "%'";
			}
			
			TypedQuery<Employee> query = em.createQuery(sql, Employee.class);
			
			List<EmployeeInfoBean> employeeList = new ArrayList<EmployeeInfoBean>();
			for(Employee emp : query.getResultList()) {
				
				EmployeeInfoBean empBean = new EmployeeInfoBean();
				empBean.setEmpId(emp.getEmpId());
				empBean.setUserName(emp.getEmployeeAuth().getUserName());
				empBean.setEmpFirtsName(emp.getEmpFirtsName());
				empBean.setEmpLastName(emp.getEmpLastName());
				empBean.setEmpNickName(emp.getEmpNickName());
				empBean.setEmpTypeId(emp.getEmpTypeId());
				empBean.setEmpRemark(emp.getEmpRemark());
				
				employeeList.add(empBean);
			}
			
			Map<String, Object> lemployeesMap = new HashMap<String, Object>();
			lemployeesMap.put("employees", employeeList);
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(lemployeesMap));
			
			logger.debug(gson.toJson(jsonObj));
			
		} catch (javax.persistence.NoResultException e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", "No Result");
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}
	
	@Override
	public String addEmployee(EmployeeInputBean employee) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			String query = "SELECT e FROM Employee e " +
							" WHERE CONCAT(e.empFirtsName, e.empLastName) = :empflname " +
							" OR e.employeeAuth.userName = :userName ";
			
			TypedQuery<Employee> findEmp = em.createQuery(query, Employee.class);
			findEmp.setParameter("empflname", employee.getFirstName().trim() + employee.getLastName().trim());
			findEmp.setParameter("userName", employee.getUserName());
			
			Employee emp = BMSUtil.getSingleResultOrNull(findEmp);
			
			if(emp != null) {
				jsonObj.addProperty("response", "error");
				jsonObj.addProperty("message", "This employee is already exist.");
			} else {
				
				emp = new Employee();
				emp.setEmpFirtsName(employee.getFirstName().trim());
				emp.setEmpLastName(employee.getLastName().trim());
				emp.setEmpNickName(employee.getNickName().trim());
				emp.setEmpTypeId(Integer.parseInt(employee.getEmployeeType()));
				emp.setEmpRemark(employee.getRemark().trim());
				emp.setCreateDate(new Timestamp(System.currentTimeMillis()));
				emp.setCreateBy(employee.getCreateBy());
				emp.setVersion(1);
				
				em.persist(emp);
				em.flush();
				
				EmployeeAuthen empAuthen = new EmployeeAuthen();
				empAuthen.setUserName(employee.getUserName());
				empAuthen.setPassword(BCrypt.hashpw(employee.getPassword(), BCrypt.gensalt()));
				empAuthen.setCreateDate(new Timestamp(System.currentTimeMillis()));
				empAuthen.setCreateBy(employee.getCreateBy());
				empAuthen.setVersion(1);
				empAuthen.setEmployee(emp);
				
				em.persist(empAuthen);
				em.flush();
				
				jsonObj.addProperty("response", "success");
				jsonObj.addProperty("message", "Save employee complete.");
			}
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}

	@Override
	public String editEmployee(EmployeeInputBean employee) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			String query = "SELECT e FROM Employee e " +
							" WHERE e.empId <> :empId " +
							" AND ( CONCAT(e.empFirtsName, e.empLastName) = :empflname " +
							" OR e.employeeAuth.userName = :userName )";
			
			TypedQuery<Employee> findEmp = em.createQuery(query, Employee.class);
			findEmp.setParameter("empId", Integer.parseInt(employee.getEmpId()));
			findEmp.setParameter("empflname", employee.getFirstName().trim() + employee.getLastName().trim());
			findEmp.setParameter("userName", employee.getUserName());
			
			Employee checked = BMSUtil.getSingleResultOrNull(findEmp);
			
			if(checked != null) {
				jsonObj.addProperty("response", "error");
				jsonObj.addProperty("message", "This employee is already exist.");
			} else {
				
				Employee emp = em.find(Employee.class, Integer.parseInt(employee.getEmpId()));
				
				emp.setEmpFirtsName(employee.getFirstName().trim());
				emp.setEmpLastName(employee.getLastName().trim());
				emp.setEmpNickName(employee.getNickName().trim());
				emp.setEmpTypeId(Integer.parseInt(employee.getEmployeeType()));
				emp.setEmpRemark(employee.getRemark().trim());
				
				emp.setUpdateDate(new Timestamp(System.currentTimeMillis()));
				emp.setUpdateBy(employee.getCreateBy());
				
				EmployeeAuthen empAuth = emp.getEmployeeAuth();
				
				empAuth.setUpdateDate(new Timestamp(System.currentTimeMillis()));
				empAuth.setUpdateBy(employee.getCreateBy());
				
				em.persist(empAuth);
				em.persist(emp);
				em.flush();
				
				jsonObj.addProperty("response", "success");
				jsonObj.addProperty("message", "Save employee complete.");
			}
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}

	@Override
	public String deleteEmployee(int employee) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			Employee emp = em.find(Employee.class, employee);
			EmployeeAuthen empAuth = emp.getEmployeeAuth();
			
			em.remove(emp);
			em.remove(empAuth);
			
			jsonObj.addProperty("response", "success");
			jsonObj.addProperty("message", "Delete employee complete.");
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}

		return gson.toJson(jsonObj);
	}

}
