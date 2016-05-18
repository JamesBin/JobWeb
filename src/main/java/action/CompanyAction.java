package action;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import service.CompanyServiceI;
import util.JsonResult;
import vo.Company;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

/**
 *
 * @author LevenGuo
 *
 */
@Namespace(value = "/")
@Action(value = "companyAction",results={@Result(name="success",location="/company/indexCompany.jsp")})
@Scope("prototype")
public class CompanyAction extends BaseAction implements ModelDriven<Company>{
	
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(CompanyAction.class);
	@Autowired
    private CompanyServiceI compamyService;
	private Company company=new Company();
	@Override
	public Company getModel() {
		return company;
	}
	public String saveCompany() throws NoSuchAlgorithmException, UnsupportedEncodingException{
//		((Object) company).setPassword(MD5Util.afterMD5(company.getCompanyName()));
		this.compamyService.saveUser(company);
		return "success";
	}
	public String login() throws NoSuchAlgorithmException, UnsupportedEncodingException {
		Map<String, Object> session =(Map<String, Object>) ActionContext.getContext().getSession();
		Company com= compamyService.findCompany(company);
		session.put("company",com);
		return SUCCESS;
	}
	public String logout() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
//		session.remove(company);
		session.clear();
		return SUCCESS;
	}
	public void findIsExistCompany(){
		JsonResult r=new JsonResult();
		if(compamyService.findIsExistCompany(company.getCompanyName())){			
			r.setSuccess(true);		 //存在
		}else{ 
			r.setSuccess(false);	 //不存在
		}
		super.writeJson(r);
	}
}