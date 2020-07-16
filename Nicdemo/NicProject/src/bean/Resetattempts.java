package bean;

import java.sql.Connection;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Resetattempts {

	public Resetattempts() {
		// TODO Auto-generated constructor stub
	}

	public int resetattempts(String username)

	{
		int rs = 0;
		String random = randompass();
		Connection conn = new dba.DBconfig().getconnection();
		try {

			java.sql.PreparedStatement stmt = conn.prepareStatement("update user set  attempts=3, password=? where username=?");

			stmt.setString(2, username);

			stmt.setString(1, random);

			rs = stmt.executeUpdate();
			conn.close();
			
		} catch (Exception e) {
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
        try {    
         MimeMessage message = new MimeMessage(session);    
         message.addRecipient(Message.RecipientType.TO,new InternetAddress(username));    
         message.setSubject("Password recovery NIC_demo" );    
         message.setText("The password is  : "+random+". Please change your password once you login , this will expire in 2 hrs"+ footer);
         
         		
         //send message  
         Transport.send(message);    
         
         System.out.println("message sent successfully");    
        } catch (MessagingException e) {
      	  
      	  throw new RuntimeException(e);
        }    
           
   
		
	
		
		
		
		
		
		
		return rs;

	}

	private String randompass() {
		// TODO Auto-generated method stub

		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";

// create StringBuffer size of AlphaNumericString 
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < 6; i++) {

// generate a random number between 
// 0 to AlphaNumericString variable length 
			int index = (int) (AlphaNumericString.length() * Math.random());

// add Character one by one in end of sb 
			sb.append(AlphaNumericString.charAt(index));
		}

		return sb.toString();
	}
public static void main(String args[])
{// System.out.println(new Resetattempts().resetattempts("kaushalsharma1998@gmail.com"));
	}
}
