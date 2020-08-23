package freeBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.Util;

public class userFreeBoardDAO {
	
		private final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
		private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
		private final String USER = "jspProject";
		private final String PASS = "1111";
		
		public userFreeBoardDAO(){
			try {
				Class.forName(JDBC_Driver);
			}
			catch(Exception e) {
				System.out.println("ERRPR : JDBC 드라이버 로딩 실패");
			}
		}
		
	public int write(userFreeBoardDTO userFreeBoardDTO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		
		try {
			con = DriverManager.getConnection(JDBC_URL,USER,PASS);
			sql = "Insert into FreeBoard values(Null,?,?,?,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql); //sql문을 쓸 수 있게 준비
			pstmt.setString(1, userFreeBoardDTO.getID());
			pstmt.setString(2, userFreeBoardDTO.getTitleName());
			pstmt.setString(3, userFreeBoardDTO.getFreeContent());
			pstmt.setString(4, userFreeBoardDTO.getTotalScore());
			pstmt.setString(5, userFreeBoardDTO.getComfortableScore());
			pstmt.setString(6, userFreeBoardDTO.getProductScore());
			pstmt.setString(7, userFreeBoardDTO.getSiteScore());
			return pstmt.executeUpdate();	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			Util.close(con, pstmt, rs);
		}
		return -1;	//오류
	}
}