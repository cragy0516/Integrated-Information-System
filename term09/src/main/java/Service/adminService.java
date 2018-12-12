package Service;
import Dao.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class adminService {
	public void addStudentInfo(String id, String department,String degree) throws Exception {
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		try {
			String joinQuery = "insert into studentInfo (id,department,degree) values (?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(joinQuery);
			ps.setString(1,id);
			ps.setString(2, department);
			ps.setString(3, degree);
			ps.executeUpdate();
			
			ps.close();
			conn.close();
		}
		catch(Exception e ) {
			System.out.println(e.getMessage());
		}
	}
	public void addFacultyInfo(String id, String department) throws Exception {
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		try {
			String joinQuery = "insert into facultyInfo (id,department) values (?,?)";
			
			PreparedStatement ps = conn.prepareStatement(joinQuery);
			ps.setString(1,id);
			ps.setString(2, department);
			ps.executeUpdate();
			
			ps.close();
			conn.close();
		}
		catch(Exception e ) {
			System.out.println(e.getMessage());
		}
	}
	
	public boolean addUser(String name, String id, String password, String sex, String phone,
			String birth, String address, String email, String permission, String department, String degree ) throws Exception {
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		int int_permission = Integer.parseInt(permission);
		boolean addResult = false;
		try {
			String joinQuery = "insert into user (id,password,name,sex,phone,birth,address,email,permission) values (?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(joinQuery);
			ps.setString(1,id);
			ps.setString(2, password);
			ps.setString(3, name);
			ps.setString(4, sex);
			ps.setString(5, phone);
			ps.setString(6, birth);
			ps.setString(7, address);
			ps.setString(8, email);
			ps.setInt(9, int_permission);
			ps.executeUpdate();
			
			ps.close();
			conn.close();
			addResult = true;
		}
		catch(Exception e ) {
			System.out.println(e.getMessage());
			addResult = false;
		}
		
		if(degree != null && degree != "") {
			addStudentInfo(id, department, degree);
		}
		else {
			addFacultyInfo(id, department);
		}
		return addResult;
	}
}
