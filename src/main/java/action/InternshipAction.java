package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import service.InternshipServiceI;
import util.PageModel;
import vo.Internship;

import com.opensymphony.xwork2.ModelDriven;

/**
 * 实习信息  Controller
 * @author LevenGuo
 * 
 */
@Namespace(value = "/")
@Action(value = "internshipAction", results = { @Result(name = "success", location = "/company/interns.jsp"),
		@Result(name = "findJob", location = "/company/findJob.jsp"),
		@Result(name = "pushJob", location = "/company/pushJob.jsp")})

@Scope("prototype")
public class InternshipAction extends BaseAction implements
		ModelDriven<Internship> ,ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(InternshipAction.class);
	
	@Autowired
	private InternshipServiceI internshipService;
	
	private Internship internship = new Internship();
	private String id;
	private HttpServletRequest request;


	@Override
	public Internship getModel() {
		return internship;
	}

	public String saveInternship() throws Exception {
		internshipService.saveInternship(internship);
		return "success";
	}

	public String getAllInternshipByCompanyId() {
		PageModel<Internship> internLists = internshipService.getAllInternshipByCompanyId(1, 1,10);
		request.setAttribute("internLists", internLists.getList());
		return "pushJob";
	}
	
	public String findAllIntern () {
		List<Internship> interns  = internshipService.getAllIntern();
		request.setAttribute("interns", interns);
		return "findJob";
	}
	
	public String addInternship(){
		this.internshipService.addInternship(internship);
		return getAllInternshipByCompanyId();
	}

	public void addResumeConnection(){
		String internid=request.getParameter("internid");
		String stuid=request.getParameter("stuid");
		System.out.print(internid);
		internshipService.addResumeConnection(internid,stuid);
	}
	
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}