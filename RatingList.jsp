<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

		<link rel="stylesheet" href="jquery.rating.css">	<!--  if the stars somehow stop working, move all the star-rating stuff to WebContent.
		 Have no idea whats going on with this because it will continue working even after deleting them -->
        <script src="jquery.js"></script>
        <script src="jquery.rating.js"></script>
        <link rel="stylesheet" href="main2.css">
        <link rel="stylesheet" href="blaze.min.css">
         <!-- https://www.blazeui.com/getting-started/install -->


        <style type="text/css">a {text-decoration: none}</style>
</head>

<!--  UserID: <c:out value= "${sessionScope.userID}">NulluserID</c:out> -->
  TestUserID: <c:out value= "${userID}">NulluserID</c:out> 
<ul>
	<c:forEach items="${ratingList}" var="rating">
	       <li>
	      	   <form method = "post" action = "${pageContext.servletContext.contextPath}/RatingServlet">
	      	   <input type ="hidden" value = "${rating.albumID}" name=albumID> <!-- This lets me set rating.albumID value to albumID variable for use in servlet -->
	      		<input type ="hidden" value = "${rating.totalScore}" name=totalScore>
	      		<input type ="hidden" value = "${rating.ratingAmt}" name=ratingAmt>
	      		<input type ="hidden" value = "${rating.albumArtist}" name=ratingArtist>
	      	
	      	   
	      	    <a href="/CS157A//albumPageServlet?albumID=${rating.albumID}"> <c:out value="${rating.albumName}" /></a>
	            <a href="/CS157A/artistPageServlet?ratingArtist=${rating.albumArtist}"><c:out value="${rating.albumArtist}" /></a>
	          
	            
				
				<c:choose>
					<c:when test="${rating.albumRating == 1}">
					<input type="radio" name="rating" value="1" class="star" checked="checked">
					</c:when>
					<c:otherwise>
					 <input type="radio" name="rating" value="1" class="star">
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${rating.albumRating == 2}">
					<input type="radio" name="rating" value="2" class="star" checked="checked">
					</c:when>
					<c:otherwise>
					 <input type="radio" name="rating" value="2" class="star">
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${rating.albumRating == 3}">
					<input type="radio" name="rating" value="3" class="star" checked="checked">
					</c:when>
					<c:otherwise>
					 <input type="radio" name="rating" value="3" class="star">
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${rating.albumRating == 4}">
					<input type="radio" name="rating" value="4" class="star" checked="checked">
					</c:when>
					<c:otherwise>
					 <input type="radio" name="rating" value="4" class="star">
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${rating.albumRating == 5}">
					<input type="radio" name="rating" value="5" class="star" checked="checked">
					</c:when>
					<c:otherwise>
					 <input type="radio" name="rating" value="5" class="star">
					</c:otherwise>
				</c:choose>
				
						<div class="input-group">
							<button type="submit" class="btn" name="action" value="submitRating">Rate</button>
						</div>
						<div class="input-group">
							<button type="submit" class="btn" name="action" value="deleteRating">Unrate</button>
						</div>
	           
	            </form>
	              
	           
	        </li>
	    </c:forEach>
	    </ul>
	   
</body>
</html>