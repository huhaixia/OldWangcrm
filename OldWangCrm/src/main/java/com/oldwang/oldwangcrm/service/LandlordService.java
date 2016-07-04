package com.oldwang.oldwangcrm.service;

import java.util.List;

import com.oldwang.oldwangcrm.model.Landlord;

public interface LandlordService {

	/**
	 * 这是房东的录入功能
	 * 
	 * @param landlord是要录入的房东
	 */
	public int addll(Landlord landlord);

	public List<Landlord> selectLandlord();
}
