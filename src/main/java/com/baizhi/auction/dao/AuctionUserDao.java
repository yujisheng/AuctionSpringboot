package com.baizhi.auction.dao;

import com.baizhi.auction.entity.AuctionUser;
import org.apache.ibatis.annotations.Param;

public interface AuctionUserDao {
	// ��¼
	public AuctionUser login(@Param("user_name") String user_name,
							 @Param("user_password") String user_password);

	// ע��
	public void register(AuctionUser auctionUser);
}
