package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dba.DBconfig;



public class Validator {
	Connection conn;	
	public int validator(String username,  String password) throws SQLException
	{   
	 
		conn= new DBconfig().getconnection();	
	  int attempts=-20;
		 boolean status=false;
			try {	
					
					PreparedStatement ps=conn.prepareStatement("select attempts  from user where username=?");
				    ps.setString(1,username);  
				    		    	         
			        ResultSet rs=ps.executeQuery();
			        status=rs.next();
			    	
			       if(status)
			        	attempts=rs.getInt("attempts");
			        
				} 
				catch (Exception e) {
					e.printStackTrace();
				}
			
			if(attempts==0) { try {
				 conn.close();
				 return 20; 
			} 
			  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			}
			
			if(status==true)
			{
				boolean statusup=false;
				try {	
						
						PreparedStatement ps=conn.prepareStatement("select  attempts from user where username=? and password=?");
					    ps.setString(1,username);  
					    ps.setString(2,password);		    	         
				        ResultSet rs=ps.executeQuery();
				        statusup=rs.next();
				        
				    	
					} 
					catch (Exception e) {
						e.printStackTrace();
					}
				if(statusup==true)
				{   try {	
					
					java.sql.PreparedStatement stmt=conn.prepareStatement("update user set  attempts=3 where username=?" );
					 
					stmt.setString(1,username);
					
					 stmt.executeUpdate();			    	
					} 
					catch (Exception e) {
						e.printStackTrace();
					}
				conn.close();	
				return 10;
				}
				
				else {
					int rs=0;
					
					try {	
						
						java.sql.PreparedStatement stmt=conn.prepareStatement("update user set  attempts=attempts-1 where username=?" );
						 
						stmt.setString(1,username);
						
						rs = stmt.executeUpdate();			    	
						} 
						catch (Exception e) {
							e.printStackTrace();
						}
					
					
					conn.close();
					if(attempts-1==0)
						return 20;
					else
					return attempts-1;
				} 
					
					
					
			}
			
			else 
			{ conn.close();
				return -2;
			}
		
	}
	
	public  int  captchaattempts( String username) throws SQLException
	{ 
		
		conn= new DBconfig().getconnection();	
		  int attempts=-20;
		  
			 boolean status=false;
				try {	
						
						PreparedStatement ps=conn.prepareStatement("select attempts  from user where username=? ");
					    ps.setString(1,username);  
					    	    	         
				        ResultSet rs=ps.executeQuery();
				        status=rs.next();
				    	
				        	if(status)
				        	attempts=rs.getInt("attempts");
				        
					} 
					catch (Exception e) {
						e.printStackTrace();
					}
				
				if(attempts==0)
					return 20;
				
				
				
				int rs=0;
				if(status) {
				try {	
					
					java.sql.PreparedStatement stmt=conn.prepareStatement("update user set  attempts=attempts-1 where username=?" );
					 
					stmt.setString(1,username);
					
					rs = stmt.executeUpdate();			    	
					conn.close();	
				} 
					catch (Exception e) {
						e.printStackTrace();
					}
				
				
				
				if(attempts-1==0)
					return 20;
				else 
				return attempts-1;
				}
				else 
				{	conn.close();
					return -2;}
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	 //.out.println( new Validator().);
	}

}
