package 采集信息管理系统;
import java.sql.*;
public class SqlConnect{
	//String dbdriver="sun.jdbc.odbc.JdbcOdbcDriver";;
	//String dbdriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	  String dbdriver="com.mysql.jdbc.Driver";
	//String connstr="jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ=/aaa.mdb ";
	String connstr = "jdbc:mysql://127.0.0.1/�ɹ���Ϣ����";
	Connection conn= null;
	Statement stmt=null;
	ResultSet rs= null;
	int a;
	public SqlConnect(){
		try{
			Class.forName(dbdriver);
		}catch(java.lang.ClassNotFoundException e){
			System.err.println("SqlConnect(): " + e.getMessage());
		      }
		
	}
	public ResultSet executeQuery(String sql) {
		rs=null;
		try{
			conn=DriverManager.getConnection(connstr,"root","1234");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(SQLException ex){
			System.err.println("executeQuery: " + ex.getMessage());
		      }
		return rs;
	}
	
	
	public boolean executeUpdate(String sql) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int intReturn=0;

		try {
			// database connection
			conn=DriverManager.getConnection(connstr,"root","1234");
			// Statement is created and excuted
			stmt = conn.createStatement();
			intReturn = stmt.executeUpdate(sql);
			if (intReturn == 0) {
				// It have been updated by another user.
				return false;
			}
		} catch (Exception e) {
			System.err.println("aq.executeQuery: " + e.getMessage());
		} finally {
			finallyFunction(conn, stmt, null);
		}
		return true;
	}
	protected void finallyFunction(Connection dbconn, Statement stmt,
			ResultSet rsResult) {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (rsResult != null) {
				rsResult.close();
				rsResult = null;
			}
			if (dbconn != null) {
				dbconn.close();
				dbconn = null;
			}
		} catch (Exception e) {
			e.getMessage();
		}
	}

}