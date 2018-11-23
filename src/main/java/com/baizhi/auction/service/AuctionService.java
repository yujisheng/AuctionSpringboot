package com.baizhi.auction.service;

import com.baizhi.auction.entity.Auction;

import java.util.List;

public interface AuctionService {
	// ��ѯ����Υ����������Ʒ
	public List<Auction> allAuction(Auction auction);

	// ��ѯָ��������Ʒ
	public Auction oneAuction(int auctionId);

	// ���������ƽ��������
	public void addAuction(Auction auction);

	// ɾ��������Ʒ
	public void deleteAuction(int auctionId);

	// �޸�������Ʒ
	public void updateAuction(Auction auction);
}
