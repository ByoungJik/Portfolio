package com.test.member;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class SendEmail {


	public String connect(String email) {
		
		
		try {
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.trust", "smtp.gmail.com");


			
			Session session = Session.getInstance(props, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("tripnowauth@gmail.com", "ztqrbefjxefuzozg");
				}
			});

			
			String receiver = email;
			String title = "TripNow 인증 코드";
			String authNum = authNum();
			String content = "<h2>안녕하세요, TripNow 인증 번호는 [" + authNum + "] 입니다.</h2>";
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("tripnowauth@gmail.com", "관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=utf-8");
			
			Transport.send(message);
			return authNum;
			
		} catch (Exception e) {
			System.out.println("SendEmail.connect");
			e.printStackTrace();
		}
		
		return null;
	}
	

	public static String authNum() {
		
		String code = "";
		
		for (int i=0 ; i<=4 ; i++) {
			int num = (int)(Math.random()*9+1);
			code = code + num; 
		}
		
		return code;
	}
	
}
