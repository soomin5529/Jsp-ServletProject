<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="auction.auctionDAO"%>
<%@page import="java.io.File"%>
<%@page import="auction.auctionDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<% 
	String realFolder = "";
    String saveFolder = "uploadFile";
    String encType = "UTF-8";
    int maxSize = 10 * 1024 * 1024;
    ServletContext context = this.getServletContext();
    realFolder = context.getRealPath(saveFolder);
  /*   System.out.println("실제 서블릿 상 경로 :" +realFolder);
    out.println("실제 서블릿 상 업로드 경로:" +realFolder); */
try {
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	auctionDTO article = new auctionDTO();
	Enumeration files = multi.getFileNames();
	if (files.hasMoreElements()) {
		String name2 = (String) files.nextElement();
		File file = multi.getFile(name2);
	/* 	String value= multi.getParameter(name2); */
		if (file != null) {
	article.setFilename(file.getName());
		} else {
	article.setFilename("");
		}
	}
	String openD = multi.getParameter("openDate");
	String closeD = multi.getParameter("closeDate");
	 
    String time1 = openD.replace("T", " ");
    String time2 = closeD.replace("T", " ");
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    Date retime1 = sdf.parse(time1);
    Date retime2 = sdf.parse(time2);
    String openDate = sdf.format(retime1);
    String closeDate = sdf.format(retime2);
   
	
	article.setProduct(multi.getParameter("product"));
	article.setDetail(multi.getParameter("detail"));
	article.setMinPrice(Integer.parseInt(multi.getParameter("minPrice")));
	article.setCategory(multi.getParameter("category"));
	article.setOpenDate(openDate);
	article.setCloseDate(closeDate);
	auctionDAO dao = auctionDAO.getInstance();

	dao.insertArticle(article);

} catch (Exception e) {
	e.printStackTrace();
}
%>
<meta http-equiv="Refresh" content="0; url=<%=request.getContextPath()%>/JSP/front/auctionList.jsp">
</head>
<body>

</body>
</html>