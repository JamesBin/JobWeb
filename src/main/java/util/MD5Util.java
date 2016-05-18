package util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	// MD5 单向加密
	public static String afterMD5(String str) throws NoSuchAlgorithmException,
			UnsupportedEncodingException {

		// 获取MD5 加密对象,还可以获取SHA加密对象
		MessageDigest md5 = MessageDigest.getInstance("MD5");

		// 将输入的信息使用指定的编码方式获取字节
		byte[] bytes = str.getBytes("UTF-8");

		// 使用md5 类来获取摘要，也就是加密后的字节
		md5.update(bytes);

		byte[] md5encode = md5.digest();

		StringBuffer buffer = new StringBuffer();

		for (int i = 0; i < md5encode.length; i++) {
			// 使用&0xff 不足24高位，因为只占了8低位
			int val = ((int) md5encode[i]) & 0xff;
			if (val < 16) {
				buffer.append("0");
			}
			// 以十六进制（基数 16）无符号整数形式返回一个整数参数的字符串表示形式。
			buffer.append(Integer.toHexString(val));
		}
		return buffer.toString();
	}

	// 测试
	public static void main(String[] args) throws NoSuchAlgorithmException,
			UnsupportedEncodingException {
		String str = "123";
		System.out.println("原始值" + str);
		System.out.println("加密后的" + MD5Util.afterMD5(str));
		String digest = MD5Util.afterMD5(str);
		System.out.println(digest.equals(MD5Util.afterMD5(str)));
	}
}
