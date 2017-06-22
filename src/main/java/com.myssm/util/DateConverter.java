package com.myssm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 日期转换器
 * @author Administrator
 */
public class DateConverter implements Converter<String, Date>{


	public Date convert(String source) {
		//实现将日期串 转成日期类型（格式：yyyy-MM-dd HH:mm:ss）
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			//转换成功直接返回
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//如果参数绑定失败 返回null
		return null;
	}
	
}	
