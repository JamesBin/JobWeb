package action;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import service.ResumeServiceI;
import util.InternsModel;
import vo.Student;

import com.opensymphony.xwork2.ModelDriven;

@Namespace(value = "/")
@Action(value ="resumeAction", results = { @Result(name = "success", location = "/resume/resume.jsp"),
		@Result(name = "error", location = "/error/error.jsp")})
@Scope("prototype")
public class ResumeAction extends BaseAction implements ModelDriven<InternsModel> {
	/**
	 * 简历管理 Controller
	 * @author zwb
	 * @Date 2015-07-12
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(ResumeAction.class);

	@Autowired
	private ResumeServiceI resumeService;
	
	private InternsModel internsModel = new InternsModel();	
	@Override
	public InternsModel getModel() {
		return internsModel;
	}
	
	public String getInternsExp(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		Student s=(Student) session.getAttribute("student");
		internsModel.setStuid(s.getId());
		List<InternsModel> l=resumeService.getInternsExp(internsModel);
		session.removeAttribute("interns"); 		// 不remove表示覆盖内容
		session.setAttribute("interns",l);
		return "success";	
	}
	public String addInterns(){
		this.resumeService.addInterns(internsModel);		
		return getInternsExp();
	}
	public String removeIntern(){
		this.resumeService.removeIntern(internsModel);
		return getInternsExp();
	}
	public String updateInterns(){
		this.resumeService.updateInterns(internsModel);
		return getInternsExp();
	}
}