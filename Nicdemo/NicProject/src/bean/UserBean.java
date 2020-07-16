package bean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import dba.*;
public class UserBean {

	String firstname;
	String lastname;
	String address;
	String gender;
	int age;
	String email;
	String password;
	Connection conn=null;
	public   UserBean() {
	
//		try
//		{
//	    Class.forName("com.mysql.jdbc.Driver");
//		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nicdb","root","root");
//		System.out.println("Connected..");
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}	
//	
    
	}
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public  int insert() throws SQLException
	{ int rs=0;
	
	conn= new DBconfig().getconnection();	 
	try
		 { 
		
			 java.sql.PreparedStatement stmt=conn.prepareStatement("Insert into user values (?,?,?,?,?,?,?,?)" );
		 
		stmt.setString(1,email);
		stmt.setString(2,firstname);
		stmt.setString(3,lastname);
		stmt.setString(4,password);
		stmt.setString(5,address);
		stmt.setString(6,gender);
		stmt.setInt(7,age);
		stmt.setInt(8, 3);
		rs = stmt.executeUpdate();
		
		
		 }  catch (Exception e)
			{ System.err.println(e);}
	try
	 { 
	
		 java.sql.PreparedStatement stmt=conn.prepareStatement("Insert into passwords(username, passwordzero, counter) values (?,?,?)" );
	 
	 stmt.setString(1,email);
	 stmt.setString(2, password);
	 stmt.setInt(3, 1);
	 rs = stmt.executeUpdate();
	 }
	catch (Exception e)
	{ System.err.println(e);}

	 
	conn.close();
	return rs;
	
	}
public static void main(String args[])
{
	//new UserBean();
	}
}
