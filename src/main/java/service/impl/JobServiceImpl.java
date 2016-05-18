package service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.stereotype.Service;

import dao.BaseDaoI;
import service.JobServiceI;
import util.JsoupUtil;

/**
 * @author zwb
 * @Info job业务逻辑处理层
 * @param <T>
 */

@Service(value = "jobService")
public class JobServiceImpl<T> implements JobServiceI {

	@Resource
	private BaseDaoI<T> baseDao;

	@Override
	public List<Object> searchInfoByLucene(String searchInfo)
			throws CorruptIndexException, IOException {

		// 搜索的索引路径
		String index = "D:\\index";
		IndexReader reader = IndexReader
				.open(FSDirectory.open(new File(index)));
		IndexSearcher searcher = new IndexSearcher(reader);

		// 存储返回的Result
		List<Object> listResult = new ArrayList<Object>();
		ScoreDoc[] hits = null;

		// 搜索的关键词
		String queryString = searchInfo;
		Query query = null;
		Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_35);

		try {
			QueryParser qp = new QueryParser(Version.LUCENE_35, "body",
					analyzer);
			query = (Query) qp.parse(queryString);
		} catch (ParseException e) {
		}

		if (searcher != null) {
			// 返回最多为10条记录
			TopDocs results = searcher.search(
					(org.apache.lucene.search.Query) query, 10);
			hits = results.scoreDocs;
			if (hits.length > 0) {
				System.out.println("找到:" + hits.length + " 个结果!");
			}

			// 将检索到的内容输出
			for (int i = 0; i < hits.length; i++) {
				Document hitDoc = searcher.doc(hits[i].doc);
				String text = hitDoc.get("body");
				System.out.println(text);
				QueryScorer scorer = new QueryScorer(
						(org.apache.lucene.search.Query) query);

				// 创建高亮显示模板
				SimpleHTMLFormatter formatter = new SimpleHTMLFormatter(
						"<font color='#f4645f' style='font-weight: bold'>",
						"</font>");

				// 构造高亮对象
				Highlighter hig = new Highlighter(formatter, scorer);

				try {
					String highLightText = hig.getBestFragment(analyzer,
							"body", text);

					// 如果没有检索到高亮的词
					if (highLightText == null) {
						return listResult;
					}
					listResult.add("<li><a href='#'>"
							+ highLightText + "</a></li>");

				} catch (InvalidTokenOffsetsException e1) {
					e1.printStackTrace();
				}
			}
			reader.close();
			searcher.close();
		}
		return listResult;
	}

	@Override
	public void createIndexesByLucene(String searchInfo) throws Exception {
//		File file  = new File("D:\\lucene");
//		if(file.isDirectory()) {
//			File[] files = file.listFiles();
//			for (File oldfile : files) {
//				  oldfile.delete();
//	           }
//		}
		
		
		//将Jsoup爬取的信息存在txt文档中，便于Lucene检索
//		List<String> lists = JsoupUtil.jsoupSearch(searchInfo);
//		for(String info : lists) {
//			File searchContent  = new File("D:\\lucene\\"+new Date().getTime()+".txt");
//			searchContent.createNewFile();
//			FileOutputStream out=new FileOutputStream(searchContent,true);  
//			out.write(info.getBytes("utf-8"));
//			out.close();
//		}
		
		// 指明要索引文件夹的位置，存放txt文件
		File fileDir = new File("D:\\lucene");

		// 这里放索引文件的位置 ，存放索引
		File indexDir = new File("D:\\index");
		
		Directory dir = FSDirectory.open(indexDir);
		
		Analyzer luceneAnalyzer = new StandardAnalyzer(Version.LUCENE_35);
		
		IndexWriterConfig iwc = new IndexWriterConfig(Version.LUCENE_35,
				luceneAnalyzer);
		
		iwc.setOpenMode(OpenMode.CREATE);
		
		IndexWriter indexWriter = new IndexWriter(dir, iwc);
		
		File[] textFiles = fileDir.listFiles();
		
		long startTime = new Date().getTime();

		// 增加document（txt文档）到索引去
		for (int i = 0; i < textFiles.length; i++) {
			if (textFiles[i].isFile()
					&& textFiles[i].getName().endsWith(".txt")) {
				System.out.println("File " + textFiles[i].getCanonicalPath()
						+ "正在被索引....");
				String temp = FileReaderAll(textFiles[i].getCanonicalPath(),
						"UTF-8");
				System.out.println(temp);
				Document document = new Document();
				Field FieldPath = new Field("path", textFiles[i].getPath(),
						Field.Store.YES, Field.Index.NO);
				Field FieldBody = new Field("body", temp, Field.Store.YES,
						Field.Index.ANALYZED,
						Field.TermVector.WITH_POSITIONS_OFFSETS);
				document.add(FieldPath);
				document.add(FieldBody);
				indexWriter.addDocument(document);
			}
		}

		// 在这里必须要关闭，否则会出现异常，例如数据没有写入完整
		indexWriter.close();

		// 测试一下索引的时间
		long endTime = new Date().getTime();
		System.out.println("这花费了" + (endTime - startTime) + " 毫秒来把文档增加到索引里面去，"
				+ "索引存放的位置在：" + fileDir.getPath());
	}

	public static String FileReaderAll(String FileName, String charset)
			throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				new FileInputStream(FileName), charset));
		String line = new String();
		String temp = new String();

		while ((line = reader.readLine()) != null) {
			temp += line;
		}
		reader.close();
		return temp;
	}
}
