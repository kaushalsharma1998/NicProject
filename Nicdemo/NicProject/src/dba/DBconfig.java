package dba;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconfig {
	Connection conn;
	public Connection getconnection( )
	{
		try
		{
	    Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nicdb","root","root");
		System.out.println("Connected..");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		 return conn;
     	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
