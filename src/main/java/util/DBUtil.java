package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DBUtil {
	public Connection getConnection() throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = 
				DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3307/m1", "root", "java1234");
		return conn;
	}
}
