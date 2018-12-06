package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 public class Database {
	/* Mysql DB Connection */
	public Connection GetConnection() throws Exception {
		try{
			String connectionURL = "jdbc:mysql://35.194.107.11:3306/se?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
			Connection connection = null;
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", "1q2w3e4r");
			return connection;
			}
		catch (SQLException e) {
			throw e;	
		}
		catch (Exception e) {
			throw e;	
		}
	}
}