package com.inc.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileServiceImpl implements FileService {

	@Override
	public String saveFile(String path, MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			File f = new File(path, filename);
			while(f.exists()) {
				long time = System.currentTimeMillis();
				int index = filename.lastIndexOf('.');
				String f_name = filename.substring(0, index);
				String f_ext = filename.substring(index);
				filename = f_name + "_" + time + f_ext;
				f = new File(path, filename);
			}
			file.transferTo(f);
			return filename;
		}
		return "no_file";
	}

}
