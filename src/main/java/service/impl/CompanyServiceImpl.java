
package service.impl;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BaseDaoI;
import service.CompanyServiceI;
import util.MD5Util;
import vo.Company;

/**
 *
 * @author LevenGuo
 *
 */
@Service("companyService")
public class CompanyServiceImpl implements CompanyServiceI{
	@Autowired
    private BaseDaoI<Company> baseDao;
	@Override
	public void saveUser(Company company) {
	       this.baseDao.save(company);
	}
	@Override
	public Company findCompany(Company company) {
		String hql  = "from Company c where c.companyName=:companyName and c.password=:password";
		Map<String,Object> params = new HashedMap();
		try {
			params.put("companyName", company.getCompanyName());
			params.put("password", MD5Util.afterMD5(company.getCompanyName()));
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Company> ls=baseDao.find(hql,params);
		if(ls.size()>0){
			return ls.get(0);
		}
		return null;		
	}
	@Override
	public boolean findIsExistCompany(String companyName) {
		String hql = "from Company c where c.companyName=:companyName";
		Map<String, Object> params = new HashedMap();
		params.put("companyName",companyName);
		if(baseDao.find(hql,params).size() > 0) {
			return true;
		}
		return false;
	}
}

