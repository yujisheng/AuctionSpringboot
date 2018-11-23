package com.baizhi.auction.dao;

import com.baizhi.auction.entity.Auction;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuctionDao {
	// ��ѯ����Υ����������Ʒ
	public List<Auction> allAuction(@Param("auction") Auction auction);

	// ��ѯָ��������Ʒ
	public Auction oneAuction(int auctionId);

	// ���������ƽ��������
	public void addAuction(Auction auction);

	// ɾ��������Ʒ
	public void deleteAuction(int auctionId);

	// �޸�������Ʒ
	public void updateAuction(Auction auction);
}
