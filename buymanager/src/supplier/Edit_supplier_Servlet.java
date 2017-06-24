package supplier;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import supplier.Supplier;
import buy.SqlConnect;
/**
 * Servlet implementation class Edit_supplier_Servlet
 */
@WebServlet("/Edit_supplier_Servlet")
public class Edit_supplier_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit_supplier_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		SqlConnect s=new SqlConnect();
		String id=request.getParameter("id");
		String ip=request.getParameter("ip");
		ServletContext application=this.getServletContext();
		String ss=request.getParameter("num");
		int num=Integer.parseInt(ss);
		//System.out.println( request.getParameter("num"));
		// int num=(int)application.getAttribute("num");
		 List<Supplier> list=(List)application.getAttribute("list"); 
		 Supplier sd=null;
		 sd=list.get(num);
		request.setAttribute("sd", sd);
		request.getRequestDispatcher("/suplier_manager/Edit_supplier.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
