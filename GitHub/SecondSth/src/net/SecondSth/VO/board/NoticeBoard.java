package net.SecondSth.VO.board;

import java.sql.Date;

//CREATE TABLE noticeboard (id BIGINT NOT NULL AUTO_INCREMENT, email VARCHAR(50) NOT NULL, nick TEXT NOT NULL, pw TEXT NOT NULL, title TEXT NOT NULL, date DATETIME, hit BIGINT, content LONGTEXT NOT NULL, PRIMARY KEY(id));

public class NoticeBoard {
	private int id;
	private String email;
	private String nick;
	private String pw;
	private String title;
	private Date date;
	private long hit;
	private String content;
	
	public NoticeBoard(){
		
	}
	public NoticeBoard(int id, String email, String nick, String pw,
			String title, Date date, long hit, String content) {
		super();
		this.id = id;
		this.email = email;
		this.nick = nick;
		this.pw = pw;
		this.title = title;
		this.date = date;
		this.hit = hit;
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NoticeBoard [id=");
		builder.append(id);
		builder.append(", email=");
		builder.append(email);
		builder.append(", nick=");
		builder.append(nick);
		builder.append(", pw=");
		builder.append(pw);
		builder.append(", title=");
		builder.append(title);
		builder.append(", date=");
		builder.append(date);
		builder.append(", hit=");
		builder.append(hit);
		builder.append(", content=");
		builder.append(content);
		builder.append("]");
		return builder.toString();
	}
}
