package com.sb.s1.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	public boolean delete(String name, String fileName, HttpSession httpSession)throws Exception{
		String path = httpSession.getServletContext().getRealPath("resources/uploaded/"+name);
		File file = new File(path, fileName);
		return file.exists()?file.delete():false;
	}
	
	public String upload(@RequestParam("multipartFile") MultipartFile multipartFile, HttpSession httpSession)throws Exception{
		String path = httpSession.getServletContext().getRealPath("resources/uploaded/"+multipartFile.getName());
		File file = new File(path);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getName();
		file = new File(file, fileName);
		multipartFile.transferTo(file);
		return fileName;
	}
}