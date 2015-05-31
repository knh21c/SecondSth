package net.SecondSth.VO.member;

import java.util.Date;

//CREATE TABLE member (email VARCHAR(50) NOT NULL, nick TEXT NOT NULL, phone TEXT NOT NULL, pw TEXT NOT NULL, administrator TINYINT, signUpDate DATETIME, PRIMARY KEY(email));

public class MemberVo {
	private String email;
	private String nick;
	private String phone;
	private String pw;
	private Date signUpDate;
	private char administrator;
	
	public MemberVo() {
		super();
	}

	public MemberVo(String email, String nick, String phone, String pw,
			Date signUpDate, char administartor) {
		super();
		this.email = email;
		this.nick = nick;
		this.phone = phone;
		this.pw = pw;
		this.signUpDate = signUpDate;
		this.administrator = administartor;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public Date getSignUpDate() {
		return signUpDate;
	}

	public void setSignUpDate(Date signUpDate) {
		this.signUpDate = signUpDate;
	}
	
	public char getAdministrator() {
		return administrator;
	}
	
	public void setAdministrator(char administrator) {
		this.administrator = administrator;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberVo [email=");
		builder.append(email);
		builder.append(", nick=");
		builder.append(nick);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", pw=");
		builder.append(pw);
		builder.append(", signUpDate=");
		builder.append(signUpDate);
		builder.append(", administrator=");
		builder.append(administrator);
		builder.append("]");
		return builder.toString();
	}
}
