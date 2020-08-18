package user;

public class UserDTO {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String agency;
	private String tel;
	private String birthdate;
	private String gender;
	private String zipcode;
	private String address;
	private String userEmailHash;
	private boolean userEmailChecked;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public boolean isUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	public UserDTO() {
		
	}
	public UserDTO(String id, String pwd, String name, String email, String agency, String tel, String birthdate,
			String gender, String zipcode, String address, String userEmailHash, boolean userEmailChecked) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.agency = agency;
		this.tel = tel;
		this.birthdate = birthdate;
		this.gender = gender;
		this.zipcode = zipcode;
		this.address = address;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
	}
	

}
