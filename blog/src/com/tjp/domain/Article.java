package com.tjp.domain;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Article {
	private String aid;
	private String title;
	private String content;
	private String tag;
	private String person_classify;
	private String type;
	private String all_classify;
	private String status;
	private String uid;
	private String time;
	private String username;
	private int readCount;
	private int commentCount;
	private String summary;
	public Article() {
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getPerson_classify() {
		return person_classify;
	}
	public void setPerson_classify(String person_classify) {
		this.person_classify = person_classify;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAll_classify() {
		return all_classify;
	}
	public void setAll_classify(String all_classify) {
		this.all_classify = all_classify;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	public void setSummary(String summary) {
		if (content != null) {
			Pattern pattern = Pattern.compile("<\\/?((?).)*?\\/?>"); 
			Matcher matcher = pattern.matcher(content);      
			String result = matcher.replaceAll(""); 
			pattern = Pattern.compile("&[a-z]*;");
			matcher = pattern.matcher(result);
			result = matcher.replaceAll("");
			this.summary = result;
		} else {
			this.summary = null;
		}
	}
	public String getSummary() {
		return this.summary;
	}
	@Override
	public String toString() {
		return "Article [aid=" + aid + ", title=" + title + ", content=" + content + ", tag=" + tag
				+ ", person_classify=" + person_classify + ", type=" + type + ", all_classify=" + all_classify
				+ ", status=" + status + ", uid=" + uid + ", time=" + time + ", username=" + username + ", readCount="
				+ readCount + ", commentCount=" + commentCount + "]";
	}
	
}
