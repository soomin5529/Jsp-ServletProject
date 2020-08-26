package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MypageDAO {
	private final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "jspProject";
	private final String PASS = "1111";
	
	//mypage 회원 정보 가져오기
	public UserDTO select(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String strQuery = null;
		UserDTO bean = null;
		try {
			con=DriverManager.getConnection(JDBC_URL,USER,PASS);
			strQuery = "select * from member where id = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean = new UserDTO();
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setAgency(rs.getString("agency"));
				bean.setTel(rs.getString("tel"));
				bean.setBirthdate(rs.getString("birthdate"));
				bean.setGender(rs.getString("gender"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			Util.close(con, pstmt, rs);
		}
		return bean;
	}
	
	//mypage 회원정보 업데이트
	public boolean updateMember(UserDTO bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false; 
		
		try {
			con=DriverManager.getConnection(JDBC_URL,USER,PASS);
			sql = "update member set pwd=?, name=?, email=?, agency=?, tel=?, birthdate=?, gender=?, zipcode=?,address=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPwd());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getAgency());
			pstmt.setString(5, bean.getTel());
			pstmt.setString(6, bean.getBirthdate());
			pstmt.setString(7, bean.getGender());
			pstmt.setString(8, bean.getZipcode());
			pstmt.setString(9, bean.getAddress());
			pstmt.setString(10, bean.getId());
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			Util.close(con, pstmt);
		}
		return flag;
	}
	
	//mypage 회원탈퇴
	public boolean deleteMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		UserDTO bean = new UserDTO();
		try {
			con=DriverManager.getConnection(JDBC_URL,USER,PASS);
			sql = "delete from member where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pwd);
			if(pstmt.executeUpdate() > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			Util.close(con, pstmt);
		}
		return flag;
	}
}
