package com.jyj.msg.common;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.MetadataException;
import com.drew.metadata.exif.ExifIFD0Directory;
import com.mortennobel.imagescaling.ResampleOp;

public class DateUtil {

	protected final static Logger logger = LoggerFactory.getLogger(DateUtil.class);

	public static String getInsertUpfile (String aptCd, HttpServletRequest request, MultipartFile file) throws Exception{

    	// 이미지 세로 방향으로 저장
    	//BufferedImage oimg = getOrientation(file, request);
		File imageFile = convert(file);				// 2. 원본 파일의 Orientation 정보를 읽는다. 
		String origin = imageFile.getName();
		BufferedImage imageT;

		if(request.getHeader("User-Agent").contains("Android") && !origin.substring(origin.lastIndexOf(".")+1).equals("gif")) {
			imageT = checkImage(imageFile, getOrientation(imageFile));
			ImageIO.write(imageT, "jpg", imageFile);
		}
    	
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
		
	    //저장 위치
	    String saveFolder     = aptCd + "/" + format_time1 + "/" + fileName ;
	    // 파일경로
	    String saveFolderFile = aptCd + "/" + format_time1 + "/" + fileName ;
	    // 절대경로
	    File   chkForderPath = new File(saveFolder);
	    String filePath      = request.getSession().getServletContext().getRealPath(saveFolderFile);
	    
	    File   target        = new File(request.getSession().getServletContext().getRealPath(aptCd + "/" + format_time1 + "/"), fileName);

		logger.info("===================== saveFolder =====================[" + saveFolder + "]");
		logger.info("===================== saveFolderFile =====================[" + saveFolderFile + "]");
		logger.info("===================== filePath =====================[" + filePath + "]");
		
	    try {
	    	// 폴더 없을경우 폴더 생성
		    if(!chkForderPath.exists())
		    {
		    	chkForderPath.mkdir(); //폴더생성
		    	
		    }
		    
		    // 파일생성
	    	//FileCopyUtils.copy(file.getBytes(), target);
		    FileCopyUtils.copy(imageFile, target);

	    	// 파일 이미지 크기 변환 로직 추가
	    	BufferedImage srcImage = ImageIO.read(new File(request.getSession().getServletContext().getRealPath(aptCd + "/" + format_time1 + "/"), fileName));
	    	//srcImage = Scalr.rotate(srcImage, Scalr.Rotation.CW_90, null);
	    	ResampleOp rO = new ResampleOp(1050, 1480);
	    	BufferedImage rImage = rO.filter(srcImage, null);

	    	ImageIO.write(rImage, fileSubN, new File(request.getSession().getServletContext().getRealPath(aptCd + "/" + format_time1 + "/"), fileName)); 
	    	
		} catch (Exception e) {
			// TODO: handle exception
		}
	    
	    logger.info("===================== getInsertUpfile End =====================");
	    
		return filePath;
	}
	
	// 인감파일
	public static String getInsertUpfileIngam (String aptCd, HttpServletRequest request, MultipartFile file) throws Exception{

    	// 이미지 세로 방향으로 저장
		logger.info("===================== 이미지 세로 방향으로 저장 =====================");
    	//BufferedImage oimg = getOrientation(file, request);
		logger.info("===================== 원본 파일의 Orientation 정보를 읽는다.  =====================");
		File imageFile = convert(file);				// 2. 원본 파일의 Orientation 정보를 읽는다. 
		String origin = imageFile.getName();
		BufferedImage imageT;

		logger.info("===================== 원본 파일을 로테이션 처리 한다.  =====================");
		if(request.getHeader("User-Agent").contains("Android") && !origin.substring(origin.lastIndexOf(".")+1).equals("gif")) {
			imageT = checkImage(imageFile, getOrientation(imageFile));
			ImageIO.write(imageT, "jpg", imageFile);
		}
    	
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
		
	    //저장 위치
	    String saveFolder     = "resources/" + "comimg" + "/" + format_time1 + "/" ;
	    // 파일경로
	    String saveFolderFile = "resources/" + "comimg" + "/" + format_time1 + "/" + fileName ;
	    // 절대경로
	    String filePath      = request.getSession().getServletContext().getRealPath(saveFolderFile);
	    String fileDirPath      = request.getSession().getServletContext().getRealPath(saveFolder);
	    File   chkForderPath = new File(fileDirPath);
	    
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
		    	chkForderPath.mkdir(); //폴더생성
		    	
		    }
		    else
		    {
		    	logger.info("이미 폴더가 있습니다.");
		    }
		    
