package com.baizhi.auction.service;

import com.baizhi.auction.dao.AuctionRecordDao;
import com.baizhi.auction.entity.AuctionRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AuctionRecordServiceImp implements AuctionRecordService {
	@Autowired
	private AuctionRecordDao auctionRecordDao;

	@Override
	public void addRecourd(AuctionRecord auctionRecord) {
		System.out.println(auctionRecordDao.maxAuctionPrice(auctionRecord
				.getAuction_id()));
		// �����ļ۴��ڵ�ǰ��ߵľ��ļ�
		/*if (recordDao.maxAuctionPrice(auctionRecord.getAuction_id()) == null
				|| auctionRecord.getAuction_price() > recordDao
						.maxAuctionPrice(auctionRecord.getAuction_id())) {
			recordDao.addRecourd(auctionRecord);
		} else {
			System.out.println("+====������ʧ�ܣ�");
		}*/
		auctionRecordDao.addRecourd(auctionRecord);
	}

	@Override
	public List<AuctionRecord> auctionRecordList(int auctionId, int start,
			int end) {
		return auctionRecordDao.auctionRecordList(auctionId, start, end);
	}

}
