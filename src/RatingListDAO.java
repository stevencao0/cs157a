import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.sql.*;
// This is basically the stuff that interacts with Album
public class RatingListDAO {
	

	  public List<Album> list(String query,boolean mainPage) throws SQLException{
		  List<Album> ratingList = new ArrayList<Album>();
		  
		  try {
			  	Class.forName("com.mysql.jdbc.Driver");
			    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");

			    ResultSet rs;
			    
			    if(mainPage == true)
			    {
			    	 if(query.equals(""))
					    {
					    	Statement stmt = connect.createStatement();	
			
						    rs = stmt.executeQuery("select * from albums order by albumName ASC");
					    }
					    else
					    {
					    	PreparedStatement stmt = connect.prepareStatement("select * from albums where albumName like ? order by albumName ASC");
					    	
					    	 stmt.setString(1, "%" + query + "%");

					    	  rs= stmt.executeQuery();
					    }
			    }
			    else
			    {
			    	Statement stmt = connect.createStatement();	
			    	rs = stmt.executeQuery(query);
			    }
			    

			  //Using prepared statements allows us to use inputs as parameters instead of allowing user input directly into the mysql command.
			  //This can help avoid SQL Injection Attacks
			  
			
			    
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
			    	PreparedStatement ps = connect.prepareStatement( "Select * FROM ratingCheck WHERE userID =? AND albumID =?");
			    	// Using prepared statements allows us to use inputs as parameters instead of allows user input directly inputing into the mysql command.
			    	ps.setString(1, userID);
			    	ps.setInt(2, albumIDKey);
			    	
			    	ResultSet rs = ps.executeQuery();
			    	

			    	if( rs.next())
			    	{
			    		rating  = rs.getInt("rateValue");
			    	}
			    	
			    
			    	
			    	int newTotalScore = totalScore - rating;
			    	
			    	if(newTotalScore < 0)
			    	{
			    		newTotalScore = 0;
			    	}
			    	
			    	int newRatingAmt = ratingAmt - 1;
			    	
			    	if(newRatingAmt < 0)
			    	{
			    		newRatingAmt = 0;
			    	}

			    	int averageRating;
			    	if(newTotalScore == 0 && newRatingAmt == 0)
			    	{
			    		averageRating = 0;
			    	}
			    	else
			    	{
			    		 averageRating = (newTotalScore / newRatingAmt) + ((newTotalScore % newRatingAmt == 0) ? 0 : 1); //rounds up the average Rating
			    	}
			    		
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
			    	album.setAlbumID(rs.getInt("albumID"));
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
	  
	  public void search(String albumName)
	  {
		  try {
			  
			  Class.forName("com.mysql.jdbc.Driver");
			  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
			  PreparedStatement stmt = connect.prepareStatement("SELECT * FROM albums WHERE albumName like '%?%' ORDER BY albumName ASC;");

			  //Using prepared statements allows us to use inputs as parameters instead of allowing user input directly into the mysql command.
			  //This can help avoid SQL Injection Attacks.

			  stmt.setString(1,albumName); // first ?, username =?
			  ResultSet rs= stmt.executeQuery(); // executes the query/statement stmt to SQL
		  }catch(Exception e)
		  {
			  
		  }
	  }
	  
}
