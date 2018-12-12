package Service;
import Dao.Database;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class subjectService {
	public boolean isSubject(String lectureNumber) throws Exception {
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String getQuery="select lectureNumber from subject where lectureNumber=?";
			ps = conn.prepareStatement(getQuery);
			ps.setString(1, lectureNumber);
			rs = ps.executeQuery();
			return rs.isBeforeFirst();
		}
		catch(Exception e ) {
			System.out.print(e.getMessage());
		}
		finally {
			ps.close();
			rs.close();
			conn.close();
		}
		return false;
	}
}
