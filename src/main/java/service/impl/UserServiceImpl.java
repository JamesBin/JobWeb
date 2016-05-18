/**
 * Copyright Administrator 2015. All rights reserved.
 *
 * @createDate Jul 18, 2015
 */
package service.impl;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BaseDaoI;
import service.UserServiceI;
import util.MD5Util;
import vo.Company;
import vo.Student;
import vo.User;

/**
 * TODO 类/接口描述信息
 * 
 * @author LevenGuo
 * 
 */
@Service(value = "userService")
@SuppressWarnings("all")
public class UserServiceImpl implements UserServiceI {
	@Resource
	private BaseDaoI<User> baseDao;

	@Resource
	private BaseDaoI<Student> stuBaseDao;
	
	@Resource
	private BaseDaoI<Company> comBaseDao;
	
	@Override
	public void test() {
		System.out.print("testSpring");
	}

	@Override
	public void saveUser(User user) {
		try {
			user.setPassword(MD5Util.afterMD5(user.getPassword()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		this.baseDao.save(user);
	}

	@Override
	public List<User> findUser(User user) {
		String hql = "from User where username=:username and password =:password";
		Map<String, Object> params = new HashedMap();
		try {
			params.put("username", user.getUsername());
			params.put("password", MD5Util.afterMD5(user.getPassword()));
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return baseDao.find(hql, params);
	}

	@Override
	public boolean isUserExist(String username) {
		String hql = "from User where username=:username";
		Map<String, Object> params = new HashedMap();
		params.put("username", username);
		if (baseDao.find(hql, params).size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void preSaveUserInfo(User user) {
		if(user.getRole().getId() == 1) {
			Student student = new Student(user.getUsername());
			this.stuBaseDao.save(student);
		}else {
			Company company = new Company(user.getUsername());
			company.setStatus(0);
			this.comBaseDao.save(company);
		}
	}

	@Override
	public void updateStudentInfo(Student student) {
		this.stuBaseDao.update(student);
	}

	@Override
	public List<Student> findStudentInfo(String username) {
		String hql = "from Student where username=:username";
		Map<String, Object> params = new HashedMap();
		params.put("username", username);
		return stuBaseDao.find(hql, params);
	}
	@Override
	public List<Company> findCompanyInfo(String username) {
		String hql = "from Company where username=:username";
		Map<String, Object> params = new HashedMap();
		params.put("username", username);
		return comBaseDao.find(hql, params);
	}
	@Override
	public void updateCompanyInfo(Company company) {
		this.comBaseDao.update(company);
	}
}
