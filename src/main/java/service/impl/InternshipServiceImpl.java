package service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BaseDaoI;
import service.InternshipServiceI;
import util.PageModel;
import vo.Internship;
import vo.Internstu;
import vo.Student;

/**
 *
 * @author LevenGuo
 *
 */
@Service("internshipService")
public class InternshipServiceImpl implements InternshipServiceI{
	@Autowired
	private BaseDaoI<Internship> baseDao;
	
	@Autowired
	private BaseDaoI<Internstu> inStuDao;
	@Override
	public void saveInternship(Internship internship) {
      this.baseDao.save(internship);
	}
	@Override
	public PageModel<Internship> getAllInternshipByCompanyId(Integer id,int pageNo,int pageSize) {		
		String totalhql="select count(*) from Internship i where i.company.id="+id;
		int totalRecords=(baseDao.count(totalhql)).intValue();
		System.out.print(totalRecords);
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("id",id);
		List<Internship> list=baseDao.find("from Internship i where i.company.id=:id",params, pageNo, pageSize);
		System.out.print(list);
		PageModel<Internship> pm=new PageModel<Internship>();
		pm.setPageNo(pageNo);
		pm.setPageSize(pageSize);
		pm.setTotalRecords(totalRecords);
		pm.setList(list);
		System.out.print(pm.getList().get(0).getSalary());
		return pm;
	}
	@Override
	public List<Internship> getAllIntern() {
		String hql="from Internship ";
		List<Internship> list=baseDao.find(hql);
		return list;
	}
	@Override
	public void addInternship(Internship internship) {
		this.baseDao.save(internship);		
	}
	@Override
	public void addResumeConnection(String internid, String stuid) {
		Internstu o=new Internstu();
		Student student=new Student();
		student.setId(Integer.valueOf(stuid));
		Internship internship=new Internship();
		internship.setId(Integer.valueOf(internid));
		o.setStudent(student);
		o.setInternship(internship);
		this.inStuDao.save(o);
		
	}
}