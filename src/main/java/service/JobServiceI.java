package service;

import java.io.IOException;
import java.util.List;

import org.apache.lucene.index.CorruptIndexException;

/**
 * TODO 类 job相关信息接口
 * 
 * @author zwb
 * 
 */
public interface JobServiceI {
	/**
	 * Lucene全文检索相关信息
	 * 
	 * @param searchInfo
	 * @return
	 * @throws CorruptIndexException
	 * @throws IOException
	 */
	public List<Object> searchInfoByLucene(String searchInfo)
			throws CorruptIndexException, IOException;

	/**
	 * Lucene建立索引
	 * 
	 * @throws Exception
	 */
	public void createIndexesByLucene(String searchInfo) throws Exception;
}
