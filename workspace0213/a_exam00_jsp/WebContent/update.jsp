<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<% 
String sql="select custno, custname, phone,address, " 
		+ " to_char(joindate,'yyyy-mm-dd')joindate, "
		+ " grade, city  from member_tbl_02 "
		+ " where custno="+request.getParameter("custno");
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		
		rs.next();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript">
			function checkValue(){
				var cv = document.data;
				
				if(!cv.custname.value){
					alert("회원성명을 입력하세요.")
					cv.custname.focus();
					return false;
				}
				if(!cv.phone.value){
					alert("회원전화를 입력하세요.")
					cv.phone.focus();
					return false;
				}
				if(!cv.address.value){
					alert("회원주소를 입력하세요.")
					cv.address.focus();
					return false;
				}
				if(!cv.joindate.value){
					alert("가입일자를 입력하세요.")
					cv.joindate.focus();
					return false;
				}
				if(!cv.grade.value){
					alert("고객등급을 입력하세요.")
					cv.grade.focus();
					return false;
				}
				if(!cv.city.value){
					alert("도시코드를 입력하세요.")
					cv.city.focus();
					return false;
				}
			}
		</script>
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
		<form name="data" action="update_p.jsp" method="post" onsubmit="return checkValue()">
			<table class="table_line">
			<tr>
				<td>회원번호(자동발생)</td>
				<th><input type="text" name="custno" value="<%=rs.getString("custno") %>" readonly></th>
			</tr>	
			<tr>
				<td>회원성명</td>
				<th><input type="text" name="custname" value="<%=rs.getString("custname") %>" autofocus></th>
			</tr>		
			<tr>
				<td>회원전화</td>
				<th><input type="text" name="phone" value="<%=rs.getString("phone") %>" ></th>
			</tr>	
			<tr>
				<td>회원주소</td>
				<th><input type="text" name="address" value="<%=rs.getString("address") %>" ></th>
			</tr>	
			<tr>
				<td>가입일자</td>
				<th><input type="text" name="joindate" value="<%=rs.getString("joindate") %>" ></th>
			</tr>	
			<tr>
				<td>고객등급 [A:VIP,B:일반,:C:직원]</td>
				<th><input type="text" name="grade" value="<%=rs.getString("grade") %>"></th>
			</tr>	
			<tr>
				<td>도시코드</td>
				<th><input type="text" name="city" value="<%=rs.getString("city") %>" ></th>
			</tr>	
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록"> 
					<input type="button" value="조회" onclick="location.href='member_list.jsp'"> 
				</td>
			</tr>
		</table>
		</form>
	</main>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>