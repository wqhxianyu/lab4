package action;
import java.sql.*;
/**
 * 返回connection
 * @author Administrator
 *
 */
public class DaoCon {
	public Connection GetConn() throws Exception{
		//数据哭的驱动
		Class.forName("com.mysql.jdbc.Driver");
		//设置编码和URL地址还有用户名和密码
		String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_bookgtf?characterEncodeing="+"utf-8";
		String user = "l2j21kl142";
		String password = "ml1kh4yk3miymkwl125ljxhwlxj0zmwykliwhz3i";
		//建立数据库的连接
		Connection con = DriverManager.getConnection(url, user, password);
		//返回数据库的连接
		return con;
	}
}
