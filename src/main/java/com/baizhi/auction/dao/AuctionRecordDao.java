package com.baizhi.auction.dao;

import com.baizhi.auction.entity.AuctionRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuctionRecordDao {

	// ����
	public void addRecourd(@Param("auctionRecord") AuctionRecord auctionRecord);

	// ˢ�³����б�
	public List<AuctionRecord> auctionRecordList(
            @Param("auctionId") int auctionId, @Param("start") int start,
            @Param("end") int end);

	// ��Ʒ���������
	public Double maxAuctionPrice(int auctionId);
}
