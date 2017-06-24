package supplier;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buy.SqlConnect;

/**
 * Servlet implementation class Delete_supplier_Servlet
 */
@WebServlet("/Delete_supplier_Servlet")
public class Delete_supplier_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_supplier_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SqlConnect s=new SqlConnect();
		String id=request.getParameter("id");
		String sql="delete from supplier where id="+id;
		//System.out.println(sql);
		try {
			s.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Êý¾Ý¿âÉ¾³ýÊ§°Ü");
		}
		String page=request.getParameter("ip");
		 request.getRequestDispatcher("/NewServlet"+"?page="+page).forward(request, response);
	}///suplier_manager/select_supplier.jsp

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
