package com.baizhi.auction.entity;

import java.io.Serializable;

public class AuctionUser implements Serializable {
	private int user_id;
	private String user_name;
	private String user_password;
	private String user_card_no; // �û����֤��
	private String user_tel;
	private String user_address;
	private String user_post_number; // �û��������
	private int user_is_admin; // �û��Ƿ��ǹ���Ա��0�Ǿ����ߣ�1�ǹ���Ա��Ĭ��ֵ��0
	private String user_question; // �û��һ����������
	private String user_answer; // �û��һ������
	public AuctionUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuctionUser(int user_id, String user_name, String user_password,
			String user_card_no, String user_tel, String user_address,
			String user_post_number, int user_is_admin, String user_question,
			String user_answer) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_card_no = user_card_no;
		this.user_tel = user_tel;
		this.user_address = user_address;
		this.user_post_number = user_post_number;
		this.user_is_admin = user_is_admin;
		this.user_question = user_question;
		this.user_answer = user_answer;
	}
	public AuctionUser(String user_name, String user_password,
			String user_card_no, String user_tel, String user_address,
			String user_post_number, int user_is_admin, String user_question,
			String user_answer) {
		super();
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_card_no = user_card_no;
		this.user_tel = user_tel;
		this.user_address = user_address;
		this.user_post_number = user_post_number;
		this.user_is_admin = user_is_admin;
		this.user_question = user_question;
		this.user_answer = user_answer;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_card_no() {
		return user_card_no;
	}
	public void setUser_card_no(String user_card_no) {
		this.user_card_no = user_card_no;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_post_number() {
		return user_post_number;
	}
	public void setUser_post_number(String user_post_number) {
		this.user_post_number = user_post_number;
	}
	public int getUser_is_admin() {
		return user_is_admin;
	}
	public void setUser_is_admin(int user_is_admin) {
		this.user_is_admin = user_is_admin;
	}
	public String getUser_question() {
		return user_question;
	}
	public void setUser_question(String user_question) {
		this.user_question = user_question;
	}
	public String getUser_answer() {
		return user_answer;
	}
	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
	}
	@Override
	public String toString() {
		return "AuctionUser [user_id=" + user_id + ", user_name=" + user_name
				+ ", user_password=" + user_password + ", user_card_no="
				+ user_card_no + ", user_tel=" + user_tel + ", user_address="
				+ user_address + ", user_post_number=" + user_post_number
				+ ", user_is_admin=" + user_is_admin + ", user_question="
				+ user_question + ", user_answer=" + user_answer + "]";
	}
	
}
