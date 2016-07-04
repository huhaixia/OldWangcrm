package com.oldwang.oldwangcrm.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.oldwang.oldwangcrm.model.Landlord;

public interface LandlordMapper {
	
	@Select("select * from users")
	public List<Landlord> selectLandlord();
}
