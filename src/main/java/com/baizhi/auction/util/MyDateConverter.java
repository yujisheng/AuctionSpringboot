package com.baizhi.auction.util;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * �Զ�����������ת����
 * 
 * @author Administrator
 * 
 */
@Component
public class MyDateConverter implements Converter<String, Date> {

	// ���ó�ʼ�����ڸ�ʽ
	private final String[] pattern = { "yyyy-MM-dd HH:mm:ss", "yyyy/MM/dd HH:mm:ss",
			"yyyy年MM月dd日HH时mm分ss秒"};

	@Override
	public Date convert(String arg0) {
		
		for (int i = 0; i < pattern.length; i++) {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern[i]);

			try {
				/*System.out.println("����===="+sdf.format(new Date()));*/
				System.out.println(pattern[i]+"*******************"+arg0);
				Date time = sdf.parse(arg0);
				System.out.println(time);
				return time;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	/*private String pattern;
	
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	@Override
	public Date convert(String arg0) {
		System.out.println("����converter====>");
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		try {
			Date date = sdf.parse(arg0);
			return date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return null;
		}
	}*/
	
	
}
