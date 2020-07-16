package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dba.DBconfig;

public class Validateadmin {

	public Validateadmin() {
		// TODO Auto-generated constructor stub
	}
	public boolean validate(String username,String password)
	{ 

		 Connection conn= new DBconfig().getconnection();	
	
		 boolean status=false;
			try {	
					
					PreparedStatement ps=conn.prepareStatement("select uid  from admin where username=? and password=?");
				    ps.setString(1,username);  
				    ps.setString(2,password);		    	         
			        ResultSet rs=ps.executeQuery();
			        status=rs.next();
			    	
			      
			    conn.close();    
				} 
				catch (Exception e) {
					e.printStackTrace();
				}
			return status;
		
	}
	public int updateusername(String  newusername)
	{
		 Connection conn= new DBconfig().getconnection();	
		 int rs=-1;
		try {	
			
			java.sql.PreparedStatement stmt=conn.prepareStatement("update admin set  username=? where uid=1" );
			 
			stmt.setString(1,newusername);
			
			rs= stmt.executeUpdate();			    	
		conn.close();	
		} 
			catch (Exception e) {
				e.printStackTrace();
			}
		return rs;
	}
	public int updatepasssword(String  oldpass,String newpass)
	{
		if(oldpass.equals(newpass))
			return -1;
		
		 Connection conn= new DBconfig().getconnection();	
		 int rs=-1;
		
		 try {	
			
			java.sql.PreparedStatement stmt=conn.prepareStatement("update admin set password=? where uid=1" );
			 
			stmt.setString(1,newpass);
			
			rs= stmt.executeUpdate();			    	
		conn.close();	
		 } 
			catch (Exception e) {
				e.printStackTrace();
			}
		return rs;
	}

}
