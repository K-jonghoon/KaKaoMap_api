package com.min.edu.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.model.mapper.IMapDao;
import com.min.edu.util.AddressUtil;
import com.min.edu.vo.Vet_Vo;

@Service
public class MapServiceImpl implements IMapService{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IMapDao dao;
	
	@Autowired
	private AddressUtil addressUtil;

	@Override
	public Vet_Vo vet_detail(String address) {
		
		String vet_address = addressUtil.extractFirstWord(address);
		logger.info("vet_detail 주소 자르기 :{}",vet_address);
		
		return dao.vet_detail(vet_address);
	}

	@Override
	public List<Vet_Vo> listByRegion(String region) {
		logger.info("listByRegion 지역별 주소 호출하기 :{}",region);
		return dao.listByRegion(region);
	}
	

	
	
}
