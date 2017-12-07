<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src="jquery.js"></script>
 <script src="jquery.rating.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/main3.css">
  <link rel="stylesheet" href="blaze.min.css"> 
  <link rel="stylesheet" href="blaze.colors.min.css"> 

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

<c:set var="string" value="${album.albumName}" />
<c:set var="stringRemoveSpaces" value="${fn:replace(string,' ', '')}"/>


<div class="container">

<br>
<br>
<br>

	<div class="imagePosition">
	<img src="${pageContext.servletContext.contextPath}/albumImage3/${stringRemoveSpaces}.jpg" alt="" width="316" height="316"> 
	</div>
	<div class="descriptionBox"><!--  descriptionBox Container -->
	 <div class="u-xlarge padding"><c:out value= "${album.albumName}">NullAlbum</c:out> </div>
<div class="padding">

		<c:forEach var = "i" begin = "1" end = "5">
				<c:choose>
					<c:when test="${album.albumRating >= i}">
					<input type="radio" name="rating" value="1" class="star" checked="checked" disabled="disabled">
					</c:when>
					<c:otherwise>
					 <input type="radio" class="star"disabled="disabled">
					</c:otherwise>
				</c:choose>

		</c:forEach>
	</div>
				
		<div class="u-small">
			<font color="grey">
			 (<c:out value= "${album.ratingAmt}">Null</c:out> Users Rated)
			</font>
		 </div>
	 
	 <div class="u-large padding">
	 <a href="/CS157A/artistPageServlet?ratingArtist=${album.albumArtist}" class="c-link c-link--info">
	 	<c:out value= "${album.albumArtist}">NullArtist</c:out>
	 	</a>
	 </div>
	 <div class="u-medium padding">
	 	<c:out value= "${album.albumGenre}">NullGenre</c:out>
	 </div>
	  <div class="u-medium padding">
	 	<font color="grey"><c:out value= "${album.albumDate}">NullDate</c:out> </font>
	 </div>
	 
	 <form method ="post" action="albumPageServlet" style="background:none; border:none; margin-left: 0px">
	 <input type ="hidden" value = "${sessionScope.DalbumID}" name=DalbumID>
	
	<button type="submit" class="c-button c-button--ghost-error" name="action" value="delete">Delete</button>

	 </form>
	
	 <hr>
	<br>
	
	<div class="tableUI" >
			<table class="c-table c-table--striped ">
			  <caption class="c-table__caption">Song Titles</caption>
			  <thead class="c-table__head">
			  
			  </thead>
			   <tbody class="c-table__body">
				<c:forEach items="${songList}" var="song">
						<tr class="c-table__row">
							<td><c:out value= " ${song.songName}">NullSong</c:out></td>
				         </tr>
				    </c:forEach>
				    

			  </tbody>
			 </table>
			</div>

	</div>

</div>
</body>
</html>