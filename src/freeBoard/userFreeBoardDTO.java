package freeBoard;

import java.sql.Timestamp;

public class userFreeBoardDTO {
	private int freeBoardID;
	private String id;
	private String titleName;
	private String freeContent;
	private String totalScore;
	private String comfortableScore;
	private String productScore;
	private String siteScore;
	private int likeCount;
	
	
	public int getFreeBoardID() {
		return freeBoardID;
	}
	public void setFreeBoardID(int freeBoardID) {
		this.freeBoardID = freeBoardID;
	}
	public String getID() {
		return id;
	}
	public void setID(String id) {
		this.id = id;
	}
	public String getTitleName() {
		return titleName;
	}
	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}
	public String getFreeContent() {
		return freeContent;
	}
	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getComfortableScore() {
		return comfortableScore;
	}
	public void setComfortableScore(String comfortableScore) {
		this.comfortableScore = comfortableScore;
	}
	public String getProductScore() {
		return productScore;
	}
	public void setProductScore(String productScore) {
		this.productScore = productScore;
	}
	public String getSiteScore() {
		return siteScore;
	}
	public void setSiteScore(String siteScore) {
		this.siteScore = siteScore;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public userFreeBoardDTO() {
		
	}
	
	public userFreeBoardDTO(int freeBoardID, String id, String titleName, String freeContent, String totalScore,
			String comfortableScore, String productScore, String siteScore, int likeCount) {
		super();
		this.freeBoardID = freeBoardID;
		this.id = id;
		this.titleName = titleName;
		this.freeContent = freeContent;
		this.totalScore = totalScore;
		this.comfortableScore = comfortableScore;
		this.productScore = productScore;
		this.siteScore = siteScore;
		this.likeCount = likeCount;
		
	}
	
}

		  