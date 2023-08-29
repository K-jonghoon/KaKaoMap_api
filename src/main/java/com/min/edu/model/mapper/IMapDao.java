package com.min.edu.model.mapper;

import java.util.List;

import com.min.edu.vo.Vet_Vo;

public interface IMapDao {

	public Vet_Vo vet_detail(String address);
	
	public List<Vet_Vo> listByRegion(String region);
}
