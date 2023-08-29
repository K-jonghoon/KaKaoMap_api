package com.min.edu.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.Vet_Vo;

@Repository
public class MapDaoImpl implements IMapDao{

	private static final String NS = "com.min.edu.model.mapper.MapDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Vet_Vo vet_detail(String address) {
		return sqlSession.selectOne(NS+"vet_detail", address);
	}

	@Override
	public List<Vet_Vo> listByRegion(String region) {
		return sqlSession.selectList(NS+"listByRegion", region);
	}

}
