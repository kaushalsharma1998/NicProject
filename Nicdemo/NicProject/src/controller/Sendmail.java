package controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Sendmail {

	int token;
	public Sendmail() {
		// TODO Auto-generated constructor stub
	}

	public int  gettoken()
	{ return this.token;
		
	}
	
	public boolean sendmail( String username)
	{  
		Random rand = new Random(); 
		  
        // Generate random integers in range 0 to 999 
        token = rand.nextInt(10000); 
        
  System.out.println(token);
		 
		 boolean status;
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
           return new PasswordAuthentication("gmail.com",
        		   "enter your password");  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(username));    
           message.setSubject("Password recovery NIC_demo" );    
           message.setText("Your otp for recovery is : "+token+ footer);
           
           		
           //send message  
           Transport.send(message);    
           status=true;
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {
        	  status=false;
        	  throw new RuntimeException(e);
          }    
             
     
		
		return status;
		
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
 //System.out.println(new Sendmail().sendmail("kaushalsharma1998@gmail.com"));
	}

}
