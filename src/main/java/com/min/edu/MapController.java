package com.min.edu;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.edu.model.service.IMapService;
import com.min.edu.vo.Vet_Vo;

@Controller
public class MapController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IMapService service;
	
	@GetMapping(value = "/map2.do")
	public String map2() {
		return "map2";
	}
	@GetMapping(value = "/map3.do")
	public String map3() {
		return "map3";
	}
	
	@GetMapping(value = "/map4.do")
	public String map4() {
		return "map4";
	}
	
	@GetMapping(value = "/detail.do")
	public String detail(@RequestParam(name = "address") String address, Model model) {
		logger.info("MapController 병원의 상세 주소 : {}",address);
		
		Vet_Vo vet_detail = service.vet_detail(address);
		model.addAttribute("vet_detail", vet_detail);
		
		return "hospital_detail";
	}
	
	@GetMapping(value = "/listByRegion.do" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Vet_Vo> listByRegion(String region) {
		logger.info("listByRegion ajax 실행 지역 :{}",region);
		return service.listByRegion(region);
	}
}
