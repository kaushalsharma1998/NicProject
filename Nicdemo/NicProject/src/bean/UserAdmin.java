package bean;
import bean.UserAdminBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class UserAdmin {


	public ArrayList<UserAdminBean> getAllusers()
	{   ArrayList<UserAdminBean>list=new ArrayList<UserAdminBean>();
		
		Connection conn= new dba.DBconfig().getconnection();
		
		 boolean status=false;
			try {	
					
					PreparedStatement ps=conn.prepareStatement("select firstname,lastname,address,username,age,attempts,gender from user");
				    ResultSet rs=ps.executeQuery();
			        
			    	while(rs.next())
			    	{ 	UserAdminBean u=new UserAdminBean();
			    		u.firstname=rs.getString("firstname");
			    		u.lastname=rs.getString("lastname");
			    		u.address=rs.getString("address");
			    		u.username=rs.getString("username");
			    		u.age=rs.getInt("age");
			    		u.attempts=rs.getInt("attempts");
			    		u.gender=rs.getString("gender");
			    		list.add(u);
			    	} 
			conn.close();    
			}
				catch (Exception e) {
					e.printStackTrace();
				}
			
		return list;
	}
	
//	public static void main(String args[])
//			{
//		System.out.println(new UserAdmin().getAllusers());
//
//			}
}
