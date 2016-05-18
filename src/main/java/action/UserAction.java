package action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import com.opensymphony.xwork2.ActionSupport;
import service.UserServiceI;
import vo.Company;
import vo.Student;
import vo.User;

/**
 * 用户信息 Controller
 * 
 * @author LevenGuo
 * 
 */
@Namespace(value = "/")
@Action(value = "userAction", results = { @Result(name = "success", location = "/index.jsp"),
		@Result(name = "manager", location = "/background/mainTemp.jsp"),
		@Result(name = "managerlogin", location = "/background/login.jsp"),
		@Result(name = "perfectStu", location = "/user/perfectStuInfo.jsp"),
		@Result(name = "perfectCom", location = "/user/perfectCompanyInfo.jsp"),
		@Result(name = "myResume", type="redirect", location="resumeAction!getInternsExp.action"),
		@Result(name = "myCompany",location = "/company/pushJob.jsp" )})
@Scope("prototype")
public class UserAction extends ActionSupport implements ServletRequestAware {
	private static final Logger logger = Logger.getLogger(UserAction.class);

	@Autowired
	private UserServiceI userService;

	private User user;

	private Student student;

	private Company company;

	private String result;

	public void test() {
		logger.info("进入action");
		userService.test();
	}

	public String register() {
		HttpSession session = request.getSession();
		userService.saveUser(user);
		userService.preSaveUserInfo(user);
		if (user.getRole().getId() == 1) {
			List<Student> student = userService.findStudentInfo(user.getUsername());
			session.setAttribute("student", student.get(0));
		} else {
			List<Company> company = userService.findCompanyInfo(user.getUsername());
			session.setAttribute("company", company.get(0));
		}

		session.setAttribute("currentUser", user);
		return SUCCESS;
	}

	public String login() {
		HttpSession session = request.getSession();
		List<User> currentUser = userService.findUser(user);
		if (currentUser.size() > 0) {
			session.setAttribute("currentUser", currentUser.get(0));
			request.setAttribute("errorMsg", null);

			if (currentUser.get(0).getRole().getId() == 1) {
				List<Student> student = userService.findStudentInfo(user.getUsername());
				session.setAttribute("student", student.get(0));
			}

			else if (currentUser.get(0).getRole().getId() == 2) {
				List<Company> company = userService.findCompanyInfo(user.getUsername());
				session.setAttribute("company", company.get(0));
			}

		} else {
			session.setAttribute("user", user);
			request.setAttribute("errorMsg", "用户名或密码错误");
		}

		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String logout() {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		if (user.getRole().getId() == 3) {
			session.invalidate();
			return "managerlogin";
		}
		session.invalidate();
		return SUCCESS;
	}

	public String checkName() {
		String username = request.getParameter("username");
		if (userService.isUserExist(username)) {
			result = "1"; // 用户名存在
		} else {
			result = "0"; // 用户名不存在
		}
		return SUCCESS;
	}

	public String perfectUserInfo() {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		if (user.getRole().getId() == 1) {
			return "perfectStu";
		}
		return "perfectCom";
	}

	public String updateStudentInfo() {
		HttpSession session = request.getSession();
		userService.updateStudentInfo(student);
		session.setAttribute("student", student);
		return "myResume";
	}

	public String updateCompanyInfo() {
		HttpSession session = request.getSession();
		userService.updateCompanyInfo(company);
		session.setAttribute("company", company);
		return "myCompany";
	}

	public String getData() {
		int a = 2;
		System.out.print(a);
		return SUCCESS;

	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private HttpServletRequest request;

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
}