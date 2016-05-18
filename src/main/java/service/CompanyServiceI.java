package service;

import vo.Company;

/**
 *
 * @author LevenGuo
 *
 */
public interface CompanyServiceI {
	   public void saveUser(Company company);
	   public Company findCompany(Company company);
	   public boolean findIsExistCompany(String companyName);
}