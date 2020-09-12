<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="auction.jsonDTO"%>
<%@ page import="auction.auctionDAO" %>
<%
	 request.setCharacterEncoding("UTF-8");
	
/* 	auctionDAO auctionDao = new auctionDAO();
	auctionDTO auctionData = auctionDao.getData();
	
	List<auctionDTO> list = auctionData.getDetail()
	HashMap<String,Object> map = new HashMap<String,Object>();
	map.put("list",list);
 	map.put("auctionData",auctionData);

	JSONObject json = new JSONObject();
	json.putAll(map);
	out.println(json);
	
	JSONArray jArray = new JSONArray();
	jArray.add(json);
	out.print(jArray.toString());
 */

/* 	 auctionDAO auctionDao = new auctionDAO();
	auctionDTO auctionData = auctionDao.getData();

	
	JSONObject json = new JSONObject();
	
	json.put("product",auctionData.getProduct());
	json.put("opendate",auctionData.getOpenDate());
	json.put("closedate",auctionData.getCloseDate());

	 List<jsonDTO> list = new ArrayList<jsonDTO>();
	 list.add(dto);
	 
	 
	 Map<String, Object> map = new HashMap<String, Object>();
	 map.put("list", list);
	 */
	 
 	 auctionDAO dao = new auctionDAO();	
	 jsonDTO dto = new jsonDTO();
	 dto= dao.getData();
	

	 	JSONArray jsonArr = new JSONArray();	 
	 	JSONObject json = new JSONObject();
		json.put("realproduct", dto.getRealProduct());
		json.put("opendate", dto.getOpenDate());
		json.put("closedate",dto.getCloseDate());
		jsonArr.add(json);
		
		json.put("result",jsonArr.toString());
		String result = json.toString().replaceAll("\"\\[" ,"\\[").replaceAll("\\]\"" ,"\\]").replaceAll("\\\\" ,"");
		
		out.println(result);

%>
