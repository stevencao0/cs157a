<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
        <link rel="stylesheet" href="main3.css">
        <script src="jquery.js"></script>
        <script src="jquery.rating.js"></script>
        <script src="jquery.min.js"></script>
		<script src="jquery.textfill.min.js"></script>
        
        

        
        
     <link rel="stylesheet" href="blaze.min.css"> 
  	<link rel="stylesheet" href="blaze.colors.min.css"> 
						<!-- https://www.blazeui.com/getting-started/install -->
   <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/font-awesome-4.7.0/css/font-awesome.min.css">
        
</head>
<body>

<ul class="c-nav c-nav--inline">

  <li class="c-nav__item">
  <a href="/CS157A/RatingServlet" style="margin: 0px; display: block; width: 100%; height: 100%; text-decoration: none; color: white">
  <i class="fa fa-home">
  </i> 
  Home
   </a>
   </li>
   
   <li class="c-nav__content u-centered" style="width: 81%">
                            <font size="25" face="impact"><b>The Music Vault</b>  </font> 
	</li>

  <li class="c-nav__item c-nav__item--right">
   <a href="login2.html" style="margin: 0px; display: block; width: 100%; height: 100%; text-decoration: none; color: white">
  <i class="fa fa-sign-out"></i>Sign Out
  </a>
  </li>
  
</ul> 


<c:set var="string" value="${artist.artistName}" />
<c:set var="stringRemoveSpaces" value="${fn:replace(string,' ', '')}"/>


<div class="container">

<br>
<br>
<br>

<div class="imagePosition">
	<img src="${pageContext.servletContext.contextPath}/artistImage3/${stringRemoveSpaces}.jpg" alt="" width="316" height="316"> 
</div>
<div class="descriptionBox"><!--  descriptionBox Container -->
	 <div class="u-super padding"><c:out value= "${artist.artistName}">NullArtist</c:out> </div>
	 <hr>
	 
	 <div class="u-small padding">
	 	<c:out value= "${artist.bioText}">NullBio</c:out>
	 </div>
	 
	 <hr>
	
</div>

<div class="emptyBox">
	 <hr>
	 
	<div class="u-small">
	
	<div class= infoBoldColor>
		<b>ORIGIN</b>
	</div>
		<br>
		<div class= u-large>
	 	<c:out value= "${artist.artistOrigin}">NullOrigin</c:out>
	 	</div>
	 	<hr>
	 	
	 	<div class= infoBoldColor>
	 	<b>GENRE</b>
	 	</div>
	 	
		<br>
		<div class= u-large>
	 	<c:out value= "${artist.artistGenre}">NullOrigin</c:out>
	 	</div>
	 	<hr>
	 	
	 	<div class= infoBoldColor>
	 	<b>YEARS ACTIVE</b>
	 	</div>
	 	
		<br>
		<div class= u-large>
	 	<c:out value= "${artist.artistDate}">NullOrigin</c:out>
	 	</div>
	 	<hr>
	 	
	 	<div class= infoBoldColor>
	 	<b>LABELS</b>
	 	</div>
	 	
		<br>
		<div class= u-large>
	 	<c:out value= "${artist.artistLabels}">NullOrigin</c:out>
	 	</div>
	 	<hr>
	 </div>
	 
	</div> <!-- emptyBox -->








<div class = "albumTable"> <!-- albumTable; -->
 
<c:forEach items="${ratingList}" var="rating">
	
	

	
<c:set var="stringAlbum" value="${rating.albumName}" />
<c:set var="stringRemoveSpaces2" value="${fn:replace(stringAlbum,' ', '')}"/>
<c:set var="stringTrim" value="${fn:trim(stringRemoveSpaces2)}"/>

<form style="display:inline-block; padding: 10px; background:none; border:none">
<div class="albumCell">	        
	      	   <input type ="hidden" value = "${rating.albumID}" name=albumID> 
	      		<input type ="hidden" value = "${rating.totalScore}" name=totalScore>
	      		<input type ="hidden" value = "${rating.ratingAmt}" name=ratingAmt>
	        
 		
	      	   <div>
	      	   <a  href="/CS157A//albumPageServlet?albumID=${rating.albumID}">
	      	   	<img src="${pageContext.servletContext.contextPath}/albumImage3/${stringTrim}.jpg" alt="" width="100" height="100"> 
	      	   	 </a>
	      	   	</div>
	      	
	      	 <div class="fit" style="width:100px;height:20px">
	      	 <a href="/CS157A//albumPageServlet?albumID=${rating.albumID}" class="c-link c-link--brand">
	           <c:out value="${rating.albumName}" />
	           </a>
	   		</div>
	  
		     
		    <c:forEach var = "i" begin = "1" end = "5">
					<c:choose>
						<c:when test="${rating.albumRating >= i}">
						<input type="radio" name="rating" value="1" class="star" checked="checked" disabled="disabled">
						</c:when>
						<c:otherwise>
						 <input type="radio" class="star"disabled="disabled">
						</c:otherwise>
					</c:choose>
			</c:forEach>
	
			
	</div>	
	</form>           
	    </c:forEach>
	
 
</div>
	  


</div> <!-- ContainerBox -->



</body>
</html>