package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Dao.Database;

public class userService {
	public String checkOrigin(String userID) throws Exception {
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String originPW = null;
		try {
			String getQuery="select password from user where id=?";
			ps = conn.prepareStatement(getQuery);
			ps.setString(1, userID);
			rs = ps.executeQuery();
			while(rs.next()) {
				originPW = rs.getString("password");
			}
			return originPW;
		}
		catch(Exception e ) {
			System.out.print(e.getMessage());
		}
		finally {
			ps.close();
			rs.close();
			conn.close();
		}
		return null;
	}
}
