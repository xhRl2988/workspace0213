<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<% 
		String sql="select a.custno custno, a.custname custname "
				+ ",decode(a.grade,'A','VIP','B','일반','C','직원') grade "
				+ ",sum(price) price "
				+ "from member_tbl_02 a, money_tbl_02 b "
				+ "where a.custno = b.custno "
				+ "group by a.custno, a.custname, a.grade "
				+ "order by price desc";
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
				<td>고객등급</td>
				<td>매출</td>
			</tr>	
			<% while(rs.next()){ %>
			<tr align="center">
				<td><%=rs.getString("custno") %></td>
				<td><%=rs.getString("custname") %></td>
				<td><%=rs.getString("grade") %></td>
				<td><%=rs.getString("price") %></td>
			</tr>
			<%} %>
		</table>
	</main>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>