package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;


public class MypageDAO {
	private final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "jspProject";
	private final String PASS = "1111";
	
	public MypageDAO(){
		try {
			Class.forName(JDBC_Driver);
		}
		catch(Exception e) {
			System.out.println("ERRPR : JDBC ERROR");
		}
	}
	
	//mypage ȸ�� ���� ��������
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
				bean.setUserEmailChecked(rs.getBoolean("userEmailChecked"));
				bean.setAuthor(rs.getInt("author"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			Util.close(con, pstmt, rs);
		}
		return bean;
	}
	
	//mypage ȸ������ ������Ʈ
	public boolean updateMember(UserDTO bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false; 
		
		try {
			con=DriverManager.getConnection(JDBC_URL,USER,PASS);
			if(bean.getPwd() == null || bean.getPwd().equals("")) {
				sql = "update member set name=?, email=?, agency=?, tel=?, birthdate=?, gender=?, zipcode=?,address=? where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getName());
				pstmt.setString(2, bean.getEmail());
				pstmt.setString(3, bean.getAgency());
				pstmt.setString(4, bean.getTel());
				pstmt.setString(5, bean.getBirthdate());
				pstmt.setString(6, bean.getGender());
				pstmt.setString(7, bean.getZipcode());
				pstmt.setString(8, bean.getAddress());
				pstmt.setString(9, bean.getId());
			}else{
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
			}
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			Util.close(con, pstmt);
		}
		return flag;
	}
	
	//mypage ȸ��Ż��
	@SuppressWarnings("resource")
	public boolean deleteMember(String id, String pwd, String name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String sql2 = null;
		int result = 0;
		boolean flag = false;
		try {
			con=DriverManager.getConnection(JDBC_URL,USER,PASS);
			sql = "insert into deleteMemberList(deleteMemberCode, deleteID, deleteName, deleteDate) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, id);
			pstmt.setString(3, name);
			pstmt.setTimestamp(4, getDate());
			result = pstmt.executeUpdate();
			result=1;
			if(result == 1) {
				 sql2 = "delete from member where id = ? and pwd = ?";
				pstmt = con.prepareStatement(sql2);	
				pstmt.setString(1, id);
				pstmt.setString(2, pwd);
				if(pstmt.executeUpdate() > 0)
					flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			Util.close(con, pstmt);
		}
		return flag;
	}

	public int getNext() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select deleteMemberCode from deleteMemberList order by deleteMemberCode desc";
		try {
			con=DriverManager.getConnection(JDBC_URL,USER,PASS);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 게시물인 경우
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	//현재의 시간을 가져오는 함수
	public Timestamp getDate() throws Exception { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT sysdate from dual";
		
		try {
			con=DriverManager.getConnection(JDBC_URL,USER,PASS);
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getTimestamp(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;  //데이터베이스 오류
	}
}