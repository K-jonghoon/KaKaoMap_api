package com.min.edu.util;

import org.springframework.stereotype.Repository;

/*
 * 주소 문자열에서 첫번째 단어를 제외한 부분을 추출하여 나머지 문자열을 반환하는 Util 클래스
 */
@Repository
public class AddressUtil {

	public String extractFirstWord(String fullAddress) {
		
		// 입력받은 주소를 공백 기준으로 분할
		String[] addressParts = fullAddress.split(" ");
			// 주소 부분이 2개 이상인 경우에만 실행
	        if (addressParts.length >= 2) {
	        	 StringBuilder result = new StringBuilder();
	        	 
	        	 // 젓번째 단어를 제외한 나머지 단어들을 조합
	             for (int i = 1; i < addressParts.length; i++) {
	                 result.append(addressParts[i]);
	                 
	                 // 마지막 단어 아닌경우 공백 추가
	                 if (i < addressParts.length - 1) {
	                     result.append(" ");
	                 }
	             }
	             // 조합결과 반환
	             return result.toString();
	        }
	        return "";
	}
	
}
