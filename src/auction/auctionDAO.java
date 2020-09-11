package auction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import user.UserDTO;
import user.Util;

public class auctionDAO {
	private static auctionDAO instance = new auctionDAO();

	public static auctionDAO getInstance() {
		return instance;
	}

	private final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "jspProject";
	private final String PASS = "1111";

	public auctionDAO() {
		try {
			Class.forName(JDBC_Driver);
		} catch (Exception e) {
			System.out.println("ERRPR : JDBC 드라이버 로딩 실패");
		}
	}

	public boolean insertArticle(auctionDTO article) throws Exception {
		Connection conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		boolean flag = false;
		int number = 0;

		try {
			pstmt = conn.prepareStatement("select codeNum.nextval from dual");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			sql = "insert into auction(auctionCode,product,detail,filename,minPrice,category,openDate,closeDate, realProduct)";
			sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, article.getProduct());
			pstmt.setString(3, article.getDetail());
			pstmt.setString(4, article.getFilename());
			pstmt.setInt(5, article.getMinPrice());
			pstmt.setString(6, article.getCategory());
			pstmt.setString(7, article.getOpenDate());
			pstmt.setString(8, article.getCloseDate());
			pstmt.setString(9, article.getRealProduct());
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

	public ArrayList<auctionDTO> getArticles() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		ArrayList<auctionDTO> articleList = new ArrayList<auctionDTO>();
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("select * from auction");	
			rs = pstmt.executeQuery();

			while (rs.next()) {

				auctionDTO article = new auctionDTO();
				article.setAuctionCode(rs.getInt("auctioncode"));
				article.setProduct(rs.getString("product"));
				article.setMinPrice(rs.getInt("minprice"));
				article.setCategory(rs.getString("category"));
				article.setOpenDate(rs.getString("opendate"));
				article.setCloseDate(rs.getString("closedate"));
				article.setBetCnt(rs.getInt("betcnt"));
				articleList.add(article);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);

		}
		return articleList;
	}
	
	public ArrayList<auctionDTO> getAllArticles(int auctioncode) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		ArrayList<auctionDTO> articleList = new ArrayList<auctionDTO>();
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("select * from auction where auctioncode = ?");
			pstmt.setInt(1, auctioncode);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				auctionDTO article = new auctionDTO();
				article.setAuctionCode(rs.getInt("auctioncode"));
				article.setProduct(rs.getString("product"));
				article.setDetail(rs.getString("detail"));
				article.setFilename(rs.getString("fileName"));
				article.setMinPrice(rs.getInt("minprice"));
				article.setCategory(rs.getString("category"));
				article.setOpenDate(rs.getString("opendate"));
				article.setCloseDate(rs.getString("closedate"));
				article.setBetCnt(rs.getInt("betcnt"));
				article.setRealProduct(rs.getString("realProduct"));
				articleList.add(article);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);

		}
		return articleList;
	}
	
	public int getBetCnt(int auctioncode, int betCnt) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		betCnt = betCnt + 1;
		boolean flag = false;
		ArrayList<auctionDTO> articleList = new ArrayList<auctionDTO>();
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("update auction set betCnt = ? where auctioncode = ?");
			pstmt.setInt(1, betCnt);
			pstmt.setInt(2, auctioncode);
			rs = pstmt.executeQuery();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);

		}
		return betCnt;
	}
	
	public int getArticleCount(String boardid, String category, String sentence) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = DriverManager.getConnection(JDBC_URL,USER,PASS);
		int x = 0;
		String sql = "";
		try {
			if (category == null || category.equals("")) {
				if(boardid.equals("memberList")) {
					sql = "select nvl(count(*),0) from member";
				}
				if(boardid.equals("auctionList")) {
					sql = "select nvl(count(*),0) from auction";
				}
				pstmt = con.prepareStatement(sql);
			} else {
				if(boardid.equals("memberList")) {
					sql = "select nvl(count(*),0) from member where " + category + " like ?";
				}
				if(boardid.equals("auctionList")) {
					sql = "select nvl(count(*),0) from auction where " + category + " like ?";
				}
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

	
	public List auctionList(int start, int end, String boardid, String category, String sentence) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		Connection con = DriverManager.getConnection(JDBC_URL,USER,PASS);
		try {
			if (category == null || category.equals("")) {
				sql = "select * from (select rownum rnum, a.* from (select * from auction) a) where rnum between ? and ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from (select rownum rnum, a.* from (select * from auction where " + category + " like ?) a) where rnum between ? and ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + sentence + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList(end);
				do {
					auctionDTO article = new auctionDTO();
					article.setAuctionCode(rs.getInt("auctioncode"));
					article.setProduct(rs.getNString("product"));
					article.setMinPrice(rs.getInt("minprice"));
					article.setCategory(rs.getNString("category"));
					article.setOpenDate(rs.getString("opendate"));
					article.setCloseDate(rs.getString("closedate"));
					article.setBetCnt(rs.getInt("betcnt"));
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
	
	public ArrayList<auctionDTO> getAllArticles() throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String query = "";
	      ArrayList<auctionDTO> articleList = new ArrayList<auctionDTO>();
	      try {
	         conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
	         pstmt = conn.prepareStatement("select * from auction");
	         rs = pstmt.executeQuery();

	         while (rs.next()) {

	            auctionDTO article = new auctionDTO();
	            article.setAuctionCode(rs.getInt("auctioncode"));
	            article.setProduct(rs.getString("product"));
	            article.setDetail(rs.getString("detail"));
	            article.setFilename(rs.getString("fileName"));
	            article.setMinPrice(rs.getInt("minprice"));
	            article.setCategory(rs.getString("category"));
	            article.setOpenDate(rs.getString("opendate"));
	            article.setCloseDate(rs.getString("closedate"));
	            article.setBetCnt(rs.getInt("betcnt"));
	            articleList.add(article);
	         }

	      } catch (Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         Util.close(conn, pstmt, rs);

	      }
	      return articleList;
	   }
	
	public auctionDTO getData() throws Exception {
		
		auctionDTO auctionData = new auctionDTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("select product, opendate, closedate from auction where closedate <  "
					+ "(select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') from dual)");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				auctionData.setProduct(rs.getString("product"));
				auctionData.setOpenDate(rs.getString("opendate"));
				auctionData.setCloseDate(rs.getString("closedate"));
			}	
			System.out.println(auctionData.getProduct());
			System.out.println(auctionData.getOpenDate());
			System.out.println(auctionData.getCloseDate());

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return auctionData;
	}
	
	public int getMinPrice(int auctioncode) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int price = 0;
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("select minprice from auction where auctioncode = ?");
			pstmt.setInt(1, auctioncode);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				price = rs.getInt(1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return price;
	}
	public int getState(int auctioncode) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int state=0;
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("select state from auction where auctioncode = ?");
			pstmt.setInt(1, auctioncode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				state = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);

		}
		return state;
	}
	public int changeState(int auctionCode) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int state=0;		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("update auction set state = 1 where auctioncode = ?");
			pstmt.setInt(1, auctionCode);
			rs = pstmt.executeQuery();
			state=1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);

		}
		return state;
	}
	public ArrayList<auctionDTO> getWinnerOrderInfo(int auctioncode) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		ArrayList<auctionDTO> list = new ArrayList<auctionDTO>();
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("select * from auction where auctioncode = ?");
			pstmt.setInt(1, auctioncode);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				auctionDTO winner = new auctionDTO();
				winner.setAuctionCode(rs.getInt("auctioncode"));
				winner.setRealProduct(rs.getString("realproduct"));
				winner.setDetail(rs.getString("detail"));
				winner.setFilename(rs.getString("fileName"));
				list.add(winner);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);

		}
		return list;
	}
	
}
