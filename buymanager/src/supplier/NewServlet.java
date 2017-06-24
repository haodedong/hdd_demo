package supplier;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buy.SqlConnect;

/**
 * Servlet implementation class NewServlet
 */
@WebServlet("/NewServlet")
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext application=this.getServletContext();
		int intpage=1; 
		int pagesize,count,pageCount;//,intpage;//每页的记录数，总记录，总页数，当前页
		pagesize=3;
		String ip=request.getParameter("page");
		//System.out.println(ip);
		//String ip="2";
	    if(ip==null){
		 intpage=1;
	 }else{
		 intpage=Integer.parseInt(ip);
	 }
	   // intpage=2;
	   // application.setAttribute("intpage", intpage);//
	 String sql="select * from supplier";
	 List<Supplier> list= new ArrayList<>();
	 try{
		 
	
			 SqlConnect SCd=new SqlConnect();
			 ResultSet rs=SCd.executeQuery(sql);
			
				rs.last();
			
			 count=rs.getRow();
			// request.setAttribute("count", count);
			 application.setAttribute("count", count);
			 pageCount=(count+pagesize-1)/pagesize;
			 //request.setAttribute("pageCount", pageCount);
			 application.setAttribute("pageCount", pageCount);
			 if(intpage>count){
				 intpage=count;
			 }
			 if(intpage>pageCount){
				 intpage--;
			 }
			 if(count>0){
				 rs.absolute((intpage-1)*pagesize+1);
			 }
			 int i=0;
			 
			 while(i<pagesize&&!rs.isAfterLast()){
				 int id=rs.getInt("id");
				 int se_num=rs.getInt("se_num");
				 String name=rs.getString("name");
				 String address=rs.getString("address");
				 String telephone=rs.getString("telephone");
				// System.out.println(name);
				list.add( new Supplier(id,se_num,name,address,telephone));
					
				
			 rs.next();
			 i++;
			 }
			 
	 }
	 
	 catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ffffffffffffffffffffffffffffffffffffffffff");
		}
	 HttpSession session =request.getSession() ;
	 //session.setAttribute("num",num);
	 //application.setAttribute("num",num);
	 application.setAttribute("intpage", intpage);
	 application.setAttribute("list", list);
	 application.setAttribute("ip", ip);
	 request.getRequestDispatcher("/suplier_manager/select_supplier.jsp").forward(request, response);
	// request.setAttribute("ip", ip);
	 //ServletContext application =this.getServletContext();
	
	// RequestDispatcher rd=application.getRequestDispatcher("suplier_manager/select_supplier.jsp");
	 //rd.forward(request, response);
	 //System.out.println("ffffffffff");
	 //response.sendRedirect("/../../supplier_manager/select_supplier.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
