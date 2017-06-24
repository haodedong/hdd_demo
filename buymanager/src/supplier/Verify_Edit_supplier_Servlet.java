package supplier;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buy.SqlConnect;

/**
 * Servlet implementation class Verify_Edit_supplier_Servlet
 */
@WebServlet("/Verify_Edit_supplier_Servlet")
public class Verify_Edit_supplier_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verify_Edit_supplier_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		String se_num=request.getParameter("se_num");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String telephone=request.getParameter("telephone");
		String id=request.getParameter("id");
		String sql="update supplier set se_num ="+se_num+",name='"+name+"',address='"+address+"',telephone='"+telephone+"'where id="+id;
		//System.out.println(sql);
		SqlConnect S=new SqlConnect();
		try {
			S.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ServletContext application=this.getServletContext();
		int page=(int)application.getAttribute("intpage");
		request.getRequestDispatcher("/NewServlet"+"?page="+page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
