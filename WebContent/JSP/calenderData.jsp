<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="auction.auctionDTO"%>
<%@ page import="auction.auctionDAO" %>
<%
	 request.setCharacterEncoding("UTF-8");
	
	auctionDAO auctionDao = new auctionDAO();
	auctionDTO auctionData = auctionDao.getData();
	
//	List<auctionDTO> list = auctionData.getData();
	HashMap<String,Object> map = new HashMap<String,Object>();
	//map.put("list",list);
	map.put("auctionData",auctionData);

	JSONObject json = new JSONObject();
	json.putAll(map);
	out.println(json);
	
	JSONArray jArray = new JSONArray();
	jArray.add(json);
	out.print(jArray.toString());


	/* 
	JSONObject json = new JSONObject();
	
	json.put("product",auctionData.getProduct());
	json.put("opendate",auctionData.getOpenDate());
	json.put("closedate",auctionData.getCloseDate()); */
	
/* 	 auctionDAO dao = new auctionDAO();	
	 auctionDTO dto = new auctionDTO();
	 dto= dao.getData();
	 
	 List<auctionDTO> list = new ArrayList<auctionDTO>();
	 list.add(dto);
	 
	 JSONArray jsonArray = JSONArray.fromObject(list);
	 out.println(jsonArray);
	 
	 Map<String, Object> map = new HashMap<String, Object>();
	 map.put("list", jsonArray);
	 
	 JSONArray jsonObject = JSONArray.fromObject(map);
	 out.println(jsonObject); */
	 
%>