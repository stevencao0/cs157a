

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RatingServlet
 */
@WebServlet("/RatingServlet")
public class RatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String querySearch = "";
			String action = request.getParameter("action");
			
			if(action == null)
			{
				querySearch = "";
			}
			
			else if(action.equals("search"))
			{
				
				 querySearch = request.getParameter("search");
				 System.out.println("search: "+querySearch);
			}

			
			
			
			
			RatingListDAO ratingListDAO = new RatingListDAO();
			List<Album> ratingList = ratingListDAO.list(querySearch,true);
			request.setAttribute("ratingList", ratingList);
			
			
			String userID = (String)request.getSession().getAttribute("userID");
	    	
		
			request.getRequestDispatcher("RatingList.jsp").forward(request, response);
			
			
			
			
		}catch(SQLException e)
		{
			 throw new ServletException("Cannot obtain ratings from DB", e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RatingListDAO ratingUpdate = new RatingListDAO();
		String test = request.getParameter("rating");
		String userID = (String)request.getSession().getAttribute("userID");
		int rating;
		if(test == null)	// When reseting the rating, it returns null instead of 0, so this resets it correctly
		{
			rating = 0;
		}
		else
		{
			rating = Integer.parseInt(request.getParameter("rating"));
		}
		int albumID = Integer.parseInt(request.getParameter("albumID"));
		int totalScore = Integer.parseInt(request.getParameter("totalScore"));
		int ratingAmt = Integer.parseInt(request.getParameter("ratingAmt"));
		
		
		
		String action = request.getParameter("action");
		
		if(action.equals("submitRating"))
		{
			if(ratingUpdate.CheckHaveRatedFalse(userID, albumID, rating))
			{
			ratingUpdate.ratingUpdate(rating,totalScore,ratingAmt, albumID, action,userID);
			}
		}
		else if (action.equals("deleteRating"))
		{
			if(ratingUpdate.CheckHaveRatedTrue(userID, albumID, rating))
			{
			
			ratingUpdate.ratingUpdate(rating,totalScore,ratingAmt, albumID, action,userID);
			}
		}

		
		
		response.sendRedirect("/CS157A/RatingServlet");
		
	}

}
