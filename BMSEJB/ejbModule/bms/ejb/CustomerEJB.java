package bms.ejb;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import bms.ejb.model.CustomerInputBean;
import bms.entity.Bank;
import bms.entity.BetTran;
import bms.entity.Customer;
import bms.entity.JoinCustomerBank;
import bms.entity.JoinCustomerBankPK;
import bms.entity.Web;
import bms.model.BankInfoBean;
import bms.model.BetTranInfoBean;
import bms.model.CustomerInfoBean;
import bms.model.WebInfoBean;
import bms.utils.BMSUtil;

@Stateless(mappedName="BMS.CustomerEJB")
public class CustomerEJB implements CustomerRemote {

	Logger logger = LogManager.getLogger(CustomerEJB.class);

	@PersistenceContext(unitName = "BMSJPA")
	private EntityManager em;

	@Override
	public String searchCustomer(CustomerInputBean customer) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();

		try {

			TypedQuery<Customer> query = em.createNamedQuery("Customer.findByCondition", Customer.class);
			query.setParameter("user", customer.getUserName());
			query.setParameter("telelphone", customer.getTelephone());
			
			Customer customerEntity = (Customer) query.getSingleResult();
			
			CustomerInfoBean customerInfoBean = new CustomerInfoBean();
			customerInfoBean.setUserName(customerEntity.getUserName());
			customerInfoBean.setCusFirstName(customerEntity.getCusFirstName());
			customerInfoBean.setCusLastName(customerEntity.getCusLastName());
			customerInfoBean.setCusTel(customerEntity.getCusTel());
			customerInfoBean.setRemark(customerEntity.getRemark());
			
			Web webEntity = customerEntity.getWeb();
			
			WebInfoBean wenInfoBean = new WebInfoBean();
			wenInfoBean.setWebId(webEntity.getWebId());
			wenInfoBean.setWebCode(webEntity.getWebCode());
			wenInfoBean.setWebURL(webEntity.getWebURL());
			
			customerInfoBean.setWeb(wenInfoBean);
			
			List<BankInfoBean> lbanksMap = new ArrayList<BankInfoBean>();
			for(JoinCustomerBank joinBankEntity : customerEntity.getJoinCustomerBank()) {
				
				if(joinBankEntity.getStatus()==1) {
					BankInfoBean bankInfoBean = new BankInfoBean();
					
					bankInfoBean.setBankNo(joinBankEntity.getBankNo());
					bankInfoBean.setBankAccountNo(joinBankEntity.getBankAccountNo());
					
					Bank bankEntity = joinBankEntity.getBank();
					
					bankInfoBean.setBankId(bankEntity.getBankId());
					bankInfoBean.setBankCode(bankEntity.getBankCode());
					bankInfoBean.setBankEngName(bankEntity.getBankEngName());
					bankInfoBean.setBankThName(bankEntity.getBankThName());
					
					lbanksMap.add(bankInfoBean);
				}
			}
			customerInfoBean.setBanks(lbanksMap);
			
			// Get BetTran
			TypedQuery<BetTran> betTranQuery = em.createNamedQuery("BetTran.findByUser", BetTran.class);
			betTranQuery.setParameter("user", customerEntity.getUserName());
			
			List<BetTran> betTranList = (List<BetTran>) betTranQuery.getResultList();
			
			List<BetTranInfoBean> lbetTranInfoBean = new ArrayList<BetTranInfoBean>();
			for(BetTran betTranEntity : betTranList) {
				
				BetTranInfoBean betTranInfoBean = new BetTranInfoBean();
				
				betTranInfoBean.setTranId(betTranEntity.getTranId());
				betTranInfoBean.setTranDate(betTranEntity.getTranDate());
				betTranInfoBean.setTranTime(betTranEntity.getTranTime());
				betTranInfoBean.setUserName(betTranEntity.getUserName());
				betTranInfoBean.setWebCode(betTranEntity.getWebCode());
				betTranInfoBean.setCompBankCode(betTranEntity.getCompBankCode());
				betTranInfoBean.setCompBankAcc(betTranEntity.getCompBankAcc());
				betTranInfoBean.setCusBankCode(betTranEntity.getCusBankCode());
				betTranInfoBean.setCusBankAcc(betTranEntity.getCusBankAcc());
				betTranInfoBean.setTranType(betTranEntity.getTranType());
				betTranInfoBean.setChannelCode(betTranEntity.getChannelCode());
				betTranInfoBean.setAmount(betTranEntity.getAmount());
				betTranInfoBean.setCredit(betTranEntity.getCredit());
				betTranInfoBean.setBalance(betTranEntity.getBalance());
				betTranInfoBean.setFreeFee(betTranEntity.getFreeFee());
				betTranInfoBean.setRemark(betTranEntity.getRemark());
				betTranInfoBean.setApproveStatus(betTranEntity.getAppoveStatus());
				betTranInfoBean.setApproveBy(betTranEntity.getAppoveBy());
				betTranInfoBean.setCreateBy(betTranEntity.getCreateBy());
				betTranInfoBean.setCreateDate(BMSUtil.ConvertTime(betTranEntity.getCreateDate()));
				betTranInfoBean.setUpdateBy(betTranEntity.getUpdateBy());
				betTranInfoBean.setUpdateDate(BMSUtil.ConvertTime(betTranEntity.getUpdateDate()));
				
				lbetTranInfoBean.add(betTranInfoBean);
			}
			customerInfoBean.setBetTrans(lbetTranInfoBean);
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(customerInfoBean));
			
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
	public String addCustomer(CustomerInputBean customer) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			List<String> bankNoList = new ArrayList<String>();
			for(Map<String,String> m : customer.getBanks()) {
				bankNoList.add("'" + m.get("bankNo") + "'");
			}
			
