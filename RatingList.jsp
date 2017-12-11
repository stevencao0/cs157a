<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

		<link rel="stylesheet" href="jquery.rating.css">
        <script src="jquery.js"></script>
        <script src="jquery.rating.js"></script>
        <link rel="stylesheet" href="main3.css">
        <link rel="stylesheet" href="blaze.min.css">
         <!-- https://www.blazeui.com/getting-started/install -->

 <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/font-awesome-4.7.0/css/font-awesome.min.css">
        <style type="text/css">a {text-decoration: none}</style>
</head>
<ul class="c-nav c-nav--inline">

  <li class="c-nav__item">
  <a href="/CS157A/RatingServlet" style="margin: 0px; display: block; width: 100%; height: 100%; text-decoration: none; color: white">
  <i class="fa fa-home">
  </i> 
  Home
   </a>
   </li>
   
   <li class="c-nav__content u-centered" style="width: 83%">
                            <font size="25" face="impact"><b>The Music Vault</b>  </font> 
	</li>

  <li class="c-nav__item c-nav__item--right">
   <a href="login2.html" style="margin: 0px; display: block; width: 100%; height: 100%; text-decoration: none; color: white">
  <i class="fa fa-sign-out"></i>Sign Out
  </a>
  </li>
  
</ul> 


<div class="container">

<br>
<br>

<form method="get" action="${pageContext.servletContext.contextPath}/RatingServlet" style="background:none; border:none"> 
 <div class="wrap">
   <div class="search">
   
      <input type="text" class="searchTerm" placeholder="Search Album" name="search">
      <button type="submit" class="searchButton" name="action" value="search">
        <i class="fa fa-search"></i>
     </button>
   
   </div>
</div>
  </form>


<hr>


<div class = "HomealbumTable"> <!-- albumTable; -->


 <c:forEach items="${ratingList}" var="rating"> <!-- forEachList Start -->
	
<c:set var="stringAlbum" value="${rating.albumName}" />
<c:set var="stringRemoveSpaces2" value="${fn:replace(stringAlbum,' ', '')}"/>
<c:set var="stringTrim" value="${fn:trim(stringRemoveSpaces2)}"/>


<form style="display:inline-block; padding: 10px; background:none; border:none" method = "post" action = "${pageContext.servletContext.contextPath}/RatingServlet">
<div class="HomealbumCell">	        
	      	   <input type ="hidden" value = "${rating.albumID}" name=albumID> <!-- This lets me set rating.albumID value to albumID variable for use in servlet -->
	      		<input type ="hidden" value = "${rating.totalScore}" name=totalScore>
	      		<input type ="hidden" value = "${rating.ratingAmt}" name=ratingAmt>
	      		<input type ="hidden" value = "${rating.albumArtist}" name=ratingArtist>
	 
	      	   <div>
	      	   	<img src="${pageContext.servletContext.contextPath}/albumImage3/${stringRemoveSpaces2}.jpg" alt="" width="100" height="100"> 
	      	   	</div>
	      	  
	      	 <div class="fit" style="width:100px;height:20px;">
	          	<a href="/CS157A//albumPageServlet?albumID=${rating.albumID}" class="c-link c-link--brand"> <c:out value="${rating.albumName}" /></a>
	          	<br>
	            <a href="/CS157A/artistPageServlet?ratingArtist=${rating.albumArtist}" class="c-link c-text--quiet"><c:out value="${rating.albumArtist}" /></a>
	   		</div>
	   
	<div style="padding-top:20px">
		     
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
			</div>
			
			<br>
				
			<span class="c-input-group c-input-group--rounded u-xsmall">
			  <button type="submit" class="c-button c-button--brand" name="action" value="submitRating">Rate</button>
			  <button type="submit" class="c-button c-button--info" name="action" value="deleteRating">Unrate</button>
			</span>
			
			
			<!--
						<div class="input-group" style = "display:inline-block">
							<button type="submit" class="btn" name="action" value="submitRating">Rate</button>
						</div>
						<div class="input-group" style = "display:inline-block">
							<button type="submit" class="btn" name="action" value="deleteRating">Unrate</button>
						</div>
							-->
						
				</div>		
				</form>  		
			</c:forEach>				
		
			
</div> <!-- albumTable -->



</div> <!-- Container -->
	    
	 
</body>
</html>