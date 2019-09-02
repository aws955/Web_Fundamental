package kr.co.kic.dev1.dto;

public class EmpDto {
	private int num;
	private String name;
	private String job;
	private int mgr;
	private String date;
	private int sal;
	private int comm;
	private int deptno;
	
	public EmpDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmpDto(int num, String name, String job, int mgr, String date, int sal, int comm, int deptno) {
		super();
		this.num = num;
		this.name = name;
		this.job = job;
		this.mgr = mgr;
		this.date = date;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}

	public EmpDto(int num, String name, String job, int mgr, String date) {
		super();
		this.num = num;
		this.name = name;
		this.job = job;
		this.mgr = mgr;
		this.date = date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getMgr() {
		return mgr;
	}

	public void setMgr(int mgr) {
		this.mgr = mgr;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public int getComm() {
		return comm;
	}

	public void setComm(int comm) {
		this.comm = comm;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	
		
}
