package Service;

import Dao.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class gradeservice {
	public Boolean updategrade(String target, String grade) throws Exception{
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		boolean result = false;
		try {
			String sql = "update course set grade = ? where studentID = ? and lectureNumber = '14770-01';";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, grade);
			ps.setString(2, target);
			ps.executeUpdate();
			ps.close();
			conn.close();
			result = true;
			return true;
		}
		catch(Exception e ) {
			System.out.print(e.getMessage());
			result = false;
			return false;
		}
	}
	
}
