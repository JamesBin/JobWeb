package service;

import java.util.List;

import vo.Company;
import vo.Student;
import vo.User;

/**
 * 后台管理系统接口
 * @author zwb
 *
 */
public interface BackgroundServiceI {
	
	List<User> findByUser(User user);
	
	List<Company> findAllApplyCompany();
	
	void deleteCompanyById(String id);
	
	List<Student> findAllStudent();
	
}
