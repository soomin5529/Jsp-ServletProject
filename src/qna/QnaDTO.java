package qna;

public class QnaDTO {
	
	private int qnaCode;
	private String id;
	private String qnaTitle;
	private String qnaCon;
	private String regDate;
	private String qnaReply;
	private String replyDate;
	
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaCon() {
		return qnaCon;
	}
	public void setQnaCon(String qnaCon) {
		this.qnaCon = qnaCon;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getQnaReply() {
		return qnaReply;
	}
	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	
	public QnaDTO() {
		
	}
	
	@Override
	public String toString() {
		return "QnaDTO [qnaCode=" + qnaCode + ", id=" + id + ", qnaTitle=" + qnaTitle + ", qnaCon=" + qnaCon
				+ ", regDate=" + regDate + ", qnaReply=" + qnaReply + ", replyDate=" + replyDate + "]";
	}
	public QnaDTO(int qnaCode, String id, String qnaTitle, String qnaCon, String regDate, String qnaReply,
			String replyDate) {
		super();
		this.qnaCode = qnaCode;
		this.id = id;
		this.qnaTitle = qnaTitle;
		this.qnaCon = qnaCon;
		this.regDate = regDate;
		this.qnaReply = qnaReply;
		this.replyDate = replyDate;
	}

	
}
