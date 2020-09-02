package auction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.Util;

public class winnerDAO {
	
	private static winnerDAO instance = new winnerDAO();

	public static winnerDAO getInstance() {
		return instance;
	}

	private final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "jspProject";
	private final String PASS = "1111";

	public winnerDAO() {
		try {
			Class.forName(JDBC_Driver);
		} catch (Exception e) {
			System.out.println("ERRPR : JDBC 드라이버 로딩 실패");
		}
	}

	
	
	public boolean insertArticle(winnerDTO article) throws Exception {
		
		Connection conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		boolean flag = false;
		int number = 0;

		try {
			pstmt = conn.prepareStatement("select winnerNum.nextval from dual");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			sql = "insert into winner(winnercode,auctioncode,id,betprice,zipcode,address,payinfo,paystate)";
			sql += " values(?, ?, ?, ? , ? , ? , ? , ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setInt(2, article.getAuctionCode());
			pstmt.setString(3, article.getId());
			pstmt.setInt(4, article.getBetPrice());
			pstmt.setString(5, article.getZipCode());
			pstmt.setString(6, article.getAddress());
			pstmt.setInt(7, article.getPayInfo());
			pstmt.setInt(8, article.getPayState());
			
			pstmt.executeUpdate();
			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return flag;
	}
	
	

	public static void main(String[] args) {
	

	}

}
