

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class artistPageServlet
 */
@WebServlet("/artistPageServlet")
public class artistPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public artistPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			String queryArtistName = request.getParameter("ratingArtist");
			
			request.setAttribute("ratingArtist", queryArtistName);
			
			String queryStatement = "select * from albums where albumArtist = '"+queryArtistName+"' ";
			RatingListDAO ratingListDAO = new RatingListDAO();
			List<Album> ratingList = ratingListDAO.list(queryStatement);
			
	
			
			artistPageDAO ArtistPageDAO = new artistPageDAO();
			
			Artist artist = ArtistPageDAO.grabArtist(queryArtistName);
			
	
			
			request.setAttribute("artist", artist);
			
			request.setAttribute("ratingList", ratingList);
			request.getRequestDispatcher("artistProfile.jsp").forward(request, response);
			
			
		}catch(SQLException e)
		{
			 throw new ServletException("Cannot obtain ratings from DB", e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
