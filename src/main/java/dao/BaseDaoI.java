/**
 * Copyright Administrator 2015. All rights reserved.
 *
 * @createDate Aug 13, 2015
 */
package dao;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
/**
 * TODO 类/接口描述信息
 *
 * @author LevenGuo
 *
 */
public interface BaseDaoI<T> {
	/**
	 * 保存一个对象
	 * @param o
	 * @return
	 */
	public Serializable save(T o);
	/**
	 * 通过id得到实体类
	 * @param c
	 * @param id
	 * @return
	 */
	public T get(Class<T> c,Serializable id);
	/**
	 * 通过hql得到一个对象
	 * @param hql
	 * @return
	 */
	public T get(String hql);
	/**
	 * 通过带参hql得到一个对象
	 * @param hql
	 * @param params
	 * @return
	 */
	public T get(String hql,Map<String,Object>params);
	/**
	 * 通过hql查询
	 * @param hql
	 * @return
	 */
	public List<T> find(String hql);
	/**
	 * 通过带参hql查询
	 * @param hql
	 * @param params
	 * @return
	 */
	public List<T> find(String hql,Map<String,Object>params);
	
	/**
	 * 通过带参hql查询
	 * @param hql
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> findByMap(String hql,Map<String,Object>params);
	/**
	 * hql分页查询
	 * @param hql
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<T> find(String hql,int page,int rows);
	/**
	 * 带参hql分页查询
	 * @param hql
	 * @param params
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<T> find(String hql,Map<String,Object>params,int page,int rows);
	/**
	 * 删除一个对象
	 * @param o
	 */
	public void delete(T o);
	/**
	 * 更新一个对象
	 * @param o
	 */
	public void update(T o);
	/**
	 * 保存或者更新一个对象
	 * @param o
	 */
	public void saveOrUpdate(T o);
	/**
	 * hql统计结果数量
	 * @param hql
	 * @return
	 */
	public Long count(String hql);
	/**
	 * 带参hql统计结果数量
	 * @param hql
	 * @param params
	 * @return
	 */
	public Long count(String hql,Map<String,Object>params);
	/**
	 * 执行hql
	 * @param hql
	 * @return
	 */
	public int executeHql(String hql);
	/**
	 * 带参hql执行
	 * @param hql
	 * @return
	 */
	public int executeHql(String hql,Map<String,Object>params);
	/**
	 * 获得一个对象
	 * 
	 * @param c
	 *            对象类型
	 * @param id
	 * @return Object
	 */
	public T load(Class<T> c, Serializable id);
}

