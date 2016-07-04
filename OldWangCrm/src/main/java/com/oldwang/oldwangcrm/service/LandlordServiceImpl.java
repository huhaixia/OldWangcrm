package com.oldwang.oldwangcrm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldwang.oldwangcrm.mapping.LandlordMapper;
import com.oldwang.oldwangcrm.model.Landlord;

@Service(value = "landlordService")
public class LandlordServiceImpl implements LandlordService {

	/**
	 * 声明房东数据层
	 */
	@Autowired
	private LandlordMapper landlordMapper;

	public LandlordMapper getLandlordMapper() {
		return landlordMapper;
	}

	public void setLandlordMapper(LandlordMapper landlordMapper) {
		this.landlordMapper = landlordMapper;
	}

	@Override
	public int addll(Landlord landlord) {
		return 0;
	}

	@Override
	public List<Landlord> selectLandlord() {
		return landlordMapper.selectLandlord();
	}
}
