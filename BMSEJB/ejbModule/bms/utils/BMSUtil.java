package bms.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.persistence.TypedQuery;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class BMSUtil {

	public static JsonObject ConvertJavaObjToJsonObj(Object objClass) throws Exception {
		String jsonStr = new Gson().toJson(objClass);
		JsonObject jsonObj = new JsonParser().parse(jsonStr).getAsJsonObject();
		return jsonObj;
	}
	
	public static String ConvertTime(Timestamp time) throws Exception {
	    return time==null?"" : new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(time);
	}
	
	public static <T> T getSingleResultOrNull(TypedQuery<T> query) {
	    query.setMaxResults(1);
	    List<T> list = query.getResultList();
	    if (list.isEmpty()) {
	        return null;
	    }
	    return list.get(0);
	}
	
	public static boolean isNotNull(String text) {
		return text != null && !text.isEmpty();
	}
}
