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

public class CommonUtil {

	protected final static Logger logger = LoggerFactory.getLogger(CommonUtil.class);

    public static String checkDataIsNull(Object ob) {
      String returnVal = "";
      if(ob == null) {
        returnVal = "";
        
      } else {
        returnVal = ob.toString();
      }
      return returnVal;
    }
}