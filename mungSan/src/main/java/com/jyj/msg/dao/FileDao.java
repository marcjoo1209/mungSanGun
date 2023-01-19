/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyj.msg.controller.dto.FileDto;

/**
 * @create 2023. 1. 13.
 * @author 주영주
**/
@Repository
public class FileDao {
  @Autowired
  private SqlSessionTemplate mybatis;
  
  // 리스트 조회
  public List<FileDto> getFile(FileDto inDto) {
    List<FileDto> outDto =
        mybatis.selectList("FileMapper.getFile", inDto);
    return outDto;
  }

  // 리스트 조회
  public FileDto getOneFile() {
    FileDto outDto =
        mybatis.selectOne("FileMapper.getOneFile");
    return outDto;
  }

  // 리스트 조회
  public List<FileDto> getListFile() {
    List<FileDto> outDto =
        mybatis.selectList("FileMapper.getListFile");
    return outDto;
  }

  // 파일생성
  public int createFile(FileDto inDto) {
    int outDto =
        mybatis.insert("FileMapper.createFile", inDto);
    return outDto;
  }

  // 파일수정
  public int modifyFile(FileDto inDto) {
    int outDto =
        mybatis.update("FileMapper.modifyFile", inDto);
    return outDto;
  }

  // 파일수정
  public int modifyDelFile() {
    int outDto =
        mybatis.update("FileMapper.modifyDelFile");
    return outDto;
  }

  // 파일수정
  public int modifyStandByFile() {
    int outDto =
        mybatis.update("FileMapper.modifyStandByFile");
    return outDto;
  }
  
  
}
