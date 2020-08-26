package qna;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class QnaDAO {
	private static QnaDAO instance = new QnaDAO();
	public static QnaDAO getInstance() {
		return instance;
	}
	
	
	public static Connection getConnection() throws Exception{
		Connection con = null;
		
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbId = "jspProject";
			String dbPass = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
		//현재의 시간을 가져오는 함수
			public Timestamp getDate() throws Exception { 
				Connection conn = getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String SQL = "SELECT sysdate from dual";
				
				try {
					pstmt = conn.prepareStatement(SQL);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						return rs.getTimestamp(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;  //데이터베이스 오류
			}

		//게시글 번호 가져오기
			
			public int getNext() throws Exception {
				Connection conn = getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select qnaCode from QNA order by qnaCode desc";
				try {
					pstmt = conn.prepareStatement(sql);
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
			
			//Q&A 질문하기 등록
			public int writeQna(String qnaTitle, String id, String qnaCon ) throws Exception {
				Connection conn = getConnection();
				PreparedStatement pstmt = null;
				String sql = "insert into qna(qnaCode, id, qnaTitle, qnaCon, regDate) values(?,?,?,?,?)";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, getNext());
					pstmt.setString(2, id);
					pstmt.setString(3, qnaTitle);
					pstmt.setString(4, qnaCon);
					pstmt.setTimestamp(5, getDate());
					return pstmt.executeUpdate();
										
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				return -1;	//데이터베이스 오류
			}
			
			//질문 리스트 불러오기
			public ArrayList<QnaDTO> getList(int pageNumber) throws Exception{
				Connection conn = getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from (select * from QNA where qnaCode<? ORDER BY qnaCode DESC) where ROWNUM <= 5";
				ArrayList<QnaDTO> list = new ArrayList<QnaDTO>();
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, getNext()-(pageNumber-1) * 5);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						QnaDTO qna = new QnaDTO();
						qna.setQnaCode(rs.getInt(1));
						qna.setId(rs.getString(2));
						qna.setQnaTitle(rs.getString(3));
						qna.setQnaCon(rs.getString(4));
						qna.setQnaReply(rs.getString(5));
						qna.setRegDate(rs.getString(6));
						qna.setReplyDate(rs.getString(7));
						list.add(qna);
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			
				return list;
			}
			
			//nextPage 추가
			public boolean nextPage(int pageNumber) throws Exception {
				Connection conn = getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from (select * from QNA where qnaCode<? ORDER BY qnaCode DESC) where ROWNUM <= 5 ";
				ArrayList<QnaDTO> list = new ArrayList<QnaDTO>();
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, getNext() - (pageNumber - 1) * 5);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						return true;
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					user.Util.close(conn, pstmt, rs);
				}
				return false;
			}
			
}