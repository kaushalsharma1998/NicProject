package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Updatepassword {

	public Updatepassword() {
		// TODO Auto-generated constructor stub
	}

	public  int updatepassword(String username, String newpassword, String oldpassword) 
	{
		Connection conn= new dba.DBconfig().getconnection();
		int count = 0;
		String password0 = null,password1 = null,password2 = null;
		 boolean status=false;
			try {	
					
					PreparedStatement ps=conn.prepareStatement("select *  from passwords where username=?");
				    ps.setString(1,username);  
				    		    	         
			        ResultSet rs=ps.executeQuery();
			        status=rs.next();
			    	
			       
			        	count=rs.getInt("counter")%3;
			        	System.out.println(count);
			        	password0=rs.getString("passwordzero");
			        	password1=rs.getString("passwordone");
			        	password2=rs.getString("passwordtwo");
			        	
				} 
				catch (Exception e) {
					e.printStackTrace();
				}
			
		if(newpassword.equals(password0)||newpassword.equals(password1)||newpassword.equals(password2))
		{ try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return -20;
		}
			if(count==0)
			{
try {	
					
						java.sql.PreparedStatement stmt=conn.prepareStatement("update passwords set  counter=counter+1 , passwordzero=? where username=?" );
	 
						stmt.setString(2,username);
						stmt.setString(1, newpassword);
						stmt.executeUpdate();		} 
								catch (Exception e) {
						e.printStackTrace();
					}	
			}
			else if(count==1)
			{
try {	
					
					java.sql.PreparedStatement stmt=conn.prepareStatement("update passwords set  counter=counter+1, passwordone=? where username=?" );
	 
					stmt.setString(2,username);
					stmt.setString(1, newpassword);
					stmt.executeUpdate();	
						    	
					} 
					catch (Exception e) {
						e.printStackTrace();
					}
			}
			else
			{
try {	
					
					java.sql.PreparedStatement stmt=conn.prepareStatement("update passwords set  counter=counter+1 , passwordtwo=? where username=?" );
					 
					stmt.setString(2,username);
					stmt.setString(1, newpassword);
					 stmt.executeUpdate();			    	
					} 
					catch (Exception e) {
						e.printStackTrace();
					}
				
			}
			
			try {	
				
				java.sql.PreparedStatement stmt=conn.prepareStatement("update user  set  password=?  where username=?" );
				 
				stmt.setString(2,username);
				stmt.setString(1, newpassword);
				 stmt.executeUpdate();			    	
				} 
				catch (Exception e) {
					e.printStackTrace();
				}
			
		
			
			
			
			
			
			
			
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			return 1;
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
  
	//System.out.println( new Updatepassword().updatepassword("kaushalsharma1998@gmail.com", "qwertyfour", "qwerty"));
	}

}
