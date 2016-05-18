package service;

import java.util.List;

import util.InternsModel;

/**
 * TODO 类/接口描述信息
 *
 * @author LevenGuo
 *
 */
public interface ResumeServiceI {
    public List<InternsModel> getInternsExp(InternsModel internsModel);
	public void addInterns(InternsModel internsModel);
	public void removeIntern(InternsModel internsModel);
	public void updateInterns(InternsModel internsModel);
}