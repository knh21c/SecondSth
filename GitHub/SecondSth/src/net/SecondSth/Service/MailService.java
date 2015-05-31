package net.SecondSth.Service;

public interface MailService {
	void sendMail(String from, String to, String subject, String text);
}
