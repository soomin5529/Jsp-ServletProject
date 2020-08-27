package qna;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import user.Util;

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
			//Q&A 내용 가져오기
			public String getQna(int qnaCode) throws Exception{
				Connection conn = getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String data=null;
				String sql = null;
				try {
					sql = "select qnaCon from qna where qnaCode = ?";
					pstmt = conn.prepareStatement(sql); 
					pstmt.setInt(1, qnaCode);
					rs = pstmt.executeQuery();	
					
					if(rs.next()) {
						 data = rs.getString(1);
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					Util.close(conn, pstmt, rs);
				}
				return data; 	
			}
			
			//관리자인지 아닌지
			public int checkAuthor(String id) throws Exception {
				Connection conn = getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				try {
					sql = "select author from MEMBER where id = ?";
					pstmt = conn.prepareStatement(sql); 
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
					Util.close(conn, pstmt, rs);
				}
				return -2;	
			}
			
			
		//관리자가 답변 다는 쿼리
			public int qnaReply(String qnaReply, int qnaCode) throws Exception {
				Connection conn = getConnection();
				PreparedStatement pstmt = null;
				String sql = "update QNA set qnaReply=? , replyDate=? where qnaCode = ?  ";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, qnaReply);
					pstmt.setTimestamp(2, getDate());
					pstmt.setInt(3, qnaCode);
					return pstmt.executeUpdate();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				return -1;	//데이터베이스 오류
			}
			
		//QNA에 답변이 달려있으면 보여주는 쿼리 없으면 안 보여준다
			public boolean chkReply(int qnaCode) throws Exception{
				Connection conn = getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				boolean chk = false;
				String sql = "select qnaReply, replyDate from qna where qnaCode=?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, qnaCode);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						if(rs.getString(1) != null && rs.getString(2) != null) {
							chk = true;
						}
						else {
							chk = false;
						}
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally{
					user.Util.close(conn, pstmt, rs);
				}
				return chk;
			}
}
