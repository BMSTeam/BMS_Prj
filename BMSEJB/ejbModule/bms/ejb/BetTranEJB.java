package bms.ejb;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import bms.ejb.model.BetTranInputBean;
import bms.entity.BetTran;
import bms.model.BetTranInfoBean;
import bms.model.CustomerInfoBean;
import bms.utils.BMSUtil;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Stateless(mappedName="BMS.BetTranEJB")
public class BetTranEJB implements BetTranRemote {
	
	Logger logger = LogManager.getLogger(BetTranEJB.class);

	@PersistenceContext(unitName = "BMSJPA")
	private EntityManager em;

	@Override
	public String getAllBetTran() {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();

		try {
			
			// Get BetTran
			TypedQuery<BetTran> betTranQuery = em.createNamedQuery("BetTran.findAll", BetTran.class);
			
			List<BetTran> betTranList = betTranQuery.getResultList();
			
			CustomerInfoBean customerInfoBean = new CustomerInfoBean();
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
	public String saveBetTran(BetTranInputBean btib) {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			BetTran betTranEntity = new BetTran();
			
			if(btib.getTranType().equals("Deposit")) {
				
				betTranEntity.setTranDate(btib.getTranDate());
				betTranEntity.setTranTime(btib.getTranTime());
				betTranEntity.setUserName(btib.getUserName());
				betTranEntity.setWebCode(btib.getWebCode());
				betTranEntity.setCompBankCode(btib.getCompBankCode());
				betTranEntity.setCompBankAcc(btib.getCompBankAcc());
				//betTranEntity.setCusBankCode(btib.getCusBankCode());
				//betTranEntity.setCusBankAcc(btib.getCusBankAcc());
				betTranEntity.setTranType(btib.getTranType());
				betTranEntity.setChannelCode(btib.getChannelCode());
				betTranEntity.setAmount(btib.getAmount());
				//betTranEntity.setCredit(btib.getCredit());
				//betTranEntity.setBalance(btib.getBalance());
				betTranEntity.setFreeFee(btib.getFreeFee());
				//betTranEntity.setRemark(btib.getRemark());
				betTranEntity.setAppoveStatus((short)0);
				//betTranEntity.setAppoveBy(btib.getApproveBy());
				betTranEntity.setCreateDate(new Timestamp(System.currentTimeMillis()));
				betTranEntity.setCreateBy(btib.getCreateBy());
				//betTranEntity.setUpdateDate(new Timestamp(System.currentTimeMillis()));
				//betTranEntity.setUpdateBy(btib.getUpdateBy());
				
			} else if(btib.getTranType().equals("Withdraw")) {
				
				betTranEntity.setTranDate(btib.getTranDate());
				betTranEntity.setTranTime(btib.getTranTime());
				betTranEntity.setUserName(btib.getUserName());
				betTranEntity.setWebCode(btib.getWebCode());
				betTranEntity.setCompBankCode(btib.getCompBankCode());
				betTranEntity.setCompBankAcc(btib.getCompBankAcc());
				betTranEntity.setCusBankCode(btib.getCusBankCode());
				betTranEntity.setCusBankAcc(btib.getCusBankAcc());
				betTranEntity.setTranType(btib.getTranType());
				betTranEntity.setChannelCode(btib.getChannelCode());
				betTranEntity.setAmount(btib.getAmount());
				//betTranEntity.setCredit(btib.getCredit());
				//betTranEntity.setBalance(btib.getBalance());
				betTranEntity.setFreeFee(btib.getFreeFee());
				//betTranEntity.setRemark(btib.getRemark());
				betTranEntity.setAppoveStatus((short)0);
				//betTranEntity.setAppoveBy(btib.getApproveBy());
				betTranEntity.setCreateDate(new Timestamp(System.currentTimeMillis()));
				betTranEntity.setCreateBy(btib.getCreateBy());
				//betTranEntity.setUpdateDate(new Timestamp(System.currentTimeMillis()));
				//betTranEntity.setUpdateBy(btib.getUpdateBy());
				
			} else if(btib.getTranType().equals("Move")) {
				
				betTranEntity.setTranDate(btib.getTranDate());
				betTranEntity.setTranTime(btib.getTranTime());
				betTranEntity.setUserName(btib.getUserName());
				betTranEntity.setWebCode(btib.getWebCode());
				betTranEntity.setCompBankCode(btib.getCompBankCode());
				betTranEntity.setCompBankAcc(btib.getCompBankAcc());
				//betTranEntity.setCusBankCode(btib.getCusBankCode());
				//betTranEntity.setCusBankAcc(btib.getCusBankAcc());
				betTranEntity.setTranType(btib.getTranType());
				betTranEntity.setChannelCode(btib.getChannelCode());
				betTranEntity.setAmount(btib.getAmount());
				//betTranEntity.setCredit(btib.getCredit());
				//betTranEntity.setBalance(btib.getBalance());
				betTranEntity.setFreeFee(btib.getFreeFee());
				//betTranEntity.setRemark(btib.getRemark());
				betTranEntity.setAppoveStatus((short)0);
				//betTranEntity.setAppoveBy(btib.getApproveBy());
				betTranEntity.setCreateDate(new Timestamp(System.currentTimeMillis()));
				betTranEntity.setCreateBy(btib.getCreateBy());
				//betTranEntity.setUpdateDate(new Timestamp(System.currentTimeMillis()));
				//betTranEntity.setUpdateBy(btib.getUpdateBy());
				
			}
			
			em.persist(betTranEntity);
			em.flush();
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(betTranEntity));
			
			logger.debug(gson.toJson(jsonObj));
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}
}
