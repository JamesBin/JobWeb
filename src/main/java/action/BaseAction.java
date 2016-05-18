package action;

import java.io.IOException;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
public class BaseAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(BaseAction.class);
	public String writeJson(Object object){
		try{
			String json=JSON.toJSONStringWithDateFormat(object,"yyyy-MM-dd HH:mm:ss");
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
			ServletActionContext.getResponse().getWriter().write(json);
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		}catch(IOException e){
			e.printStackTrace();
		}
		return null;
	}
}
