package com.jyj.msg.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class CommonUtil {

	protected final static Logger logger = LoggerFactory.getLogger(CommonUtil.class);

	private static String OS = System.getProperty("os.name").toLowerCase();
	
    public static String checkDataIsNull(Object ob) {
      String returnVal = "";
      if(ob == null) {
        returnVal = "";
        
      } else {
        returnVal = ob.toString();
      }
      return returnVal;
    }

	public static String saveFile (HttpServletRequest request, MultipartFile file) throws Exception{

		logger.info("===================== 원본 파일의 Orientation 정보를 읽는다.  =====================");
		File imageFile = convert(file);				// 2. 원본 파일의 Orientation 정보를 읽는다. 
		String origin = imageFile.getName();
		BufferedImage imageT;

		logger.info("===================== getInsertUpfile Start =====================");
		logger.info("===================== 파일 이름, 파일 경로 변경 저장 로직 시작 =====================");
		
		// 당일 날짜로 이미지 저장 경로 포맷 셋팅
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
		Calendar time            = Calendar.getInstance();
		String format_time1      = format1.format(time.getTime());
		
		logger.info("===================== format1 =====================");
		logger.info("===================== time =====================");
		logger.info("===================== format_time1 =====================[" + format_time1 + "]");
		
		String orgFile = file.getOriginalFilename();

		logger.info("===================== orgFile =====================[" + orgFile + "]");
		
		//확장자 지정
		String fileSubN = orgFile.split("\\.")[1];
		// 파일명
	    String fileName = "upfile"+System.currentTimeMillis()+"."+ fileSubN;

		logger.info("===================== fileSubN =====================[" + fileSubN + "]");
		logger.info("===================== fileName =====================[" + fileName + "]");
		
		String saveFolder     = "";
		String saveFolderFile = "";
		if (isWindows()) {
		    //저장 위치
		    saveFolder     = "resources\\" + "comimg" + "\\" + format_time1 + "\\" ;
		    // 파일경로
		    saveFolderFile = "resources\\" + "comimg" + "\\" + format_time1 + "\\" + fileName ;
		   
		}
		else {

		    //저장 위치
		    saveFolder     = "resources/" + "comimg" + "/" + format_time1 + "/" ;
		    // 파일경로
		    saveFolderFile = "resources/" + "comimg" + "/" + format_time1 + "/" + fileName ;
		   
		} // 절대경로
	    String filePath      = request.getSession().getServletContext().getRealPath(saveFolderFile);
	    String fileDirPath      = request.getSession().getServletContext().getRealPath(saveFolder);
	    File   chkForderPath = new File(fileDirPath);
	    Path directoryPath = Paths.get(fileDirPath);
	    
	    File   target        = new File(request.getSession().getServletContext().getRealPath("resources/" + "comimg" + "/" + format_time1 + "/"), fileName);

		logger.info("===================== saveFolder =====================[" + saveFolder + "]");
		logger.info("===================== fileDirPath =====================[" + fileDirPath + "]");
		logger.info("===================== saveFolderFile =====================[" + saveFolderFile + "]");
		logger.info("===================== filePath =====================[" + filePath + "]");
		
	    try {
	    	// 폴더 없을경우 폴더 생성
		    if(!chkForderPath.exists())
		    {
		    	logger.info("폴더 없을경우 폴더 생성");
		    	//boolean chktf = chkForderPath.mkdir(); //폴더생성
		    	//logger.error("폴더 없을경우 폴더 생성 결과 : " + chktf);
	            // 디렉토리 생성
	            Files.createDirectories(directoryPath);
		    }
		    else
		    {
		    	logger.info("이미 폴더가 있습니다.");
		    }
		    
		    // 파일생성
	    	//FileCopyUtils.copy(file.getBytes(), target);
		    FileCopyUtils.copy(imageFile, target);
		    Runtime.getRuntime().exec("chmod 777 " + filePath);
		    Runtime.getRuntime().exec("chmod 777 " + fileDirPath);
		    Runtime.getRuntime().exec("chmod 777 " + target);
		    Runtime.getRuntime().exec("chmod 777 " + imageFile);

		} catch (Exception e) {
			// TODO: handle exception
		}
	    
	    logger.info("===================== getInsertUpfile End =====================");
	    
		return filePath;
	}

	public static File convert(MultipartFile mfile) throws IOException {
		File file = new File(mfile.getOriginalFilename());

		mfile.transferTo(file);
		
		return file;
		
	}
	
	public static boolean isWindows() {  
		  
		return (OS.indexOf("win") >= 0);  
	  
	}  


}