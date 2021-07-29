package com.kh.bnpp.clova;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;

import com.kh.bnpp.model.dto.BillDto;

/*
 	String pathSet = request.getSession().getServletContext().getRealPath("/resources/img/receipt1.jpg");

	List<String> list = Clova_temp.OCR(pathSet);
*/

public class Clova_temp {

	public static List<String> OCR(String imageFile) {
		String apiURL = "https://3aae1771f0124265954d9f4d44e2e81a.apigw.ntruss.com/custom/v1/9678/ac930b391de6fdca08a353ee32880c2702bd434e6f927e28f3d52c4895563c91/infer";
		String secretKey = "cHFRWFFyV0dXbWVwSlV4QkZsY3JxRVBTQ0tCcmNKU20=";
		// String imageFile = "C:\\images\\receipt2.jpg";
		List<String> list = new ArrayList<String>();

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			
			JSONArray jarr = new JSONArray();
			jarr.put(9473);
			image.put("templateIds", jarr);
			
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println(response);
			
			JSONObject jsob = new JSONObject(response.toString());
			JSONArray jsarr = jsob.getJSONArray("images");
			jsob = jsarr.getJSONObject(0);
			jsarr = jsob.getJSONArray("fields"); 
			for (int i = 0; i < jsarr.length(); i++) {
				jsob = jsarr.getJSONObject(i);
				list.add((String)jsob.get("inferText"));
			}
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	public static List<BillDto> input_bill(List<String> rawlist, String member_id) {
		List<BillDto> list = new ArrayList<BillDto>();
		BillDto dto = null;
		
		String bill_date = rawlist.get(0).replace("[구매]", "");
		String[] bill_price = rawlist.get(2).split("\n");
		String[] bill_quantity = rawlist.get(3).split("\n");
		
		int count = bill_quantity.length;
		String names = rawlist.get(1);
		int start, end, price, quantity, total;
		String name;
		
		if (count > 1) {
			for (int i = 0; i < count-1; i++) {
				start = names.indexOf(num_toStr(i+1)+" ");
				if (start == -1) {
					start = names.indexOf(num_toStr(i+1)+"*");
					if (start == -1) {
						start = 0;
					}
				}
				end = names.indexOf(num_toStr(i+2)+" ");
				if (end == -1) {
					end = names.indexOf(num_toStr(i+2)+"*");
				}
				name = names.substring(start, end).replace("\n", " ")
						.replace(num_toStr(i+1)+"*", "").replace(num_toStr(i+1)+" ", "").replace("(*)면세", ""); 
				price = Integer.parseInt(bill_price[i].replace(",", ""));
				quantity = Integer.parseInt(bill_quantity[i]);
				total = price * quantity;
				dto = new BillDto(0, name, price, quantity, total, bill_date, member_id);
				list.add(dto);
			}
		}
		
		start = names.indexOf(num_toStr(count)+" ");
		if (start == -1) {
			start = names.indexOf(num_toStr(count)+"*");
		}
		end = names.indexOf("과세");
		if (end == -1) {
			end = names.length();
		}
		name = names.substring(start, end).replace("\n", " ")
				.replace(num_toStr(count)+"*", "").replace(num_toStr(count)+" ", "").replace("(*)면세", "");
		price = Integer.parseInt(bill_price[count-1].replace(",", ""));
		quantity = Integer.parseInt(bill_quantity[count-1]);
		total = price * quantity;
		dto = new BillDto(0, name, price, quantity, total, bill_date, member_id);
		list.add(dto);
		
		return list;
	}
	
	private static String num_toStr(int num) {
		String result = null;
		if (num < 10) {
			result = "0" + Integer.toString(num);
		} else {
			result = Integer.toString(num);
		}
		return result;
	}

	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws
		IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString
				.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}
}