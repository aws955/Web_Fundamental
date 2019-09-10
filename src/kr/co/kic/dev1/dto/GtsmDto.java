package kr.co.kic.dev1.dto;

public class GtsmDto {
	
	private int seq;
	private String name;
	private String email;
	private String pwd;
	private String regdate;
	
	public GtsmDto() {}
	
	public GtsmDto(int seq, String name, String email, String pwd, String regdate) {
		this.seq = seq;
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.regdate = regdate;
	}
	
	public GtsmDto(int seq, String name, String email, String regdate) {
		this(seq,name,email,null,regdate);
	}
	
	public GtsmDto(String name, String email, String pwd) {
		this(0,name,email,pwd,null);
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
