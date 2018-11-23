package com.baizhi.auction.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.sql.Timestamp;

public class AuctionRecord implements Serializable {
	private int id;
	private int user_id; // �����ֶ�
	private int auction_id; // �����ֶ�
	@DateTimeFormat(pattern = "yyyy-MM-dd HH-mm-ss")
	@JSONField(format = "yyyy-MM-dd HH-mm-ss")
	private Timestamp auction_time;
	private double auction_price; //� ��ļ۸�
	private Auction auction; // һ����Ʒ�ж�����¼
	private AuctionUser auctionUser; // һ���û��ж�����¼
	public AuctionRecord() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuctionRecord(int id, int user_id, int auction_id,
			Timestamp auction_time, double auction_price, Auction auction,
			AuctionUser auctionUser) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.auction_id = auction_id;
		this.auction_time = auction_time;
		this.auction_price = auction_price;
		this.auction = auction;
		this.auctionUser = auctionUser;
	}
	public AuctionRecord(int user_id, int auction_id, Timestamp auction_time,
			double auction_price, Auction auction, AuctionUser auctionUser) {
		super();
		this.user_id = user_id;
		this.auction_id = auction_id;
		this.auction_time = auction_time;
		this.auction_price = auction_price;
		this.auction = auction;
		this.auctionUser = auctionUser;
	}
	
	public AuctionRecord(int id, int user_id, int auction_id,
			Timestamp auction_time, double auction_price) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.auction_id = auction_id;
		this.auction_time = auction_time;
		this.auction_price = auction_price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getAuction_id() {
		return auction_id;
	}
	public void setAuction_id(int auction_id) {
		this.auction_id = auction_id;
	}
	public Timestamp getAuction_time() {
		return auction_time;
	}
	public void setAuction_time(Timestamp auction_time) {
		this.auction_time = auction_time;
	}
	public double getAuction_price() {
		return auction_price;
	}
	public void setAuction_price(double auction_price) {
		this.auction_price = auction_price;
	}
	public Auction getAuction() {
		return auction;
	}
	public void setAuction(Auction auction) {
		this.auction = auction;
	}
	public AuctionUser getAuctionUser() {
		return auctionUser;
	}
	public void setAuctionUser(AuctionUser auctionUser) {
		this.auctionUser = auctionUser;
	}
	@Override
	public String toString() {
		return "AuctionRecord [id=" + id + ", user_id=" + user_id
				+ ", auction_id=" + auction_id + ", auction_time="
				+ auction_time + ", auction_price=" + auction_price
				+ ", auction=" + auction + ", auctionUser=" + auctionUser + "]";
	}
	
	
}
