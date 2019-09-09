package kr.co.kic.dev1.dto;

public class GtsmDto {
	
	// 테이블의 열과 타입으로 멤버변수 선언
	private int seq;
	private String name;
	private String email;
	private String pwd;
	private String regdate;
	
	// 디폴트생성자
	// 임의로 생성자를 생성하지 않으면 컴파일러가 자동으로 생성
	// Dto의 경우 insert를 위해서 전체 멤버변수를 가지는 생성자를 생성하므로
	// 자동으로 디폴트 생성자를 만들어주지않음
	public GtsmDto() {
		super();
	}

	// 전체 멤버변수를 초기화하는 생성자
	// 이후에 간단한 생성자는 전체 멤버변수를 초기화하는 생성자를 재활용하면 좋다
	public GtsmDto(int seq, String name, String email, String pwd, String regdate) {
		super();
		this.seq = seq;
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.regdate = regdate;
	}
	
	// select(int start, int length) 에서 사용하는 생성자
	public GtsmDto(int seq, String name, String email, String regdate) {
		this(seq,name,email,null,regdate);
	}
	
	// select(int seq) 에서 사용하는 생성자
	public GtsmDto(String name, String email, String regdate) {
		this(0,name,email,null,regdate);
	}
	
	// getter,setter 메서드
	// 멤버변수를 private으로 선언했기 때문에 getter와 setter메서드를 통해서 접근해야한다.
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
