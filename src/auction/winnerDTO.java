package auction;

public class winnerDTO {
	private int winnerCode;
	private int auctionCode;
	private String id;
	private int betPrice;
	private String name;
	private String tel;
	private String zipCode;
	private String address;
	private String ordermeno;
	private int payInfo;
	private String bank;
	private int payState;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getOrdermeno() {
		return ordermeno;
	}

	public void setOrdermeno(String ordermeno) {
		this.ordermeno = ordermeno;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public int getWinnerCode() {
		return winnerCode;
	}

	public void setWinnerCode(int winnerCode) {
		this.winnerCode = winnerCode;
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

	public int getBetPrice() {
		return betPrice;
	}

	public void setBetPrice(int betPrice) {
		this.betPrice = betPrice;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPayInfo() {
		return payInfo;
	}

	public void setPayInfo(int payInfo) {
		this.payInfo = payInfo;
	}

	public int getPayState() {
		return payState;
	}

	public void setPayState(int payState) {
		this.payState = payState;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
