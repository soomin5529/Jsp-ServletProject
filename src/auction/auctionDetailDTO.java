package auction;

public class auctionDetailDTO {
	private int betCode;
	private int auctionCode;
	private String id;
	private String betDate;
	private int betPrice;
	private int betState;

	public int getBetCode() {
		return betCode;
	}

	public void setBetCode(int betCode) {
		this.betCode = betCode;
	}

	public int getAuctionCode() {
		return auctionCode;
	}

	public void setAuctionCode(int auctionCode) {
		this.auctionCode = auctionCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBetDate() {
		return betDate;
	}

	public void setBetDate(String betDate) {
		this.betDate = betDate;
	}

	public int getBetPrice() {
		return betPrice;
	}

	public void setBetPrice(int betPrice) {
		this.betPrice = betPrice;
	}

	public int getBetState() {
		return betState;
	}

	public void setBetState(int betState) {
		this.betState = betState;
	}

	public static void main(String[] args) {
		

	}

}
