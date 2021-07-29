package com.kh.bnpp.sms;

import java.text.ParseException;

public class smsTest {

	public static void main(String[] args) {
		/*
		String phone = "01064244977";
		String content = "메시지테스트";
		try {
			SMS.sendSMS(phone, content);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		try {
			
			if (!SMS.compareDate("2021-07-21").equals("0")) {
				System.out.println("notnull");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
}
