/**
 * @file CodeLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service;

import java.util.List;

import com.jyj.msg.controller.dto.FileDto;

/**
 * @create 2023. 1. 13.
 * @author 주영주
**/
public interface FileService {

  List<FileDto> getFile(FileDto inDto);

  FileDto getOneFile();
  
  List<FileDto> getListFile();
  
  int modifyFile(FileDto inDto);

  int createFile(FileDto inDto);

  // 전체 삭제
  int modifyDelFile();

  // 전체 삭제
  int modifyStandByFile();
}
