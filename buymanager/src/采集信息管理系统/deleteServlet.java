package 采集信息管理系统;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteServlet
 */
@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ip=request.getParameter("ip");
		int ipp=Integer.parseInt(ip);
		String ID=request.getParameter("id");
		int id=Integer.parseInt(ID);
		//SELECT b.id,b.se_num,p.`name`,b.number,b.price,be.`name`,s.address from buy b,buyer be,product p,supplier s where b.buyer_id=be.id and b.prod_id=p.id and b.supp_id=s.id;"
		//String sql="delete  from buy b,buyer be,product p,supplier s where b.buyer_id=be.id and b.prod_id=p.id and b.supp_id=s.id and b.id ="+id;
		String sql="delete from buy where id="+id;
		SqlConnect SCd=new SqlConnect();
		try {
			boolean s=SCd.executeUpdate(sql);
			if(s)
			{
				response.sendRedirect("buy_manager.jsp?page="+ipp);
			}else
			{
				response.sendRedirect("buy_manager.jsp?page="+ipp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
