package action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class GetBook extends ActionSupport{
	
	private String author;
	private String[] bookname = null;
	private int num=0;
	private int authorid =0;
	public String[] getBookname() {
		return bookname;
	}
	public void setBookname(String[] bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getAuthorid() {
		return authorid;
	}
	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}
	/**
	 * 查询作者id
	 * @throws Exception
	 */
	public void GetID() throws Exception{
		DaoCon dao = new DaoCon();
		Connection con = dao.GetConn();
		Statement stmt = con.createStatement() ;
		String sql = "select * from author where name = '"+author+"'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			authorid  = rs.getInt("authorid");
		}
		rs.close();
		stmt.close();
        con.close();
	}
	/**
	 * 查询
	 * @throws Exception
	 */
	public void QueryBook() throws Exception {
		DaoCon dao = new DaoCon();
		Connection con = dao.GetConn();
		Statement stmt = con.createStatement() ;
		 String sql = "select * from book where authorid = "+authorid;
		ResultSet rs = stmt.executeQuery(sql);
		int totalRows = 0;
		if (rs.last()){			//查询一共有多少个
            totalRows=rs.getRow();
        }
		bookname = new String[totalRows];
		rs.beforeFirst();
		while(rs.next()){
			bookname[num++] = rs.getString("title");
		}
		rs.close();
		stmt.close();
        con.close();
	}
	public String execute(){
			try {
				GetID();
				QueryBook();
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(num == 0){
				return "failure";
			}else{
		return "success";
		}
	}
}
