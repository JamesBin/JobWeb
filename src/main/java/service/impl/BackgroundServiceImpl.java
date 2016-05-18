package service.impl;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import dao.BaseDaoI;
import service.BackgroundServiceI;
import util.MD5Util;
import vo.Company;
import vo.Student;
import vo.User;

@Service("backgroundService")
public class BackgroundServiceImpl implements BackgroundServiceI{

	@Resource
	private BaseDaoI<User> userDao;
	
	@Resource
	private BaseDaoI<Company> companyDao;
	
	@Resource
	private BaseDaoI<Student> stuDao;

	@Override
	public List<User> findByUser(User user) {
		String hql = "from User where username=:username and password =:password";
		Map<String, Object> params = new HashedMap();
		try {
			params.put("username", user.getUsername());
			params.put("password", MD5Util.afterMD5(user.getPassword()));
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return userDao.find(hql, params);
	}

	@Override
	public List<Company> findAllApplyCompany() {
		String hql = "from Company where status=0";
		return companyDao.find(hql);
	}

	@Override
	public void deleteCompanyById(String id) {
		 Company company = new Company();
		 company.setId(Integer.parseInt(id));
		 this.companyDao.delete(company);
	}

	@Override
	public List<Student> findAllStudent() {
		String hql = "from Student";
		return stuDao.find(hql);
	}
	
}
