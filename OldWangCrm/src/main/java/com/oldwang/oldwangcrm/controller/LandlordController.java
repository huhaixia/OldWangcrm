package com.oldwang.oldwangcrm.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oldwang.oldwangcrm.model.Landlord;
import com.oldwang.oldwangcrm.service.LandlordService;

@Controller
public class LandlordController {
	@Autowired
	private LandlordService landlordservice;

	@RequestMapping(value = "/Landlord/addll", method = RequestMethod.GET)
	public String addLL(HttpServletRequest request, Landlord landlord) {
		landlord.setName(request.getParameter("name"));
		landlord.setPhone(request.getParameter("phone"));
		landlordservice.addll(landlord);
		return "/landlord";

	}
	
	@RequestMapping(value = "/Landlord/selectLandlord", method = RequestMethod.GET)
	public String selectLandlord(HttpServletRequest request,Landlord landlord){
		landlordservice.selectLandlord();
		return "/landlord";
		
	}
}
