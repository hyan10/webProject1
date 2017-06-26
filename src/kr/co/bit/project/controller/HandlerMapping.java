package kr.co.bit.project.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
	private Map<String, Controller> mappings = null;
	Properties prop = null;

	public HandlerMapping(String configName){
		mappings = new HashMap<>();
		prop = new Properties();
		
		try{
			InputStream is = new FileInputStream(configName);
			prop.load(is);
			
			Set<Object> keys = prop.keySet();
			
			for(Object key : keys){
				String className = prop.getProperty(key.toString());
				Class<?> cl = Class.forName(className);
				mappings.put(key.toString(), (Controller)cl.newInstance());
				System.out.println(key);
			}
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Controller getController(String uri){
		System.out.println(uri);
		System.out.println(mappings.get(uri));
		return mappings.get(uri);
	}
}