			String bankListString = bankNoList.toString().replaceAll("\\[", "");
			bankListString = bankListString.replaceAll("\\]", "");
			
			String sqlCheckCustomer =
					" SELECT COUNT(*) AS EXIST_USER " +
					" FROM Customer c " +
					" INNER JOIN JoinCustomerBank jb ON jb.UserName = c.UserName " +
					" WHERE " +
					" c.UserName = ?1 " +
					" OR c.CusTel = ?2 " +
					" OR CONCAT(c.CusFirstName, c.CusLastName) = ?3 " +
					" OR jb.BankNo IN (?4) ";
			
			Query queryCheckCustomer = em.createNativeQuery(sqlCheckCustomer);
			queryCheckCustomer.setParameter(1, customer.getUserName());
			queryCheckCustomer.setParameter(2, customer.getTelephone());
			queryCheckCustomer.setParameter(3, customer.getFirstName() + customer.getLastName());
			queryCheckCustomer.setParameter(4, bankListString);
			
			int countResult = (int) queryCheckCustomer.getResultList().get(0);
			
			if(countResult > 0) {
				jsonObj.addProperty("response", "error");
				jsonObj.addProperty("message", "This customer is already exist.");
			} else {
				TypedQuery<Web> webQuery = em.createQuery("SELECT w FROM Web w WHERE w.webCode=:webCode", Web.class);
				webQuery.setParameter("webCode", customer.getWebCode());
				Web webEntity = BMSUtil.getSingleResultOrNull(webQuery);
				
				Customer cus = new Customer();
				
				cus.setUserName(customer.getUserName());
				cus.setCusFirstName(customer.getFirstName());
				cus.setCusLastName(customer.getLastName());
				cus.setCusTel(customer.getTelephone());
				cus.setWeb(webEntity);
				cus.setRemark(customer.getRemark());
				cus.setCreateDate(new Timestamp(System.currentTimeMillis()));
				cus.setCreateBy(customer.getCreateBy());
				
				em.persist(cus);
				
				for(Map<String, String> mp : customer.getBanks()) {
					
					TypedQuery<Bank> bankQuery = em.createQuery("SELECT b FROM Bank b WHERE b.bankCode=:bankCode", Bank.class);
					bankQuery.setParameter("bankCode", mp.get("bankCode"));
					Bank bankEntity = BMSUtil.getSingleResultOrNull(bankQuery);
					
					JoinCustomerBankPK jcusBankPk = new JoinCustomerBankPK();
					jcusBankPk.setBankId(bankEntity.getBankId());
					jcusBankPk.setUserName(cus.getUserName());
					
					JoinCustomerBank jcusBank = new JoinCustomerBank();
					jcusBank.setId(jcusBankPk);
					jcusBank.setBankNo(mp.get("bankNo"));
					jcusBank.setStatus((short) 1);
					jcusBank.setCreateBy(customer.getCreateBy());
					jcusBank.setCreateDate(new Timestamp(System.currentTimeMillis()));
					
					jcusBank.setBank(bankEntity);
					jcusBank.setCustomer(cus);
					
					em.persist(jcusBank);
				}
				
				em.flush();
				
				jsonObj.addProperty("response", "success");
				jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(customer));
				
