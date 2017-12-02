import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.sql.*;
// This is basically the stuff that interacts with Album
public class RatingListDAO {
	

	  public List<Album> list(String query) throws SQLException{
		  List<Album> ratingList = new ArrayList<Album>();
		  
		  try {
			  	Class.forName("com.mysql.jdbc.Driver");
			    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
			    Statement stmt = connect.createStatement();		
			    ResultSet rs = stmt.executeQuery(query);
			    
			    while(rs.next())
			    {
			    	Album rating = new Album();
			    	rating.setAlbumArtist(rs.getString("albumArtist"));
			    	rating.setAlbumName(rs.getString("albumName"));
			    	rating.setAlbumID(rs.getInt("albumID"));
			    	rating.setAlbumRating(rs.getInt("albumRating"));
			    	rating.setTotalScore(rs.getInt("totalScore"));
			    	rating.setRatingAmt(rs.getInt("ratingAmt"));
			    	ratingList.add(rating);
			    	
			    }
			    
		  }catch(Exception e)
		  {
			  System.out.println("Error at RatingList");
		  }
		  return ratingList;
	  }
		
	  public void ratingUpdate(int rating, int totalScore, int ratingAmt, int albumIDKey, String action, String userID)
	  {
		  try
		  {
			  	Class.forName("com.mysql.jdbc.Driver");
			    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
			    Statement stmt = connect.createStatement();		
			    
			    
			    if(action.equals("submitRating"))
			    {
			    	int newTotalScore = totalScore + rating;
			    	int newRatingAmt = ratingAmt + 1;
			    	int averageRating = (newTotalScore / newRatingAmt) + ((newTotalScore % newRatingAmt == 0) ? 0 : 1); //rounds up the average Rating
			    	int i = stmt.executeUpdate("Update albums SET albumRating = '"+(averageRating)+"',totalScore='"+(newTotalScore)+"',ratingAmt='"+(newRatingAmt)+"' where albumID = '"+albumIDKey+"' ");
			    }
			    
			    if(action.equals("deleteRating"))
			    {
			    	ResultSet rs = stmt.executeQuery("Select * FROM ratingCheck WHERE userID ='"+userID+"' AND albumID ='"+albumIDKey+"'");
			    	System.out.println("Test deleteRatingQuery");
			    	rating = rs.getInt("rateValue");
			    	
			    	int newTotalScore = totalScore - rating;
			    	int newRatingAmt = ratingAmt - 1;
			    	int averageRating = (newTotalScore / newRatingAmt) + ((newTotalScore % newRatingAmt == 0) ? 0 : 1); //rounds up the average Rating
			    	int i = stmt.executeUpdate("Update albums SET albumRating = '"+(averageRating)+"',totalScore='"+(newTotalScore)+"',ratingAmt='"+(newRatingAmt)+"' where albumID = '"+albumIDKey+"' ");
			    }

			    
		  }catch(Exception e)
		  {
			  System.out.println("Error at RatingListUpdate");
		  }
	  }
	  
	  
	  public boolean CheckHaveRatedFalse(String userID, int albumID,int rateValue)
	  { 
		 
		  try
		  {
			  ResultSet rs;
			  	Class.forName("com.mysql.jdbc.Driver");
			    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
			    Statement stmt = connect.createStatement();	
			    
			    
			    rs = stmt.executeQuery("Select * FROM ratingCheck WHERE userID ='"+userID+"' AND albumID ='"+albumID+"' AND haveRated ='1'");
			    
			    boolean check =rs.next(); // false 0 rows
			  
			  
			    
			    if( check == false) // if user found and his haveRated = 0
			    {
			    
			    	int i= stmt.executeUpdate("INSERT INTO ratingCheck (userID,albumID,haveRated,rateValue)VALUES ('"+userID+"', '"+albumID+"','1','"+rateValue+"') ON DUPLICATE KEY UPDATE haveRated = '1',rateValue='"+rateValue+"'");
			    	
	
			    
			    	return true;
			    }
			    else
			    {
			    	
			    	
			    	return false;
			    }
			  
			    
		  }catch(Exception e)
		  {
			  System.out.println("Error at CheckHaveRatedFalse");
		  }
		  
		return false;
	  }
	  
	  public boolean CheckHaveRatedTrue(String userID, int albumID,int rateValue)
	  { 
		 
		  try
		  {
			  ResultSet rs;
			  	Class.forName("com.mysql.jdbc.Driver");
			    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
			    Statement stmt = connect.createStatement();	
			    
			    
			    rs = stmt.executeQuery("Select * FROM ratingCheck WHERE userID ='"+userID+"' AND albumID ='"+albumID+"' AND haveRated ='1'");
			  
			    
			    boolean check =rs.next(); // false 0 rows
			  
			  
			    
			    if( check == true) // if user found and his haveRated = 0
			    {
			    
			    	int i = stmt.executeUpdate("Update ratingCheck SET haveRated = '0' WHERE userID ='"+userID+"' AND albumID ='"+albumID+"'");
			    
			    	return true;
			    }
			    else
			    {
			    	
			    	
			    	return false;
			    }
			  
			    
		  }catch(Exception e)
		  {
			  System.out.println("Error at CheckHaveRatedTrue");
		  }
		  
		return false;
	  }
	  
	 
	  
	  
	  public Album grabAlbum(String albumID) throws SQLException
	  {
		  Album album = new Album();
		  
		  try {
			  	Class.forName("com.mysql.jdbc.Driver");
			    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
			    Statement stmt = connect.createStatement();		
			    ResultSet rs = stmt.executeQuery("SELECT * from albums where albumID='"+albumID+"'");
			    
			    while(rs.next())
			    {
			    	album.setAlbumArtist(rs.getString("albumArtist"));
			    	album.setAlbumName(rs.getString("albumName"));
			    	album.setAlbumRating(rs.getInt("albumRating"));
			    	album.setTotalScore(rs.getInt("totalScore"));
			    	album.setRatingAmt(rs.getInt("ratingAmt"));
			    	album.setAlbumDate(rs.getString("albumDate"));
			    	album.setAlbumGenre(rs.getString("albumGenre"));
    	
			    }
			    
		  }catch(Exception e)
		  {
			  System.out.println("Error at RatingList grabAlbum");
		  }
		  
		  return album;
	  }
}
