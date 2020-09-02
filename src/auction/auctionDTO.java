package auction;

public class auctionDTO {

	private int auctionCode;
	private String product;
	private String detail;
	private String filename;
	private int minPrice;
	private String category;
	private String openDate;
	private String closeDate;
	private int betCnt;

	public int getAuctionCode() {
		return auctionCode;
	}

	public void setAuctionCode(int auctionCode) {
		this.auctionCode = auctionCode;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}

	public int getBetCnt() {
		return betCnt;
	}

	public void setBetCnt(int betCnt) {
		this.betCnt = betCnt;
	}

	@Override
	public String toString() {
		return "auctionDTO [auctionCode=" + auctionCode + ", product=" + product + ", detail=" + detail + ", filename="
				+ filename + ", minPrice=" + minPrice + ", category=" + category + ", openDate=" + openDate
				+ ", closeDate=" + closeDate + ", betCnt=" + betCnt + "]";
	}

}
