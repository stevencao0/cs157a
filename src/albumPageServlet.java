

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class albumPageServlet
 */
@WebServlet("/albumPageServlet")
public class albumPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public albumPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
try {
			String queryAlbumID = request.getParameter("albumID");
			
		
			String queryStatement = "select * from songs where albumID = '"+queryAlbumID+"' ";
			albumPageDAO songListDAO = new albumPageDAO();
			List<Songs> songList = songListDAO.list(queryStatement);
		
			request.setAttribute("songList", songList);
			
			RatingListDAO RatingListDAO = new RatingListDAO();
			Album album = RatingListDAO.grabAlbum(queryAlbumID);
			
			request.setAttribute("album", album);
			
			request.getRequestDispatcher("albumProfile.jsp").forward(request, response);
				
		}catch(SQLException e)
		{
			 throw new ServletException("Cannot obtain songs from DB", e);
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
