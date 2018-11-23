package com.baizhi.auction.service;

import com.baizhi.auction.dao.AuctionDao;
import com.baizhi.auction.entity.Auction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	private AuctionDao auctionDao;


	@Override
	public List<Auction> allAuction(Auction auction) {
		return auctionDao.allAuction(auction);
	}

	@Override
	public Auction oneAuction(int auctionId) {
		return auctionDao.oneAuction(auctionId);
	}

	@Override
	public void addAuction(Auction auction) {
		auctionDao.addAuction(auction);
		
	}

	@Override
	public void deleteAuction(int auctionId) {
		auctionDao.deleteAuction(auctionId);
		
	}

	@Override
	public void updateAuction(Auction auction) {
		auctionDao.updateAuction(auction);
		
	}
	
}
