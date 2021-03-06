package util;

import java.io.Serializable;

/**
 *
 * @author LevenGuo
 *
 */
public class JsonResult implements Serializable{

	private static final long serialVersionUID = 1L;

	private boolean success=false;
	private String msg="";
	private Object obj=null;
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}		
}