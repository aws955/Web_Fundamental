<%@page import="java.util.Calendar"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page pageEncoding="utf-8"%>

<%
	//년월일 폴더를 만들어서 관리하는 것이 좋다.(회사 상황에 맞춰서) 한폴더에 2000개 정도
	//String name = request.getParameter("name"); => 파일을 넘길때는 이렇게 하면 안된다
	
	request.setCharacterEncoding("utf-8");
	String realPath = request.getRealPath(""); //앞쪽의 경로를 가져오는 메서드 getRealPath
	String path = request.getRealPath("upload"); 
	
	Calendar c = Calendar.getInstance();
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH);
	
	path += File.separator+year+File.separator+month;
	File f = new File(path); //separator => OS 마다 달라지는 경로를 바꿔준다.
	
	
	if(!f.exists()){
		f.mkdirs();
	}
	
	MultipartRequest multi = null;
	try{
		multi = new MultipartRequest(
				request,
				path, //업로드할 디렉토리 경로
				10*1024*1024, //파일크기 (허용할 파일크기)
				"utf-8", //인코딩 타입
				new DefaultFileRenamePolicy() //파일이름이 중복되었을 때 파일명 끝에 1,2,3 순으로 번호를 매김
				);

	}catch(Exception e){
		e.printStackTrace();
	}
	//파일이 들어가있는 input form 에서는 request.getParameter 는 안된다.
	//multi.getParameter 만 하면된다.
	String name = multi.getParameter("name");
	String fileName = multi.getFilesystemName("file"); //실제 시스템에 올라온 파일 이름
	String uploadName = multi.getOriginalFileName("file"); //사용자가 올린 파일 이름
	
	File f1 = new File(f,fileName);
	long fileSize = f1.length()/1024;
%>
<%=realPath %><br>
<%=path %><br>
<%=name %> <br>
<%=fileName %><br>
<%=uploadName %> <br>
<%=fileSize %> KB