		    // 파일생성
	    	//FileCopyUtils.copy(file.getBytes(), target);
		    FileCopyUtils.copy(imageFile, target);

	    	// 파일 이미지 크기 변환 로직 추가
	    	BufferedImage srcImage = ImageIO.read(new File(request.getSession().getServletContext().getRealPath("resources/" + aptCd + "/" + format_time1 + "/"), fileName));
	    	//srcImage = Scalr.rotate(srcImage, Scalr.Rotation.CW_90, null);
	    	ResampleOp rO = new ResampleOp(1050, 1480);
	    	BufferedImage rImage = rO.filter(srcImage, null);

	    	ImageIO.write(rImage, fileSubN, new File(request.getSession().getServletContext().getRealPath("resources/" + aptCd + "/" + format_time1 + "/"), fileName)); 
	    	
		} catch (Exception e) {
			// TODO: handle exception
		}
	    
	    logger.info("===================== getInsertUpfile End =====================");
	    
		return filePath;
	}

	public static void getOrientation (MultipartFile file, HttpServletRequest request) throws Exception{
		
		logger.info("===================== getOrientation Start =====================");
		
		File imageFile = convert(file);				// 2. 원본 파일의 Orientation 정보를 읽는다. 
		String origin = imageFile.getName();

		if(request.getHeader("User-Agent").contains("Android") && !origin.substring(origin.lastIndexOf(".")+1).equals("gif")) {
			BufferedImage image = checkImage(imageFile, getOrientation(imageFile));
			ImageIO.write(image, "jpg", imageFile);
		}
		
		/*
		int orientation = 1;  						// 회전정보, 1. 0도, 3. 180도, 6. 270도, 8. 90도 회전한 정보 
		int width = 0; 								// 이미지의 가로폭 
		int height = 0; 							// 이미지의 세로높이 
		int tempWidth = 0; 							// 이미지 가로, 세로 교차를 위한 임의 변수 
		
		Metadata metadata; 							// 이미지 메타 데이터 객체 
		Directory directory; 						// 이미지의 Exif 데이터를 읽기 위한 객체 
		JpegDirectory jpegDirectory; 				// JPG 이미지 정보를 읽기 위한 객체 
		
		try { 
			metadata = ImageMetadataReader.readMetadata(imageFile); 
			directory = metadata.getFirstDirectoryOfType(ExifIFD0Directory.class); 
			jpegDirectory = metadata.getFirstDirectoryOfType(JpegDirectory.class); 
			
			if(directory != null)
			{ 
				orientation = directory.getInt(ExifIFD0Directory.TAG_ORIENTATION); // 회전정보 
				width = jpegDirectory.getImageWidth(); // 가로 
				height = jpegDirectory.getImageHeight(); // 세로 
			} 
			
			// 3. 변경할 값들을 설정한다. 
			AffineTransform atf = new AffineTransform(); 
			System.out.println("orientation = " + orientation);
			switch (orientation) { 
				case 1: break; 
				
				case 2: // Flip X 
					atf.scale(-1.0, 1.0); 
					atf.translate(-width, 0); 
					break; 
				
				case 3: // PI rotation 
					atf.translate(width, height); 
					atf.rotate(Math.PI); 
					break; 
				
				case 4: // Flip Y 
					atf.scale(1.0, -1.0); 
					atf.translate(0, -height); 
					break; 
					
				case 5: // - PI/2 and Flip X 
					atf.rotate(-Math.PI / 2); 
					atf.scale(-1.0, 1.0); 
					break; 
				
				case 6: // -PI/2 and -width 
					atf.translate(height, 0); 
					atf.rotate(Math.PI / 2); 
					break; 
					
				case 7: // PI/2 and Flip 
					atf.scale(-1.0, 1.0); 
					atf.translate(-height, 0); 
					atf.translate(0, width); 
					atf.rotate( 3 * Math.PI / 2); 
					break; 
					
				case 8: // PI / 2 
					atf.translate(0, width); 
					atf.rotate( 3 * Math.PI / 2); 
					break; 
			} 
			
			switch (orientation) { 
				case 5: 
				case 6: 
				case 7: 
				case 8: 
					tempWidth = width; 
					width = height; 
					height = tempWidth; 
					break; 
			} 
			
			BufferedImage image = ImageIO.read(imageFile); 
			
			final BufferedImage afterImage = new BufferedImage(width, height, image.getType()); 
			
			final AffineTransformOp rotateOp = new AffineTransformOp(atf, AffineTransformOp.TYPE_BILINEAR); 
			
			final BufferedImage rotatedImage = rotateOp.filter(image, afterImage); 
			
			Iterator<ImageWriter> iter = ImageIO.getImageWritersByFormatName("jpg"); 
			
			ImageWriter writer = iter.next(); 
			
			ImageWriteParam iwp = writer.getDefaultWriteParam(); 
			
			iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT); 
			
			iwp.setCompressionQuality(1.0f); // 4. 회전하여 생성할 파일을 만든다. 
			
			File outFile = new File(filePath); 
			
			FileImageOutputStream fios = new FileImageOutputStream(outFile); // 5. 원본파일을 회전하여 파일을 저장한다. 
			
			writer.setOutput(fios); 
			
			writer.write(null, new IIOImage(rotatedImage ,null,null),iwp); 
			
			fios.close(); writer.dispose(); 
		} catch (ImageProcessingException e) { 
			e.printStackTrace(); 
		} catch (MetadataException e) { 
			e.printStackTrace(); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
	   */
		logger.info("===================== getOrientation End =====================");

	}
	
	public static File convert(MultipartFile mfile) throws IOException {
		File file = new File(mfile.getOriginalFilename());

		mfile.transferTo(file);
		
		return file;
		
	}

	public static BufferedImage checkImage(File file, int orientation) throws Exception {
		BufferedImage bi = ImageIO.read(file);
		
		if(orientation == 1) { //정위치
			return bi;
		} else if(orientation == 6) {
			return rotateImage(bi, 90);
		} else if(orientation == 3) {
			return rotateImage(bi, 180);
		} else if(orientation == 8) {
			return rotateImage(bi, 270);
		} else {
			return bi;
		}
		
	}
	
	public static int getOrientation(File file) throws ImageProcessingException, IOException, MetadataException {
		int orientation = 1;
		
		Metadata metadata = ImageMetadataReader.readMetadata(file);
		Directory directory = metadata.getFirstDirectoryOfType(ExifIFD0Directory.class);
		if(directory != null) {
			orientation = directory.getInt(ExifIFD0Directory.TAG_ORIENTATION);
		}
		
		return orientation;
	}
	
	public static BufferedImage rotateImage(BufferedImage bimage, int radians) throws Exception{
		BufferedImage newImage;
		if(radians == 90 || radians == 270) {
			newImage = new BufferedImage(bimage.getHeight(), bimage.getWidth(), bimage.getType());
		} else if (radians == 180) {
			newImage = new BufferedImage(bimage.getWidth(), bimage.getHeight(), bimage.getType());
		} else {
			return bimage;
		}
		
		Graphics2D graphics = (Graphics2D) newImage.getGraphics();
		graphics.rotate(Math.toRadians(radians), newImage.getWidth() / 2, newImage.getHeight() / 2);
		graphics.translate((newImage.getWidth() - bimage.getWidth()) / 2, (newImage.getHeight() - bimage.getHeight()) / 2);
		graphics.drawImage(bimage, 0, 0, bimage.getWidth(), bimage.getHeight(), null);
		
		return newImage;
		
	}

}