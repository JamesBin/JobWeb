package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.opensymphony.xwork2.ActionSupport;

import service.JobServiceI;

/**
 * lucene检索 Controller
 * @author zwb
 * @Date 2015-8-4
 * 
 */
@Namespace(value = "/")
@Action(value = "jobAction",results={@Result(name="success",location="/index.jsp")})
@Scope("prototype")
public class JobAction extends ActionSupport implements ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final Logger logger = Logger.getLogger(JobAction.class);

	@Autowired
	private JobServiceI jobService;

	private String searchInfo;

	private HttpServletRequest request;
	
	private List<Object> searchResult;

	

	public String search() throws Exception {
		request.setAttribute("mainPage", "/user/search.jsp");
		jobService.createIndexesByLucene(searchInfo);
		searchResult = jobService.searchInfoByLucene(searchInfo);
		return SUCCESS;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public List<Object> getSearchResult() {
		return searchResult;
	}

	public void setSearchResult(List<Object> searchResult) {
		this.searchResult = searchResult;
	}

	public String getSearchInfo() {
		return searchInfo;
	}

	public void setSearchInfo(String searchInfo) {
		this.searchInfo = searchInfo;
	}
}
