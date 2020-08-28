package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import user.Util;


public class UserDAO {
	
	private final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "jspProject";
	private final String PASS = "1111";
	
	public UserDAO(){
		try {
			Class.forName(JDBC_Driver);
		}
		catch(Exception e) {
			System.out.println("ERRPR : JDBC ����̹� �ε� ����");
		}
	}
	
	//ID �ߺ�Ȯ��
		public boolean checkId(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			boolean flag = false;
			
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "select id from MEMBER where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				flag = pstmt.executeQuery().next();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt);
			}
			return flag;
		}
		
		
		//�α���
		public int loginUser(String id, String pwd) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			
			
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "select pwd from MEMBER where id = ?";
				pstmt = con.prepareStatement(sql); //sql���� �� �� �ְ� �غ�
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();	//db���� ����� ���� rs�� ����ش�
				
				if(rs.next()) {
					if(rs.getString(1).equals(pwd)) {
						return 1;	//�α��� ����
					}
					else {
						return 0;	//��й�ȣ Ʋ��
					}
				}
				return -1; //���̵� ����
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt, rs);
			}
			return -2;	//����
		}
		
		//���̵� ã��
		public String findId(String name, String tel, String email) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String id = null;
			String sql = null;
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "select id from MEMBER where name = ? and tel = ? and email = ?";
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, name);
				pstmt.setString(2, tel);
				pstmt.setString(3, email);
				rs = pstmt.executeQuery();	
				 while(rs.next()){
					    id = rs.getString("id");
					   }
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt, rs);
			}
			return id;
		}
		
		//��й�ȣ ã��
		public String findPwd(String id, String name, String email, String tel) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String pwd = null;
			String sql = null;
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "select pwd from MEMBER where id = ? and name = ? and email = ? and tel = ?";
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, email);
				pstmt.setString(4, tel);
				
				rs = pstmt.executeQuery();	
				 while(rs.next()){
					    pwd = rs.getString("pwd");
					   }
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt, rs);
			}
			return pwd;
		}
		
		//�̸� ��������
		public String findName(String id, String pwd) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String name = null;
			String sql = null;
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "select name from MEMBER where id=? and pwd=?";
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1,id);
				pstmt.setString(2,pwd);
				rs = pstmt.executeQuery();	
				 while(rs.next()){
					    name= rs.getString("name");
					   }
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt, rs);
			}
			return name; //�����ͺ��̽� ����
		}
		
		//현재의 시간을 가져오는 함수
		public Timestamp getDate() throws Exception { 
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "SELECT sysdate from dual";

			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
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
		
		//ȸ������
		public int join(String id, String pwd, String name, String email, String agency, String tel, String birthdate, String gender, String zipcode, String address,
				String userEmailHash, boolean userEmailChecked, int author){
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				String strQuery = "insert into MEMBER(id, pwd, name, email, agency, tel, birthdate, gender, zipcode, address, userEmailHash, userEmailChecked, author, regDate) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(strQuery);

				pstmt.setString(1, id);
				pstmt.setString(2, pwd);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.setString(5, agency);
				pstmt.setString(6, tel);
				pstmt.setString(7, birthdate);
				pstmt.setString(8, gender);
				pstmt.setString(9, zipcode);
				pstmt.setString(10, address);
				pstmt.setString(11, userEmailHash);
				pstmt.setBoolean(12, userEmailChecked);
				pstmt.setInt(13, author);
				pstmt.setTimestamp(14, getDate());

				return pstmt.executeUpdate();
			}
			catch(Exception ex) {
				ex.printStackTrace();
			}
			return -1;
		}
		//Ư��ȸ���� �̸��� ��ü�� ��ȯ�ϴ� �Լ�
		public String getUserEmail(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "select email from MEMBER where id=?";
				pstmt = con.prepareStatement(sql); //sql���� �� �� �ְ� �غ�
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();	//db���� ����� ���� rs�� ����ش�
				
				while(rs.next()) {
					return rs.getString(1);	//�̸��� �ּ� ��ȯ
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt, rs);
			}
			return null; //�����ͺ��̽� ����
		}

		//�̸��� ������ �Ǿ����� Ȯ��
		public boolean getUserEmailChecked(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "select userEmailChecked from MEMBER where id=?";
				pstmt = con.prepareStatement(sql); //sql���� �� �� �ְ� �غ�
				pstmt.setString(1, id);

				rs = pstmt.executeQuery();	//db���� ����� ���� rs�� ����ش�
				
				while(rs.next()) {
					return rs.getBoolean(1);	//�̸��� ��� ���� ��ȯ
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt, rs);
			}
			return false; //�����ͺ��̽� ����
		}
		
		//�̸��� �Ϸ��Ű�� �Լ�
		public boolean setUserEmailChecked(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "update MEMBER set userEmailChecked = 1 where id=?";
				pstmt = con.prepareStatement(sql); //sql���� �� �� �ְ� �غ�
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				return true;	//�̸��� ��� ���� ����
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt);
			}
			return false; //�̸��� ��� ���� ����
		}
		
		
		public int checkAuthor(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "select author from MEMBER where id = ?";
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();	
				
				if(rs.next()) {
					if(rs.getInt(1)==1) {
						return 1;	
					}
					else {
						return 0;	
					}
				}
				return -1; 
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt, rs);
			}
			return -2;	
		}
		//경매에 당첨된 회원의 이메일을 가져오기 
		public String getWinnerEmail(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			
			try {
				con = DriverManager.getConnection(JDBC_URL,USER,PASS);
				sql = "select email from MEMBER where= id?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();	
				
				while(rs.next()) {
					return rs.getString(1);	
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				Util.close(con, pstmt, rs);
			}
			return null; 
		}
}
