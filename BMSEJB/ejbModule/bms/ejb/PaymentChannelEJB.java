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

import bms.entity.PaymentChannel;
import bms.model.PaymentChannelInfoBean;
import bms.utils.BMSUtil;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Stateless(mappedName="BMS.PaymentChannelEJB")
public class PaymentChannelEJB implements PaymentChannelRemote {
	
	Logger logger = LogManager.getLogger(PaymentChannelEJB.class);
	
	@PersistenceContext(unitName = "BMSJPA")
	private EntityManager em;

	@Override
	public String getAllPaymentChannel() {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			TypedQuery<PaymentChannel> paymentChQuery = em.createNamedQuery("PaymentChannel.findAll", PaymentChannel.class);
			List<PaymentChannel> paymentChList = paymentChQuery.getResultList();
			
			List<PaymentChannelInfoBean> lpaymentChs = new ArrayList<PaymentChannelInfoBean>();
			for(PaymentChannel paymentCh : paymentChList) {
				
				PaymentChannelInfoBean paymentChannelInfoBean = new PaymentChannelInfoBean();
				
				paymentChannelInfoBean.setChannelCode(paymentCh.getChannelCode());
				paymentChannelInfoBean.setRemark(paymentCh.getRemark());
				
				lpaymentChs.add(paymentChannelInfoBean);
			}
			
			Map<String, Object> lpaymentChMap = new HashMap<String, Object>();
			lpaymentChMap.put("paymentChannels", lpaymentChs);
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(lpaymentChMap));
			
			logger.debug(gson.toJson(jsonObj));
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}

}
