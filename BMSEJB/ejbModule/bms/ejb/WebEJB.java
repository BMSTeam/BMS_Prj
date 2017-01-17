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

import bms.entity.Web;
import bms.model.WebInfoBean;
import bms.utils.BMSUtil;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Stateless(mappedName="BMS.WebEJB")
public class WebEJB implements WebRemote {
	
	Logger logger = LogManager.getLogger(WebEJB.class);
	
	@PersistenceContext(unitName = "BMSJPA")
	private EntityManager em;

	@Override
	public String getAllWeb() {
		
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		try {
			
			TypedQuery<Web> webQuery = em.createNamedQuery("Web.findAll", Web.class);
			List<Web> webList = webQuery.getResultList();
			
			List<WebInfoBean> lwebs = new ArrayList<WebInfoBean>();
			for(Web web : webList) {
				
				WebInfoBean webInfoBean = new WebInfoBean();
				
				webInfoBean.setWebId(web.getWebId());
				webInfoBean.setWebCode(web.getWebCode());
				webInfoBean.setWebURL(web.getWebURL());
				
				lwebs.add(webInfoBean);
			}
			
			Map<String, Object> lwebsMap = new HashMap<String, Object>();
			lwebsMap.put("webs", lwebs);
			
			jsonObj.addProperty("response", "success");
			jsonObj.add("message", BMSUtil.ConvertJavaObjToJsonObj(lwebsMap));
			
			logger.debug(gson.toJson(jsonObj));
			
		} catch (Exception e) {
			jsonObj.addProperty("response", "error");
			jsonObj.addProperty("message", e.getMessage());

			logger.error("EJBException", e);
		}
		
		return gson.toJson(jsonObj);
	}

}
