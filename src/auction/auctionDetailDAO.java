package auction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.Util;

public class auctionDetailDAO {
	
		private static auctionDetailDAO instance = new auctionDetailDAO();

		public static auctionDetailDAO getInstance() {
			return instance;
		}

		private final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
		private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
		private final String USER = "jspProject";
		private final String PASS = "1111";

		public auctionDetailDAO() {
			try {
				Class.forName(JDBC_Driver);
			} catch (Exception e) {
				System.out.println("ERRPR : JDBC 드라이버 로딩 실패");
			}
		}

		public boolean insertArticle(auctionDetailDTO article) throws Exception {
			Connection conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			PreparedStatement pstmt = null;
			String sql = "";
			ResultSet rs = null;
			boolean flag = false;
			int number = 0;

			try {
				pstmt = conn.prepareStatement("select betNum.nextval from dual");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					number = rs.getInt(1) + 1;
				} else {
					number = 1;
				}
				sql = "insert into auctionDetail(betCode,auctionCode,id,betdate,betprice)";
				sql += " values(?, ?, ?, sysdate , ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, number);
				pstmt.setInt(2, article.getAuctionCode());
				pstmt.setString(3, article.getId());
				pstmt.setInt(4, article.getBetPrice());
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
