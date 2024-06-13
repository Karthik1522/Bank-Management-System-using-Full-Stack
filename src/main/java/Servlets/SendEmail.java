package Servlets;

import java.util.Properties;
import java.util.Random;

import javax.mail.*;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Authenticator;
public class SendEmail {
	public String getRandom() {
		Random rn = new Random();
		int n = rn.nextInt(999999);
		
		return String.format("%06d",n);
		
	}
	
	
	public boolean sendEmail(User user) {
	    boolean test = false;

	    String toEmail = user.getEmail();
	    String fromEmail = "karthikarvapalli01@gmail.com";
	    String password = "echxekrqehswljyt";

	    try {
	        Properties properties = System.getProperties();
	        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
	        properties.setProperty("mail.smtp.port", "587"); // Gmail SMTP port (TLS)
	        properties.setProperty("mail.smtp.auth", "true"); // Enable authentication
	        properties.setProperty("mail.smtp.starttls.enable", "true"); // Enable STARTTLS encryption

	        Session session = Session.getInstance(properties, new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(fromEmail, password);
	            }

	        });

	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(fromEmail));
	        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

	        message.setSubject("User Email Verification");

	        message.setText("Registered Successfully. Please verify your account with this code " + user.getCode());
	        Transport.send(message);

	        test = true;

	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }
	    return test;
	}
}

