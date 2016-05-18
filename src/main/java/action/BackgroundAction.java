package action;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.jboss.logging.Logger;
import org.springframework.context.annotation.Scope;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import service.BackgroundServiceI;
import vo.Company;
import vo.Student;
import vo.User;

/**
 * 后台管理系统 Controller
 * 
 * @author zwb
 * @Date   2015-11-28 
 */
@Namespace("/")
@Action(value="backGroundAction",results={@Result(name="success",location="/background/mainTemp.jsp"),
		@Result(name="login",location="/background/login.jsp")})
@Scope("prototype")
public class BackgroundAction extends BaseAction implements ServletRequestAware  {

	private static final long serialVersionUID = 1L;
	
	private Logger logger = Logger.getLogger(BackgroundAction.class);
	
	@Resource
	private BackgroundServiceI backgroundService;
	
	private User user;

	private HttpServletRequest request;
	
	private String errorMsg;
	
	private String id;
	
	public String login() {
		Map<String, Object> session =(Map<String, Object>) ActionContext.getContext().getSession();
		List<User> userList = backgroundService.findByUser(user);
		if(userList.size() > 0) {
			session.put("currentUser", userList.get(0));
			request.setAttribute("errorMsg", null);
		}
		else{
			session.put("user", user);
			request.setAttribute("errorMsg", "用户名或密码错误");
			return "login";
		}
		return "success";
	}
	
	public  String preSaveIsType() {
		request.setAttribute("mainPage", "/background/preSaveInternshipType.jsp");
		return "success";
	}
	
	public String checkCompanyStatus () {
		List<Company> applyCompanyLists =  backgroundService.findAllApplyCompany();
		request.setAttribute("applyCompanyLists", applyCompanyLists);
		request.setAttribute("mainPage", "/background/checkCompanyStatus.jsp");
		return "success";
	}
	
	
	public String deleteCompany () {
		backgroundService.deleteCompanyById(id);
		List<Company> applyCompanyLists =  backgroundService.findAllApplyCompany();
		request.setAttribute("applyCompanyLists", applyCompanyLists);
		request.setAttribute("mainPage", "/background/checkCompanyStatus.jsp");
		return "success";
	}
	
	
	public  String findStudentInfo() {
		List<Student> studentLists = backgroundService.findAllStudent();
		request.setAttribute("studentLists", studentLists);
		request.setAttribute("mainPage", "/background/studentInfoManage.jsp");
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getErrorMsg() {return errorMsg;}

	public void setErrorMsg(String errorMsg) {this.errorMsg = errorMsg;}


	public User getUser() {return user;}

	public void setUser(User user) {this.user = user;}

	public User getModel() {return user;}

	public void setServletRequest(HttpServletRequest request) {this.request = request;}
}
