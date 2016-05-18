package service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BaseDaoI;
import service.ResumeServiceI;
import util.InternsModel;
import vo.Interns;
import vo.Student;

/**
 * TODO 类/接口描述信息
 *
 * @author LevenGuo
 *
 */
@Service("resumeService")
public class ResumeServiceImpl implements ResumeServiceI{
	@Autowired
	private BaseDaoI<Interns> baseDao;
	public List<InternsModel> getInternsExp(InternsModel internsModel){
		String hql  = "from Interns i where i.student.id=:stuid";
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("stuid",(Integer)internsModel.getStuid());
		List<Interns> l=baseDao.find(hql,params);
		List<InternsModel> ls= new ArrayList<InternsModel>();
		for(Interns i:l){
			InternsModel im=new InternsModel();
			im.setStuid(i.getStudent().getId());
			BeanUtils.copyProperties(i,im);
			ls.add(im);
		}
		return ls;		
	}
	@Override
	public void addInterns(InternsModel internsModel) {
		Interns i=new Interns();
		BeanUtils.copyProperties(internsModel,i,new String[] {"id","student"});
		Student s=new Student();
		s.setId(internsModel.getStuid());
		i.setStudent(s);
		baseDao.save(i);		
	}
	@Override
	public void removeIntern(InternsModel internsModel) {
		String hql="delete Interns i where i.id=:id";
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("id",internsModel.getId());
	    baseDao.executeHql(hql, params);	
	}
	@Override
	public void updateInterns(InternsModel internsModel) {
		Interns i=baseDao.get(Interns.class,internsModel.getId());
		BeanUtils.copyProperties(internsModel,i,new String[] {"id","student"});
		baseDao.update(i);
	}
}