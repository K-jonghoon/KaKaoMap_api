package com.test.edu;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.edu.model.service.IMapService;
import com.min.edu.vo.Vet_Vo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MapTest {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private IMapService service;
	
	@Before
	public void test() {
		sqlSession = context.getBean("sqlSessionTemplate", sqlSession.getClass());
		assertNotNull(sqlSession);
	}

//	@Test
//	public void listByRegion() {
//		List<Vet_Vo> lists = service.listByRegion("김포");
//		assertNotNull(lists);
//	}
	
	@Test
	public void vet_detail() {
		Vet_Vo vo = service.vet_detail("인천 미추홀구 주안동 678-7");
		assertNotNull(vo);
	}
	
}
