/**
 * Copyright Administrator 2015. All rights reserved.
 *
 * @createDate Jul 18, 2015
 */
package service;

import java.util.List;

import vo.Company;
import vo.Student;
import vo.User;

/**
 * TODO 类/接口描述信息
 *
 * @author LevenGuo
 *
 */
public interface UserServiceI {
    public void test();
	   
		/**
		 * 用户注册
		 * @param user
		 */
		public void saveUser(User user);
		
		/**
		 * 预先在student表/company表存储实体
		 * @param user
		 */
		public void preSaveUserInfo(User user);
		
		/**
		 * 用户登录
		 * @param user
		 * @return
		 */
		public List<User>  findUser (User user);
		
		/**
		 * 检验用户名是否存在
		 * @param username
		 * @return
		 */
		public boolean isUserExist(String username);
		
		/**
		 * 更新
		 * @param student
		 */
		public void updateStudentInfo(Student student);
		
		/**
		 * 找StudentInfo
		 * @param username
		 * @return
		 */
		public List<Student> findStudentInfo(String username);
		
		/**
		 * 找CompanyInfo
		 * @param username
		 * @return
		 */
		public List<Company> findCompanyInfo(String username);
		
		/**
		 * 更新公司拟信息
		 * @param company
		 */
		public void updateCompanyInfo(Company company);
}

