package com.baizhi.auction.controller;

import com.baizhi.auction.entity.Auction;
import com.baizhi.auction.entity.AuctionRecord;
import com.baizhi.auction.service.AuctionRecordService;
import com.baizhi.auction.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/private")
public class AuctionRecordController {
	
	@Autowired
	private AuctionRecordService auctionRecordService;
	@Autowired
	private AuctionService auctionService;
	
	
	// 刷新列表
	@RequestMapping("/auctionList")
	public String auctionList(HttpServletRequest request,Integer auctionId){
		System.out.println("auctionId = " + auctionId);
		Auction auction = auctionService.oneAuction(auctionId);
		List<AuctionRecord> recordList = auctionRecordService.auctionRecordList(auctionId, 1, 5);
		request.setAttribute("auction", auction);
		request.setAttribute("recordList", recordList);
		return "private/auction";
	}
	
	// ����
	@RequestMapping("/addAuctionPrice")
	public String addAuctionPrice(AuctionRecord record,HttpServletRequest request){
		System.out.println("record = " + record);
		auctionRecordService.addRecourd(record);
		request.setAttribute("auctionId", record.getAuction_id());
		return "redirect:/private/auctionList.do?auctionId="+record.getAuction_id();
	}
}
