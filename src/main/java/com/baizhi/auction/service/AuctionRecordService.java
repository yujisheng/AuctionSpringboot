package com.baizhi.auction.service;

import com.baizhi.auction.entity.AuctionRecord;

import java.util.List;

public interface AuctionRecordService {
	// ����
	public void addRecourd(AuctionRecord auctionRecord);

	// ˢ�³����б�
	public List<AuctionRecord> auctionRecordList(int auctionId, int start, int end);

}
