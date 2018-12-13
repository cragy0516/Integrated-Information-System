package Service;
import Dao.Database;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
	
	public List<String> getTime(String userID) throws Exception {
		List<String> timeList = new ArrayList<String>();
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String getQuery="select lectureTime from subject where lectureNumber = any(select lectureNumber from course where studentID=?)";
			ps = conn.prepareStatement(getQuery);
			ps.setString(1, userID);
			rs = ps.executeQuery();
			while( rs.next() ) {
				timeList.add(rs.getString("lectureTime"));
			}
			Pattern p = Pattern.compile("([ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]*[\\~].([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]");
			
			return timeList;
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
