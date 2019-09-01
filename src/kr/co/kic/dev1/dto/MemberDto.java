package kr.co.kic.dev1.dto;

public class MemberDto {
	private String id;
	private String email;
	private String password;
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDto(String id, String email, String password) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
