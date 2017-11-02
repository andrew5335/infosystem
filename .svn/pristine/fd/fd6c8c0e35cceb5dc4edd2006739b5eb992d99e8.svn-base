package com.eye2web.infosys.util;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * @Date 2014-12-17
 * @author kth
 * @Description Property Util
 */
public class PropertyUtil {

	private static Logger log = Logger.getLogger(PropertyUtil.class);
	private final static String settingProperty = "properties/setting.properties";
	private final static String errorProperty = "properties/error.properties";

	/**
	 * @Description Error property 일기
	 * @param key
	 * @return
	 */
	public static String errorProperty(String key) {

		Properties prop = new Properties();
		FileInputStream ins;
		String result = "";
		ClassLoader ci;
		ci = Thread.currentThread().getContextClassLoader();
		if(ci == null) {
			ci = ClassLoader.getSystemClassLoader();
		}
		URL url = ci.getResource(errorProperty);
		//System.out.println(url.getPath());
		File propFile = new File(url.getPath());

		try {
			ins = new FileInputStream(propFile);
			prop.load(ins);
			result = prop.getProperty(key);
		} catch(Exception e) {
			result = "read fail";
		}

		return result;
	}

	/**
	 * @Description Setting property 읽기
	 * @param key
	 * @return
	 */
	public static String settingProperty(String key) {

		Properties prop = new Properties();
		FileInputStream ins;
		String result = "";
		ClassLoader ci;
		ci = Thread.currentThread().getContextClassLoader();
		if(ci == null) {
			ci = ClassLoader.getSystemClassLoader();
		}
		//URL url = ci.getSystemResource(settingProperty);
		URL url = ci.getResource(settingProperty);
		//System.out.println(url.getPath());
		File propFile = new File(url.getPath());

		try {
			ins = new FileInputStream(propFile);
			prop.load(ins);
			result = prop.getProperty(key);
		} catch(Exception e) {
			result = "read fail";
		}

		return result;
	}

}
