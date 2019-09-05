package kr.co.kic.dev1.dto;

public class MemberDto {
	private int seq;
	private String name;
	private String id;
	private String email;
	private String pwd;
	private String phone;
	private String regdate;
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public MemberDto(int seq, String name, String id, String email, String pwd, String phone, String regdate) {
		super();
		this.seq = seq;
		this.name = name;
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.phone = phone;
		this.regdate = regdate;
	}

	public MemberDto(int seq, String name, String id, String email, String phone, String regdate) {
		super();
		this.seq = seq;
		this.name = name;
		this.id = id;
		this.email = email;
		this.phone = phone;
		this.regdate = regdate;
	}

	public MemberDto(String name, String id, String email, String pwd, String phone) {
		super();
		this.name = name;
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.phone = phone;
	}

	public MemberDto(int seq, String name, String id, String email, String phone) {
		super();
		this.seq = seq;
		this.name = name;
		this.id = id;
		this.email = email;
		this.phone = phone;
	}

	public MemberDto(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
