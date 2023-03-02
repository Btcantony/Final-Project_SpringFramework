package main.java.com.web.util;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import main.java.com.web.dto.Files;
import main.java.com.web.service.AdminService;

public class ImgHelper {
	
	/* 이미지 저장 후 파일테이블의 키를 반환 합니다.*/
	public Files saveImg(HttpServletRequest request, AdminService adminService) throws Exception {
		Files file = new Files();
		boolean isMultipart = ServletFileUpload.isMultipartContent(request); // multipart로 전송되었는가를 체크
		if (isMultipart) {
			ServletContext context = request.getSession().getServletContext();
			String root = context.getRealPath("/");
			File temporaryDir = new File(root + "/resources/");
			String realDir = root + "/resources/files/";
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(temporaryDir);
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
			Iterator iter = items.iterator();
			
			while (iter.hasNext()) {
				FileItem fileItem = (FileItem) iter.next(); // 파일을 가져온다
				if (!fileItem.isFormField()) {
					UUID uuid = UUID.randomUUID();
					String real_name = fileItem.getName();
					int pos = real_name.lastIndexOf(".");
					String extend_name = real_name.substring(pos + 1);
					String file_name = uuid.toString() + "." + extend_name;
					String size = String.valueOf(fileItem.getSize());
					
					File uploadedFile = new File(realDir, file_name); // 실제 디렉토리에 fileName으로 카피 된다.
					fileItem.write(uploadedFile);
					fileItem.delete();
														
					file.setExtend_name(extend_name);
					file.setFile_name(file_name);
					file.setReal_name(real_name);
					file.setSize(size);
					file.setUuid(uuid.toString());
					file.setUrl("/resources/files/"+file_name);
					
					adminService.insert_file(file);
				}
			}
		}
		return file;
	}
}
