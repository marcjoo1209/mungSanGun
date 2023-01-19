/**
 * @file CodeLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jyj.msg.controller.dto.FileDto;
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.dao.FileDao;
import com.jyj.msg.service.FileService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Service
public class FileServiceImpl implements FileService{

  @Autowired
  FileDao fileMapper;

  public List<FileDto> getFile(FileDto inDto) {
    return fileMapper.getFile(inDto);
  }

  public FileDto getOneFile() {
	  return fileMapper.getOneFile();
  }
  
  public List<FileDto> getListFile() {
	  return fileMapper.getListFile();
  }
  
  public int modifyFile(FileDto inDto) {
    return fileMapper.modifyFile(inDto);
  }

  public int createFile(FileDto inDto) {
    return fileMapper.createFile(inDto);
  } 
  
  // 전체 삭제
  public int modifyDelFile() {
    return fileMapper.modifyDelFile();
  } 

  // 전체 삭제
  public int modifyStandByFile() {
    return fileMapper.modifyStandByFile();
  } 
}
