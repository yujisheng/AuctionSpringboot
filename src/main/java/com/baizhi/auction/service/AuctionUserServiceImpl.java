package com.baizhi.auction.service;

import com.baizhi.auction.dao.AuctionUserDao;
import com.baizhi.auction.entity.AuctionUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AuctionUserServiceImpl implements AuctionUserService {
	
	@Autowired
	private AuctionUserDao auctionUserDao;

	@Override
	public AuctionUser login(String user_name, String user_password) {
		return auctionUserDao.login(user_name, user_password);
	}

	@Override
	public void register(AuctionUser auctionUser) {
			auctionUserDao.register(auctionUser);
	}
	
}
