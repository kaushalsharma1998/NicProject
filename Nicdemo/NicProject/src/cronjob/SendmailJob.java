package cronjob;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendmailJob {

	ArrayList<String>user=new ArrayList<>();
	public SendmailJob() {
		// TODO Auto-generated constructor stub
	}

	public  void sendmail()
	{
		Connection conn= new dba.DBconfig().getconnection();
		int count = 0;
		
		 boolean status=false;
			try {	
					
					PreparedStatement ps=conn.prepareStatement("select username from passwords where DATE(`timestamp`) <= CURDATE()-14");
				    		    	                         
			        ResultSet rs=ps.executeQuery();
			        while(rs.next())
			        {
			        	user.add(rs.getString("username"));
			        }
			    	
			        java.sql.PreparedStatement stmt=conn.prepareStatement("update user set  attempts=0 where username=?" );
			        for(int i =0; i<user.size();i++) 
					{stmt.setString(1,user.get(i));
					 int rsp = stmt.executeUpdate();
					}			    	
					 conn.close();	  
			       
			        	
				} 
				catch (Exception e) {
					e.printStackTrace();
				}
			
		
			String footer=System.lineSeparator()+System.lineSeparator()+System.lineSeparator()+"Regards"+System.lineSeparator()+"Kaushal Sharma";
			  Properties props = new Properties();    
	          props.put("mail.smtp.host", "smtp.gmail.com");    
	          props.put("mail.smtp.socketFactory.port", "465");    
	          props.put("mail.smtp.socketFactory.class",    
	                    "javax.net.ssl.SSLSocketFactory");    
	          props.put("mail.smtp.auth", "true");    
	          props.put("mail.smtp.port", "465");    
	          //get Session   
	          Session session = Session.getDefaultInstance(props,    
	           new javax.mail.Authenticator() {    
	           protected PasswordAuthentication getPasswordAuthentication() {    
	           return new PasswordAuthentication("email",
	        		   "password");  
	           }    
	          });    
	          //compose message    
	          for(int i =0; i<user.size();i++)
	          {
	          try {    
	           MimeMessage message = new MimeMessage(session);    
	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(user.get(i)));    
	           message.setSubject("Password recovery NIC_demo" );    
	           message.setText("Your password has expired  pls contact admin  "+footer);
	           
	           		
	           //send message  
	           Transport.send(message);    
	           status=true;
	           System.out.println("message sent successfully");    
	          } catch (MessagingException e) {
	        	  status=false;
	        	  throw new RuntimeException(e);
	          }    
	             
	     
	          }
		
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
