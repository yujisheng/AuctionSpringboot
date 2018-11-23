package com.baizhi.auction.service;

import com.baizhi.auction.entity.AuctionUser;

public interface AuctionUserService {
	// ��¼
	public AuctionUser login(String user_name,String user_password);

	// ע��
	public void register(AuctionUser auctionUser);
}
