<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<% 
		String sql="select custno, custname, phone,address, " 
				+ " to_char(joindate,'yyyy-mm-dd')joindate, "
				+ " decode(grade,'A','Vip','B','일반','C','직원')grade, city  from member_tbl_02 order by custno asc";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
	<main id="section">
	<h2 class="title">홈쇼핑 회원 등록</h2>
			<table class="table_line">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
			</tr>	
			<% while(rs.next()){ %>
			<tr align="center">
				<td class="link"><a style="color:blue" href="update.jsp?custno=<%=rs.getString("custno") %>">
				<%=rs.getString("custno") %></a></td>
				<td><%=rs.getString("custname") %></td>
				<td><%=rs.getString("phone") %></td>
				<td><%=rs.getString("address") %></td>
				<td><%=rs.getString("joindate") %></td>
				<td><%=rs.getString("grade") %></td>
				<td><%=rs.getString("city") %></td>
			</tr>
			<%} %>
		</table>
	</main>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>