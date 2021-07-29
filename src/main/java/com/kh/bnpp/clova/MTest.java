package com.kh.bnpp.clova;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.kh.bnpp.model.dto.BillDto;

import java.io.File;

public class MTest {
	
	public static void main(String[] args, HttpServletRequest request) {
		
		/*
		StringBuffer res = new StringBuffer();
		String str = "{\"version\":\"V2\",\"requestId\":\"5abd69e0-0cd1-428d-872c-5701d84c7c4e\",\"timestamp\":1625228344189,\"images\":[{\"uid\":\"4455cf405aff4d36917e4fa70d6f88ef\",\"name\":\"demo\",\"inferResult\":\"SUCCESS\",\"message\":\"SUCCESS\",\"matchedTemplate\":{\"id\":9473,\"name\":\"영수증\"},\"validationResult\":{\"result\":\"NO_REQUESTED\"},\"title\":{\"name\":\"emart_receipt\",\"boundingPoly\":{\"vertices\":[{\"x\":220.0,\"y\":141.0},{\"x\":414.0,\"y\":157.0},{\"x\":409.0,\"y\":264.0},{\"x\":214.0,\"y\":227.0}]},\"inferText\":\"emart\\neveryday\",\"inferConfidence\":0.99979997,\"subFields\":[{\"boundingPoly\":{\"vertices\":[{\"x\":220.0,\"y\":141.0},{\"x\":414.0,\"y\":157.0},{\"x\":409.0,\"y\":218.0},{\"x\":214.0,\"y\":201.0}]},\"inferText\":\"emart\",\"inferConfidence\":1.0,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":222.0,\"y\":182.0},{\"x\":409.0,\"y\":219.0},{\"x\":400.0,\"y\":264.0},{\"x\":214.0,\"y\":227.0}]},\"inferText\":\"everyday\",\"inferConfidence\":0.9996,\"lineBreak\":false}]},\"fields\":[{\"name\":\"날짜\",\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":150.0,\"y\":394.0},{\"x\":453.0,\"y\":418.0},{\"x\":450.0,\"y\":464.0},{\"x\":146.0,\"y\":439.0}]},\"inferText\":\"[구매]2021-06-25\",\"inferConfidence\":0.9937,\"type\":\"NORMAL\",\"subFields\":[{\"boundingPoly\":{\"vertices\":[{\"x\":150.0,\"y\":394.0},{\"x\":453.0,\"y\":418.0},{\"x\":450.0,\"y\":464.0},{\"x\":146.0,\"y\":439.0}]},\"inferText\":\"[구매]2021-06-25\",\"inferConfidence\":0.9937,\"lineBreak\":false}]},{\"name\":\"물품명\",\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":138.0,\"y\":557.0},{\"x\":548.0,\"y\":557.0},{\"x\":548.0,\"y\":921.0},{\"x\":137.0,\"y\":915.0}]},\"inferText\":\"01 깨)순수소프트30*30\\n깨끗한 순수 1+1\\n02 동원명장사과140ml* 03 피코크 고기 동그랑 04 CJ 햄스빌베이컨110\\n과세\\n부 가\\n합\\n결제대상금액\",\"inferConfidence\":0.9971315,\"type\":\"NORMAL\",\"subFields\":[{\"boundingPoly\":{\"vertices\":[{\"x\":142.0,\"y\":557.0},{\"x\":188.0,\"y\":557.0},{\"x\":188.0,\"y\":592.0},{\"x\":142.0,\"y\":592.0}]},\"inferText\":\"01\",\"inferConfidence\":0.9999,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":235.0,\"y\":560.0},{\"x\":548.0,\"y\":563.0},{\"x\":548.0,\"y\":610.0},{\"x\":235.0,\"y\":606.0}]},\"inferText\":\"깨)순수소프트30*30\",\"inferConfidence\":0.9962,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":267.0,\"y\":597.0},{\"x\":385.0,\"y\":600.0},{\"x\":384.0,\"y\":647.0},{\"x\":266.0,\"y\":644.0}]},\"inferText\":\"깨끗한\",\"inferConfidence\":0.9998,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":386.0,\"y\":600.0},{\"x\":466.0,\"y\":600.0},{\"x\":466.0,\"y\":649.0},{\"x\":386.0,\"y\":649.0}]},\"inferText\":\"순수\",\"inferConfidence\":0.9999,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":471.0,\"y\":609.0},{\"x\":527.0,\"y\":609.0},{\"x\":527.0,\"y\":642.0},{\"x\":471.0,\"y\":642.0}]},\"inferText\":\"1+1\",\"inferConfidence\":1.0,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":140.0,\"y\":634.0},{\"x\":189.0,\"y\":634.0},{\"x\":189.0,\"y\":672.0},{\"x\":140.0,\"y\":672.0}]},\"inferText\":\"02\",\"inferConfidence\":1.0,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":234.0,\"y\":635.0},{\"x\":545.0,\"y\":642.0},{\"x\":544.0,\"y\":688.0},{\"x\":233.0,\"y\":681.0}]},\"inferText\":\"동원명장사과140ml*\",\"inferConfidence\":0.9967,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":140.0,\"y\":674.0},{\"x\":187.0,\"y\":674.0},{\"x\":187.0,\"y\":709.0},{\"x\":140.0,\"y\":709.0}]},\"inferText\":\"03\",\"inferConfidence\":0.9934,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":231.0,\"y\":674.0},{\"x\":345.0,\"y\":675.0},{\"x\":345.0,\"y\":719.0},{\"x\":231.0,\"y\":718.0}]},\"inferText\":\"피코크\",\"inferConfidence\":0.9996,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":351.0,\"y\":676.0},{\"x\":429.0,\"y\":676.0},{\"x\":429.0,\"y\":722.0},{\"x\":351.0,\"y\":722.0}]},\"inferText\":\"고기\",\"inferConfidence\":0.9998,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":437.0,\"y\":678.0},{\"x\":546.0,\"y\":679.0},{\"x\":545.0,\"y\":724.0},{\"x\":436.0,\"y\":723.0}]},\"inferText\":\"동그랑\",\"inferConfidence\":0.9733,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":138.0,\"y\":712.0},{\"x\":186.0,\"y\":712.0},{\"x\":186.0,\"y\":750.0},{\"x\":138.0,\"y\":750.0}]},\"inferText\":\"04\",\"inferConfidence\":0.9999,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":227.0,\"y\":714.0},{\"x\":275.0,\"y\":714.0},{\"x\":275.0,\"y\":750.0},{\"x\":227.0,\"y\":750.0}]},\"inferText\":\"CJ\",\"inferConfidence\":1.0,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":283.0,\"y\":711.0},{\"x\":546.0,\"y\":715.0},{\"x\":546.0,\"y\":763.0},{\"x\":283.0,\"y\":759.0}]},\"inferText\":\"햄스빌베이컨110\",\"inferConfidence\":0.9997,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":402.0,\"y\":754.0},{\"x\":495.0,\"y\":754.0},{\"x\":495.0,\"y\":801.0},{\"x\":402.0,\"y\":801.0}]},\"inferText\":\"과세\",\"inferConfidence\":0.9935,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":401.0,\"y\":791.0},{\"x\":445.0,\"y\":791.0},{\"x\":445.0,\"y\":838.0},{\"x\":401.0,\"y\":838.0}]},\"inferText\":\"부\",\"inferConfidence\":0.9999,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":484.0,\"y\":792.0},{\"x\":530.0,\"y\":792.0},{\"x\":530.0,\"y\":839.0},{\"x\":484.0,\"y\":839.0}]},\"inferText\":\"가\",\"inferConfidence\":0.9967,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":400.0,\"y\":829.0},{\"x\":444.0,\"y\":829.0},{\"x\":444.0,\"y\":877.0},{\"x\":400.0,\"y\":877.0}]},\"inferText\":\"합\",\"inferConfidence\":0.9995,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":138.0,\"y\":861.0},{\"x\":445.0,\"y\":867.0},{\"x\":444.0,\"y\":921.0},{\"x\":137.0,\"y\":915.0}]},\"inferText\":\"결제대상금액\",\"inferConfidence\":0.9977,\"lineBreak\":false}]},{\"name\":\"단가\",\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":569.0,\"y\":574.0},{\"x\":695.0,\"y\":576.0},{\"x\":695.0,\"y\":879.0},{\"x\":569.0,\"y\":879.0}]},\"inferText\":\"25,900\\n2,200\\n6,900\\n7,980\\n세\\n계\",\"inferConfidence\":0.9999333,\"type\":\"NORMAL\",\"subFields\":[{\"boundingPoly\":{\"vertices\":[{\"x\":585.0,\"y\":574.0},{\"x\":694.0,\"y\":576.0},{\"x\":694.0,\"y\":612.0},{\"x\":585.0,\"y\":610.0}]},\"inferText\":\"25,900\",\"inferConfidence\":0.9999,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":602.0,\"y\":649.0},{\"x\":695.0,\"y\":649.0},{\"x\":695.0,\"y\":686.0},{\"x\":602.0,\"y\":686.0}]},\"inferText\":\"2,200\",\"inferConfidence\":1.0,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":599.0,\"y\":686.0},{\"x\":694.0,\"y\":686.0},{\"x\":694.0,\"y\":722.0},{\"x\":599.0,\"y\":722.0}]},\"inferText\":\"6,900\",\"inferConfidence\":0.9999,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":600.0,\"y\":722.0},{\"x\":695.0,\"y\":723.0},{\"x\":695.0,\"y\":762.0},{\"x\":600.0,\"y\":760.0}]},\"inferText\":\"7,980\",\"inferConfidence\":0.9999,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":569.0,\"y\":795.0},{\"x\":613.0,\"y\":795.0},{\"x\":613.0,\"y\":840.0},{\"x\":569.0,\"y\":840.0}]},\"inferText\":\"세\",\"inferConfidence\":1.0,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":570.0,\"y\":832.0},{\"x\":614.0,\"y\":832.0},{\"x\":614.0,\"y\":879.0},{\"x\":570.0,\"y\":879.0}]},\"inferText\":\"계\",\"inferConfidence\":0.9999,\"lineBreak\":false}]},{\"name\":\"수량\",\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":734.0,\"y\":580.0},{\"x\":758.0,\"y\":580.0},{\"x\":758.0,\"y\":757.0},{\"x\":734.0,\"y\":757.0}]},\"inferText\":\"2\\n1\\n1\\n1\",\"inferConfidence\":0.999925,\"type\":\"NORMAL\",\"subFields\":[{\"boundingPoly\":{\"vertices\":[{\"x\":734.0,\"y\":580.0},{\"x\":758.0,\"y\":580.0},{\"x\":758.0,\"y\":610.0},{\"x\":734.0,\"y\":610.0}]},\"inferText\":\"2\",\"inferConfidence\":0.9999,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":738.0,\"y\":655.0},{\"x\":755.0,\"y\":655.0},{\"x\":755.0,\"y\":682.0},{\"x\":738.0,\"y\":682.0}]},\"inferText\":\"1\",\"inferConfidence\":0.9999,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":738.0,\"y\":692.0},{\"x\":754.0,\"y\":692.0},{\"x\":754.0,\"y\":718.0},{\"x\":738.0,\"y\":718.0}]},\"inferText\":\"1\",\"inferConfidence\":1.0,\"lineBreak\":false},{\"boundingPoly\":{\"vertices\":[{\"x\":739.0,\"y\":729.0},{\"x\":756.0,\"y\":729.0},{\"x\":756.0,\"y\":757.0},{\"x\":739.0,\"y\":757.0}]},\"inferText\":\"1\",\"inferConfidence\":0.9999,\"lineBreak\":false}]}]}]}"
				;
		res.append(str);
		
		List<String> list = new ArrayList<String>();
		
		JSONObject jsob = new JSONObject(res.toString());
		JSONArray jsarr = jsob.getJSONArray("images");
		jsob = jsarr.getJSONObject(0);
		jsarr = jsob.getJSONArray("fields"); // 여기서 for로 나눠야됨
		for (int i = 0; i < jsarr.length(); i++) {
			jsob = jsarr.getJSONObject(i);			
			
			list.add((String)jsob.get("inferText"));
		}
		
		List<BillDto> listres = input_bill(list, "asd123");
		for (BillDto dto : listres) {
			System.out.println(dto.getBill_name()+"\t"+dto.getBill_price()+"\t"+dto.getBill_quantity()
			+"\t"+dto.getBill_total()+"\t"+dto.getBill_date()+"\t"+dto.getMember_id());
		}
		*/
		
		/*
		List<BillDto> list = new ArrayList<BillDto>();
		
		list = Clova_temp.input_bill(Clova_temp_url.OCR("https://kr.object.ncloudstorage.com/public-imgs/receipt1.jpg"), "asd123");
		for (BillDto dto : list) {
			System.out.println(dto.getBill_name()+"\t"+dto.getBill_price()+"\t"+dto.getBill_quantity()
			+"\t"+dto.getBill_total()+"\t"+dto.getBill_date()+"\t"+dto.getMember_id());
		}
		*/
		
		// 경로 읽어오기
		// String pathSet = request.getSession().getServletContext().getRealPath("/resources/img/receipt1.jpg");

		
		
	}
	
	
	
}