				logger.debug(gson.toJson(customer));
			}
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}

	@Override
	public String searchCustomerOnly(CustomerInputBean customer) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			String sql = "SELECT c FROM Customer c WHERE 1=1 ";
			
			if(BMSUtil.isNotNull(customer.getUserName())) {
				sql += String.format("AND c.userName = '%s'", customer.getUserName());
			}
			if(BMSUtil.isNotNull(customer.getFirstName())) {
				sql += String.format("AND c.cusFirstName = '%s'", customer.getFirstName());
			}
			if(BMSUtil.isNotNull(customer.getLastName())) {
				sql += String.format("AND c.cusLastName = '%s'", customer.getLastName());
			}
			if(BMSUtil.isNotNull(customer.getTelephone())) {
				sql += String.format("AND c.cusTel = '%s'", customer.getTelephone());
			}
			if(BMSUtil.isNotNull(customer.getWebCode())) {
				sql += String.format("AND c.web.webCode = '%s'", customer.getWebCode());
			}
			
			TypedQuery<Customer> query = em.createQuery(sql, Customer.class);
			
			List<CustomerInfoBean> customerList = new ArrayList<CustomerInfoBean>();
			for(Customer customerEntity : query.getResultList()) {
				
				CustomerInfoBean customerInfoBean = new CustomerInfoBean();
				customerInfoBean.setUserName(customerEntity.getUserName());
				customerInfoBean.setCusFirstName(customerEntity.getCusFirstName());
				customerInfoBean.setCusLastName(customerEntity.getCusLastName());
				customerInfoBean.setCusTel(customerEntity.getCusTel());
				customerInfoBean.setRemark(customerEntity.getRemark());
				
				Web webEntity = customerEntity.getWeb();
				
				WebInfoBean wenInfoBean = new WebInfoBean();
				wenInfoBean.setWebId(webEntity.getWebId());
				wenInfoBean.setWebCode(webEntity.getWebCode());
				wenInfoBean.setWebURL(webEntity.getWebURL());
				
				customerInfoBean.setWeb(wenInfoBean);
				
				List<BankInfoBean> lbanksMap = new ArrayList<BankInfoBean>();
				for(JoinCustomerBank joinBankEntity : customerEntity.getJoinCustomerBank()) {
					
					if(joinBankEntity.getStatus()==1) {
						BankInfoBean bankInfoBean = new BankInfoBean();
						
						bankInfoBean.setBankNo(joinBankEntity.getBankNo());
						bankInfoBean.setBankAccountNo(joinBankEntity.getBankAccountNo());
						
						Bank bankEntity = joinBankEntity.getBank();
						
						bankInfoBean.setBankId(bankEntity.getBankId());
						bankInfoBean.setBankCode(bankEntity.getBankCode());
						bankInfoBean.setBankEngName(bankEntity.getBankEngName());
						bankInfoBean.setBankThName(bankEntity.getBankThName());
						
						lbanksMap.add(bankInfoBean);
					}
				}
				customerInfoBean.setBanks(lbanksMap);
				customerList.add(customerInfoBean);
			}
			
			Map<String, Object> lcustomersMap = new HashMap<String, Object>();
			lcustomersMap.put("customers", customerList);
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(lcustomersMap));
			
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
	public String editCustomer(CustomerInputBean customer) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			TypedQuery<Web> webQuery = em.createQuery("SELECT w FROM Web w WHERE w.webCode=:webCode", Web.class);
			webQuery.setParameter("webCode", customer.getWebCode());
			Web w = BMSUtil.getSingleResultOrNull(webQuery);
			
			Customer c = em.find(Customer.class, customer.getUserName());
			
			c.setCusFirstName(customer.getFirstName());
			c.setCusLastName(customer.getLastName());
			c.setCusTel(customer.getTelephone());
			c.setRemark(customer.getRemark());
			c.setWeb(w);
			c.setUpdateDate(new Timestamp(System.currentTimeMillis()));
			c.setUpdateBy(customer.getCreateBy());
			
			em.persist(c);
			
			List<Integer> bankIdList = new ArrayList<Integer>();
			List<Map<String, String>> listBanks = new ArrayList<Map<String, String>>();
			for(Map<String, String> mp : customer.getBanks()) {
				
				TypedQuery<Bank> bankQuery = em.createQuery("SELECT b FROM Bank b WHERE b.bankCode=:bankCode", Bank.class);
				bankQuery.setParameter("bankCode", mp.get("bankCode"));
				Bank bankEntity = BMSUtil.getSingleResultOrNull(bankQuery);
				
				bankIdList.add(bankEntity.getBankId());
				listBanks.add(mp);
			}
			
			// Finding banks that not is in the list. We need to set 0 status to them.
			TypedQuery<JoinCustomerBank> findBankNotInListQuery = 
					em.createQuery("SELECT jcb FROM JoinCustomerBank jcb WHERE jcb.id.userName = :userName AND jcb.id.bankId NOT IN :banks", 
							JoinCustomerBank.class);
			
			findBankNotInListQuery.setParameter("userName", c.getUserName());
			findBankNotInListQuery.setParameter("banks", bankIdList);
			
			for(JoinCustomerBank jcb : findBankNotInListQuery.getResultList()) {
				jcb.setStatus((short) 0);
				em.persist(jcb);
			}
			
			// Check bank to insert or update.
			for(Map<String, String> mp : listBanks) {
				
				TypedQuery<JoinCustomerBank> CheckBankQuery = 
						em.createQuery("SELECT jcb FROM JoinCustomerBank jcb WHERE jcb.id.userName = :userName AND jcb.id.bankId = :bankId", 
								JoinCustomerBank.class);
				
				CheckBankQuery.setParameter("userName", c.getUserName());
				CheckBankQuery.setParameter("bankId", mp.get("bankId"));
				
				JoinCustomerBank jcb = BMSUtil.getSingleResultOrNull(CheckBankQuery);
				
				if(jcb==null) {
					TypedQuery<Bank> bankQuery = em.createQuery("SELECT b FROM Bank b WHERE b.bankCode=:bankCode", Bank.class);
					bankQuery.setParameter("bankCode", mp.get("bankCode"));
					Bank bankEntity = BMSUtil.getSingleResultOrNull(bankQuery);
					
					JoinCustomerBankPK jcusBankPk = new JoinCustomerBankPK();
					jcusBankPk.setBankId(bankEntity.getBankId());
					jcusBankPk.setUserName(c.getUserName());
					
					JoinCustomerBank jcusBank = em.find(JoinCustomerBank.class, jcusBankPk);
					
					if(jcusBank==null) {
						jcusBank = new JoinCustomerBank();
						jcusBank.setId(jcusBankPk);
						jcusBank.setBankNo(mp.get("bankNo"));
						jcusBank.setStatus((short) 1);
						jcusBank.setCreateBy(customer.getCreateBy());
						jcusBank.setCreateDate(new Timestamp(System.currentTimeMillis()));
						
						jcusBank.setBank(bankEntity);
						jcusBank.setCustomer(c);
					} else {
						jcusBank.setBankNo(mp.get("bankNo"));
						jcusBank.setStatus((short) 1);
						jcusBank.setUpdateBy(customer.getCreateBy());
						jcusBank.setUpdateDate(new Timestamp(System.currentTimeMillis()));
					}
					
					em.persist(jcusBank);
					
				} else {
					jcb.setBankNo(mp.get("bankNo"));
					jcb.setStatus((short) 1);
					jcb.setUpdateBy(customer.getCreateBy());
					jcb.setUpdateDate(new Timestamp(System.currentTimeMillis()));
					
					em.persist(jcb);
				}
			}
			
			em.flush();
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(customer));
			
			logger.debug(gson.toJson(customer));
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}

	@Override
	public String deleteCustomer(String customer) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			TypedQuery<Customer> CustomerQuery = 
					em.createQuery("DELETE FROM Customer c WHERE c.userName = :userName", 
							Customer.class);
			
			CustomerQuery.setParameter("userName", customer);
			int customerRow = CustomerQuery.executeUpdate();
			
			TypedQuery<JoinCustomerBank> JoinCustomerBankQuery = 
					em.createQuery("DELETE FROM JoinCustomerBank jcb WHERE jcb.id.userName = :userName", 
							JoinCustomerBank.class);
			
			JoinCustomerBankQuery.setParameter("userName", customer);
			int joinCustomerBankRow = JoinCustomerBankQuery.executeUpdate();
			
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("customerRow", customerRow);
			mp.put("joinCustomerBankRow", joinCustomerBankRow);
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(mp));
			
			logger.debug(gson.toJson(customer));
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}
}
