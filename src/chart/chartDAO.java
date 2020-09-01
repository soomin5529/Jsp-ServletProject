package chart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class chartDAO {
	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "jspProject";
	private final String PASS = "1111";
	
	public chartDAO(){
		try {
			Class.forName(JDBC_DRIVER);
		}catch(Exception e) {
		}
	}
	//1가입
	public String[] countNew() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String[] regdate = new String[12];
		try {
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select " + 
					"count(decode(substr(regdate,4,2),01,1)), " + 
					"count(decode(substr(regdate,4,2),02,1)), " + 
					"count(decode(substr(regdate,4,2),03,1)), " + 
					"count(decode(substr(regdate,4,2),04,1)), " + 
					"count(decode(substr(regdate,4,2),05,1)), " + 
					"count(decode(substr(regdate,4,2),06,1)), " + 
					"count(decode(substr(regdate,4,2),07,1)), " + 
					"count(decode(substr(regdate,4,2),08,1)), " + 
					"count(decode(substr(regdate,4,2),09,1)), " + 
					"count(decode(substr(regdate,4,2),10,1)), " + 
					"count(decode(substr(regdate,4,2),11,1)), " + 
					"count(decode(substr(regdate,4,2),12,1))  " + 
					"from member";
			  System.out.println("ddddd");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	          if(rs.next()) {
	        	  System.out.println(regdate);
	        	  regdate[0] = rs.getString(1);
	        	  regdate[1] = rs.getString(2);
	        	  regdate[2] = rs.getString(3);
	        	  regdate[3] = rs.getString(4);
	        	  regdate[4] = rs.getString(5);
	        	  regdate[5] = rs.getString(6);
	        	  regdate[6] = rs.getString(7);
	        	  regdate[7] = rs.getString(8);
	        	  regdate[8] = rs.getString(9);
	        	  regdate[9] = rs.getString(10);
	        	  regdate[10] = rs.getString(11);
	        	  regdate[11] = rs.getString(12);        	 
	          }

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Util.close(conn, pstmt, rs);
		}
		return regdate;
	}
	
	//1탈퇴
		public String[] countDelete() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			String[] deletedate = new String[12];
			try {
				conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
				sql = "select " + 
						"count(decode(substr(deletedate,4,2),01,1)), " + 
						"count(decode(substr(deletedate,4,2),02,1)), " + 
						"count(decode(substr(deletedate,4,2),03,1)), " + 
						"count(decode(substr(deletedate,4,2),04,1)), " + 
						"count(decode(substr(deletedate,4,2),05,1)), " + 
						"count(decode(substr(deletedate,4,2),06,1)), " + 
						"count(decode(substr(deletedate,4,2),07,1)), " + 
						"count(decode(substr(deletedate,4,2),08,1)), " + 
						"count(decode(substr(deletedate,4,2),09,1)), " + 
						"count(decode(substr(deletedate,4,2),10,1)), " + 
						"count(decode(substr(deletedate,4,2),11,1)), " + 
						"count(decode(substr(deletedate,4,2),12,1))  " + 
						"from deletememberlist";
				  System.out.println("ddddd");
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
		          if(rs.next()) {
		        	  System.out.println(deletedate);
		        	  deletedate[0] = rs.getString(1);
		        	  deletedate[1] = rs.getString(2);
		        	  deletedate[2] = rs.getString(3);
		        	  deletedate[3] = rs.getString(4);
		        	  deletedate[4] = rs.getString(5);
		        	  deletedate[5] = rs.getString(6);
		        	  deletedate[6] = rs.getString(7);
		        	  deletedate[7] = rs.getString(8);
		        	  deletedate[8] = rs.getString(9);
		        	  deletedate[9] = rs.getString(10);
		        	  deletedate[10] = rs.getString(11);
		        	  deletedate[11] = rs.getString(12);        	 
		          }

			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				Util.close(conn, pstmt, rs);
			}
			return deletedate;
		}
	//2
	public String[] countProduct() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String[] betprice = new String[10];
		try {
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select " + 
					  "max(decode(betcode,1,max(betprice))), " +
					  "max(decode(betcode,2,max(betprice))), " +
					  "max(decode(betcode,3,max(betprice))), " +
					  "max(decode(betcode,4,max(betprice))), " +
					  "max(decode(betcode,5,max(betprice))), " +
					  "max(decode(betcode,6,max(betprice))), " +
					  "max(decode(betcode,7,max(betprice))), " +
					  "max(decode(betcode,8,max(betprice))), " +
					  "max(decode(betcode,9,max(betprice))), " +
					  "max(decode(betcode,10,max(betprice))) " +
					  "from auctiondetail group by betcode";
			  System.out.println("ddddd");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	          if(rs.next()) {
	        	  System.out.println(betprice);
	        	  betprice[0] = rs.getString(1);
	        	  betprice[1] = rs.getString(2);
	        	  betprice[2] = rs.getString(3);
	        	  betprice[3] = rs.getString(4);
	        	  betprice[4] = rs.getString(5);
	        	  betprice[5] = rs.getString(6);
	        	  betprice[6] = rs.getString(7);
	        	  betprice[7] = rs.getString(8);
	        	  betprice[8] = rs.getString(9);
	        	  betprice[9] = rs.getString(10);       	 
	          }

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Util.close(conn, pstmt, rs);
		}
		return betprice;
	} 
	
	//3
	public String[] countMonthPlayer() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String[] betcnt = new String[12];
		try {
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select " + 
					  "Max(decode(substr(opendate,6,2),01,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),02,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),03,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),04,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),05,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),06,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),07,sum(betcnt))), " + 
					  "Max(decode(substr(opendate,6,2),08,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),09,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),10,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),11,sum(betcnt))), " +
					  "Max(decode(substr(opendate,6,2),12,sum(betcnt)))" +
					  "from auction group by substr(opendate,6,2)";
			  System.out.println("ddddd");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	          if(rs.next()) {
	        	  System.out.println(betcnt);
	        	  betcnt[0] = rs.getString(1);
	        	  betcnt[1] = rs.getString(2);
	        	  betcnt[2] = rs.getString(3);
	        	  betcnt[3] = rs.getString(4);
	        	  betcnt[4] = rs.getString(5);
	        	  betcnt[5] = rs.getString(6);
	        	  betcnt[6] = rs.getString(7);
	        	  betcnt[7] = rs.getString(8);
	        	  betcnt[8] = rs.getString(9);
	        	  betcnt[9] = rs.getString(10);
	        	  betcnt[10] = rs.getString(11);
	        	  betcnt[11] = rs.getString(12);        	 
	          }

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Util.close(conn, pstmt, rs);
		}
		return betcnt;
	}
	
	
	//4
	public String[] countCategory() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String[] category = new String[5];
		try {
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
			sql = "select " +
					  "count(decode(category,'전자제품',1)), " +
					  "count(decode(category,'휴대용품',1)), " +
					  "count(decode(category,'자동차',1)), " +
					  "count(decode(category,'화장품',1)), " +
					  "count(decode(category,'기타',1)) " +
					  "from auction ";
			  System.out.println("ddddd");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	          if(rs.next()) {
	        	  System.out.println(category);
	        	  category[0] = rs.getString(1);
	        	  category[1] = rs.getString(2);
	        	  category[2] = rs.getString(3);
	        	  category[3] = rs.getString(4);
	        	  category[4] = rs.getString(5);    	 
	          }

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Util.close(conn, pstmt, rs);
		}
		return category;
	}
}
