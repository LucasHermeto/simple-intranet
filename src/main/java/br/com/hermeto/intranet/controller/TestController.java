package br.com.hermeto.intranet.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/test")
public class TestController {
	
	private String path = "D:/Programa��o/workspace-centro/site/web/resources/";
	
	@RequestMapping("test-file")
	public String testFile(){
		return "test/files";
	}
	
	@RequestMapping("add-file")
	public String addFile(@RequestParam("files") MultipartFile files[],
			@RequestParam("names") String names[], Model model){
		
		if(files.length != 0){
			int i = 0;
			for(MultipartFile file : files){
				
				try {
					byte[] bytes = file.getBytes();
					
					// Creating the directory to store file
					File dir = new File(path + "test");
					if (!dir.exists())
						dir.mkdirs();
					
					// Create the file on server
					File serverFile = new File(dir.getAbsolutePath()
							+ File.separator + file.getOriginalFilename());
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					
					
				} catch (Exception e) {
					model.addAttribute("erro", "Falha no upload do arquivo:" + names[i] + "(" + e.getMessage() + ")");
					return "test/files";
				}
				i++;
			}
		}
		
		model.addAttribute("message", "Os seus arquivos foram adicionandos com sucesso");
		
		return "test/files";
	}

}
