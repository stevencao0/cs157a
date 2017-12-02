import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class artistPageDAO {

	Artist grabArtist(String artistName) // using artistName as a key
	{
		Artist artist = new Artist();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
		    Statement stmt = connect.createStatement();		
		    ResultSet rs = stmt.executeQuery("SELECT * from artists where artistName='"+artistName+"'");
		    
		    while(rs.next())
		    {
		    	artist.setArtistName(rs.getString("artistName"));
		    	artist.setArtistDate(rs.getString("artistDate"));
		    	artist.setArtistGenre(rs.getString("artistGenre"));
		    	artist.setArtistOrigin(rs.getString("artistOrigin"));
		    	artist.setArtistLabels(rs.getString("artistLabels"));
		    	artist.setBioText(rs.getString("bioText"));
		    
		    }
			
		}catch(Exception e)
		{
			System.out.println("Error at artistPageDAO");
		}
		
		return artist;
	}
}
