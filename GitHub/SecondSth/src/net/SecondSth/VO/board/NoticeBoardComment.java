package net.SecondSth.VO.board;

import java.sql.Date;

//CREATE TABLE noticecomment (id BIGINT NOT NULL AUTO_INCREMENT, nick TEXT NOT NULL, comment LONGTEXT NOT NULL, date DATETIME, PRIMARY KEY(id));

public class NoticeBoardComment {
	private int id;
	private String nick;
	private String comment;
	private Date date;
	public NoticeBoardComment() {
		super();
	}
	public NoticeBoardComment(int id, String nick, String comment, Date date) {
		super();
		this.id = id;
		this.nick = nick;
		this.comment = comment;
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NoticeBoardComment [id=");
		builder.append(id);
		builder.append(", nick=");
		builder.append(nick);
		builder.append(", comment=");
		builder.append(comment);
		builder.append(", date=");
		builder.append(date);
		builder.append("]");
		return builder.toString();
	}
}
