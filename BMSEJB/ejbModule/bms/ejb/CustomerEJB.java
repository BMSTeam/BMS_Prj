package bms.ejb;

import java.sql.Timestamp;
import java.util.ArrayList;
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
	public String searchCustomer(String user, String telelphone) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();

		try {

			TypedQuery<Customer> query = em.createNamedQuery("Customer.findByCondition", Customer.class);
			query.setParameter("user", user);
			query.setParameter("telelphone", telelphone);
			
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
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}
}
