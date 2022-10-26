<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<%@page import="java.io.File"%>

<%
	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
	Calendar time = Calendar.getInstance();
	String format_time1 = format1.format(time.getTime());
	String excelname_tmp = format_time1 + "_상품리스트.xls";
	
	String excel_name = new String(excelname_tmp.getBytes("UTF-8"), "ISO-8859-1");
	System.out.println("excel_name  " + excel_name);
    response.setHeader("Content-Disposition","attachment;filename=" + excel_name );    //디폴트 파일명 지정
    response.setHeader("Content-Description", "JSP Generated Data"); 
%>

<html lang="ko">

   <body>

					<table class="table table-bordered table-hover">
						<thead class="thead-dark text-center">
						<tr>
							<th>순서</th>
							<th>상품명 </th>
							<th>판매가 </th>
							<th>배송비 </th>
							<th>수수료 </th>
							<th>정산가 </th>
							<th>롯데온 </th>
							<th>마진 </th>
							<th>최저가 </th>
							<th>참고링크 </th>
							<th>쿠팡</th>
							<th>마진</th>
							<th>최저가</th>
							<th>참고링크</th>
							<th>지마켓</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>옥션</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>티몬</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>인터파크</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
							<th>SSG</th>
							<th>마진</th>
							<th>최저가</th>
							<th>링크</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${list }" var="list" varStatus="status">
							
							<tr>
								  <td>${list.DIDX }</td>
								  <td>${list.COLUMNA1}</td>
								  <td>${list.COLUMNA2}</td>
								  <td>${list.COLUMNA3}</td>
								  <td>${list.COLUMNA4}</td>
								  <td>${(list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)}</td>
								  <td>${list.COLUMNA6}</td>
								  <td>${((list.COLUMNA2 * list.COLUMNA4)+(list.COLUMNA3 * 0.967)) - list.COLUMNA6}</td>
								  <td>${list.COLUMNA8}</td>
								  <td>${list.COLUMNA9}</td>
								  <td>${list.COLUMNB1}</td>
								  <td>${list.COLUMNB2}</td>
								  <td>${list.COLUMNB3}</td>
								  <td>${list.COLUMNB4}</td>
								  <td>${list.COLUMNB5}</td>
								  <td>${list.COLUMNB6}</td>
								  <td>${list.COLUMNB7}</td>
								  <td>${list.COLUMNB8}</td>
								  <td>${list.COLUMNB9}</td>
								  <td>${list.COLUMNC1}</td>
								  <td>${list.COLUMNC2}</td>
								  <td>${list.COLUMNC3}</td>
								  <td>${list.COLUMNC4}</td>
								  <td>${list.COLUMNC5}</td>
								  <td>${list.COLUMNC6}</td>
								  <td>${list.COLUMNC7}</td>
								  <td>${list.COLUMNC8}</td>
								  <td>${list.COLUMNC9}</td>
								  <td>${list.COLUMND1}</td>
								  <td>${list.COLUMND2}</td>
								  <td>${list.COLUMND3}</td>
								  <td>${list.COLUMND4}</td>
								  <td>${list.COLUMND5}</td>
								  <td>${list.COLUMND6}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					

   </body>

</html>

