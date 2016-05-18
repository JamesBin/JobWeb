package service;

import java.util.List;

import util.PageModel;
import vo.Internship;

/**
 *
 * @author LevenGuo
 *
 */
public interface InternshipServiceI {
       public void saveInternship(Internship internship);
       public PageModel<Internship> getAllInternshipByCompanyId(Integer id,int pageNo,int pageSize);
       List<Internship> getAllIntern();
	   public void addInternship(Internship internship);
	   public void addResumeConnection(String internid, String stuid);
       
}