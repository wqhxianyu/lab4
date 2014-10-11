package action;

import java.sql.Connection;
import java.sql.Statement;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DetelBook extends ActionSupport{
	private String title;
	private int i =0;
	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 删除书
	 */
	public void DetBook() throws Exception {
		DaoCon dao = new DaoCon();
		Connection con = dao.GetConn();
		Statement stmt = con.createStatement() ;
		String sql = "delete from book where title = '"+title+"'";
		stmt.executeUpdate(sql) ;
		setI(9);
		stmt.close();
        con.close();
	}
	public String execute(){
		try {
			DetBook();
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return "success";
	}
}
