package bms.ejb;

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

import bms.entity.Bank;
import bms.entity.JoinCompanyBank;
import bms.model.BankInfoBean;
import bms.utils.BMSUtil;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Stateless(mappedName="BMS.BankEJB")
public class BankEJB implements BankRemote {
	
	Logger logger = LogManager.getLogger(BankEJB.class);

	@PersistenceContext(unitName = "BMSJPA")
	private EntityManager em;

	@Override
	public String getBanks() {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			TypedQuery<Bank> bankQuery = em.createNamedQuery("Bank.findAll", Bank.class);
			List<Bank> bankList = bankQuery.getResultList();
			
			List<BankInfoBean> lbanks = new ArrayList<BankInfoBean>();
			for(Bank bank : bankList) {
				
				BankInfoBean bankInfoBean = new BankInfoBean();
				
				bankInfoBean.setBankCode(bank.getBankCode());
				bankInfoBean.setBankEngName(bank.getBankEngName());
				bankInfoBean.setBankThName(bank.getBankThName());
				
				lbanks.add(bankInfoBean);
			}
			
			Map<String, Object> lbanksMap = new HashMap<String, Object>();
			lbanksMap.put("banks", lbanks);
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(lbanksMap));
			
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
	public String getCompanryBanksOnlyActiveStatus() {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			TypedQuery<JoinCompanyBank> joinCompanyBankQuery = em.createNamedQuery("JoinCompanyBank.getAllCompanyBankOnlyActive", JoinCompanyBank.class);
			List<JoinCompanyBank> joinCompanyBankList = joinCompanyBankQuery.getResultList();
			
			List<BankInfoBean> lcompBanks = new ArrayList<BankInfoBean>();
			for(JoinCompanyBank compBank : joinCompanyBankList) {
				
				BankInfoBean bankInfoBean = new BankInfoBean();
				
				bankInfoBean.setBankCode(compBank.getBank().getBankCode());
				bankInfoBean.setBankAccountNo(compBank.getId().getAccountNo());
				
				lcompBanks.add(bankInfoBean);
			}
			
			Map<String, Object> lcompBankMap = new HashMap<String, Object>();
			lcompBankMap.put("compBanks", lcompBanks);
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(lcompBankMap));
			
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

}
