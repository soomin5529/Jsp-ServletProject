package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class listDAO {
	private final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "jspProject";
	private final String PASS = "1111";
	
	public listDAO(){
		try {
			Class.forName(JDBC_Driver);
		}
		catch(Exception e) {
			System.out.println("ERRPR : JDBC ����̹� �ε� ����");
		}
	}
	
	private static listDAO instance = new listDAO();
	public static listDAO getInstance() {
		return instance;
	}
	
	//�Խñ� ���� ī��Ʈ
	public int getArticleCount(String boardid, String category, String sentence) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = DriverManager.getConnection(JDBC_URL,USER,PASS);
		int x = 0;
		String sql = "";
		try {
			if (category == null || category.equals("")) {
				sql = "select nvl(count(*),0) from member";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select nvl(count(*),0) from member where " + category + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + sentence + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(con, pstmt, rs);
		}
		return x;
	}

	//�������Ʈ ��������
	public List memberList(int start, int end, String boardid, String category, String sentence) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		Connection con = DriverManager.getConnection(JDBC_URL,USER,PASS);
		try {
			if (category == null || category.equals("")) {
				sql = "select * from (select rownum rnum, a.* from (select * from member) a) where rnum between ? and ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from (select rownum rnum, a.* from (select * from member where " + category + " like ?) a) where rnum between ? and ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + sentence + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList(end);
				do {
					UserDTO article = new UserDTO();
					article.setId(rs.getString("id"));
					article.setName(rs.getString("name"));
					article.setEmail(rs.getString("email"));
					article.setTel(rs.getString("tel"));
					article.setBirthdate(rs.getString("birthdate"));
					article.setGender(rs.getString("gender"));
					article.setZipcode(rs.getString("zipcode"));
					article.setAddress(rs.getString("address"));
					article.setUserEmailChecked(rs.getBoolean("userEmailChecked"));
					article.setAuthor(rs.getInt("author"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(con, pstmt, rs);
		}

		return articleList;
	}
}
