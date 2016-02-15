package br.com.hermeto.intranet.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class Controller {
	
	protected String path = "";
	
	protected void addFile(String secondPath, Long id, MultipartFile file) throws IOException{

		String finalPath = path + secondPath;
		
		byte[] bytes = file.getBytes();
		
		// Creating the directory to store file
		File dir = new File(finalPath);
		if (!dir.exists())
			dir.mkdirs();
		
		// Create the file on server
		File serverFile = new File(dir.getAbsolutePath()
				+ File.separator + id + ".jpg");
		BufferedOutputStream stream = new BufferedOutputStream(
			new FileOutputStream(serverFile));
		stream.write(bytes);
		stream.close();
	}

}
