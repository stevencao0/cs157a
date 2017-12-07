import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class albumPageDAO {

	 public List<Songs> list(String query) throws SQLException{
		  List<Songs> songList = new ArrayList<Songs>();
		  
		  try {
			  	Class.forName("com.mysql.jdbc.Driver");
			    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
			    Statement stmt = connect.createStatement();		
			    ResultSet rs = stmt.executeQuery(query);
			    
			    while(rs.next())
			    {
			    	Songs song = new Songs();
			    	song.setSongArtist(rs.getString("songArtist"));
			    	song.setSongName(rs.getString("songName"));
			    	songList.add(song);
			    }
			    
		  }catch(Exception e)
		  {
			  System.out.println("Error at songList");
		  }
		  return songList;
	  }
	 
	 public void deleteAlbum(int albumID)
	 {
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
			    Statement stmt = connect.createStatement();		
			    int i = stmt.executeUpdate("DELETE FROM albums WHERE albumID='"+albumID+"'");
			 
		 }catch (Exception e)
		 {
			 System.out.println("Error at deleteAlbum");
		 }
	 }

}
