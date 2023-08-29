package com.min.edu.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Vet_Vo {

	private int 번호;
	private String 개방서비스명;
	private String 개방서비스아이디;
	private int 영업상태구분코드;
	private String 영업상태명;
	private String 상세영업상태코드;
	private String 상세영업상태명;
	private String 소재지전화;
	private String 소재지우편번호;
	private String 소재지전체주소;
	private String 도로명전체주소;
	private String 도로명우편번호;
	private String 사업장명;
	private String 업태구분명;
	private double 좌표정보x;
	private double 좌표정보y;
	private String 업무구분명;
	private String 상세업무구분명;

}
