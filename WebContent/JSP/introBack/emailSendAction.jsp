<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "javax.mail.Transport" %>
<%@ page import = "javax.mail.Message" %>
<%@ page import = "javax.mail.Address" %>
<%@ page import = "javax.mail.Session" %>
<%@ page import = "javax.mail.Authenticator" %>
<%@ page import = "java.util.Properties" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "util.SHA256" %>
<%@ page import = "util.Gmail" %>
<%@ page import = "java.io.PrintWriter" %>

<%
	UserDAO userDAO = new UserDAO();
	String id = null;
	
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	
	if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = '/jspProject/JSP/introPage.jsp'");
		script.println("</script>");
		script.close();
		return;	
	}
	
	boolean emailChecked = userDAO.getUserEmailChecked(id);
	if(emailChecked == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증 된 회원입니다');");
		script.println("location.href = '/jspProject/JSP/front/userMain.jsp'");
		script.println("</script>");
		script.close();
		return;	
	}
	
	String host = "http://localhost:8089/jspProject/JSP/";
	String from = "kyusung612@gmail.com";
	String to = userDAO.getUserEmail(id);
	String subject = "BLUEOCEAN을 위한 이메일 인증 메일입니다.";
	String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." + 
			"<a href='" + host + "introBack/emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
	
	//메일 환경 변수 설정
	Properties p  = new Properties();
	//메일 프로토콜은 gmail를 이용할 것이기 때문에 smtp로 사용
	p.setProperty("mail.transport.protocol", "smtp");
	//관리자 메일
	p.put("mail.smtp.user", from);
	//메일 호스트 주소를 설정
	p.put("mail.smtp.host", "smtp.googlemail.com");
	//포트번호
	p.put("mail.smtp.port", "465");
	//Starttls를 이용한 메일 보내기의 핵심, JavaMail에 TLS모드를 시작하라고 명시적으로 요청
	p.put("mail.smtp.starttls.enable", "true");
	//id, pwd 설정이 필요
	p.put("mail.smtp.auth", "true");
	//디버그 모드
	p.put("mail.smtp.debug","true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback","false");
	
	try{
		Authenticator auth = new Gmail();
		// id와 password를 설정하고 session을 생성
		Session ses = Session.getInstance(p, auth); 
		ses.setDebug(true);
		// 메일 메시지를 만들기 위한 클래스를 생성합니다.
		MimeMessage msg = new MimeMessage(ses);
		// 메일 제목을 설정합니다.
		msg.setSubject(subject);
		//송신자 설정
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		//수신자 설정
		Address toAddr = new InternetAddress(to);
		// 숨은 참조 수신자 설정
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		// 메일 내용을 설정을 위한 클래스를 설정합니다
		msg.setContent(content, "text/html;charset=UTF8");
		//메일 보내기
		Transport.send(msg);
	}
	catch(Exception e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;	
	}
%>

<title>이메일 인증</title>

<body class="intro">
	<div class="jb-box">
		<section class="container mt-3" style="max-width:560px;">
			<div class="alert alert-sucess mt-4" role="alert">
			이메일 주소 인증 메일이 전송되었습니다. 회원가입시 입력했던 이메일에 들어가셔서 인증해주세요
		</div>
		</section>
	</div>
	</body>
	
