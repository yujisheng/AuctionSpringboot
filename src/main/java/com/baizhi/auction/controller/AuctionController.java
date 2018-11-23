package com.baizhi.auction.controller;

import com.baizhi.auction.entity.Auction;
import com.baizhi.auction.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/private")
public class AuctionController {
	
	@Autowired
	private AuctionService auctionService;
	
	// ��Ӿ�
	@RequestMapping("/addAuction")
	public String addAuction(HttpServletRequest request,
			MultipartFile uploadFile, Auction auction)
			throws IllegalStateException, IOException{
		
		System.out.println("add===>auction"+auction+"\n");
		// ��ȡ�ļ��ϴ�ǰ���ļ���
		String fileName = uploadFile.getOriginalFilename();
		// ��ȡ�ļ��ϴ�����ļ���
		fileName = new Date().getTime()+fileName;
		// ��ȡ���ļ���·��
		String realPath = request.getRealPath("/images/");
		
		uploadFile.transferTo(new File(realPath+"\\"+fileName));
		
		auction.setAuction_pic(fileName);
		auctionService.addAuction(auction);
		return "redirect:/private/getAll.do";
	}
	
	// ɾ��������Ʒ
	@RequestMapping("/deleteAuction")
	public String deleteAuction(int auctionId){
		auctionService.deleteAuction(auctionId);
		return "redirect:/private/getAll.do";
	}
	
	
	// �޸ľ�����Ʒ
	@RequestMapping("/updateAuction")
	public String updateAuction(MultipartFile uploadFile,Auction auction,HttpServletRequest request){
		System.out.println("============"+auction);
		// ��ȡ�ϴ��ļ����ļ���
		String fileName = uploadFile.getOriginalFilename();
		if(!"".equals(fileName)){
			// ��ȡ�ļ��ϴ�����ļ���
			fileName = new Date().getTime()+fileName;
			// ��ȡ���ļ���·��
			String realPath = request.getRealPath("/images/");
			
			try {
				uploadFile.transferTo(new File(realPath+"\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			auction.setAuction_pic(fileName);
		}
		
		System.out.println("update===>auction==>"+auction+"\n");
		auctionService.updateAuction(auction);
		return "redirect:/private/getAll.do";
	}
	
	// ��ѯָ��������Ʒ
	@RequestMapping("/getOne")
	public String getOne(int auctionId,Map<String, Auction> map){
		Auction auction = auctionService.oneAuction(auctionId);
		map.put("auction", auction);
		return "private/update";
	}
	
	// ��ѯ������Ʒ
	@RequestMapping("/getAll")
	public String getAll(HttpServletRequest request,Auction auction){
		System.out.println(auction+"\n");
		List<Auction> auctionList = auctionService.allAuction(auction);
		request.setAttribute("auctionList", auctionList);
		return "private/auctionManagementPage";
	}
	
	
}
