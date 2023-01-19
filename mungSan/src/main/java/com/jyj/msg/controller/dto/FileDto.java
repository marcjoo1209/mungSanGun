/**
 * @file dto.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller.dto;

import io.swagger.annotations.ApiModelProperty;

/**
 * @create 2023. 1. 13.
 * @author 주영주
 **/
public class FileDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  private String IDX;

  @ApiModelProperty(value = "파일명", example = "1")
  private String FILENAME;
  
  @ApiModelProperty(value = "생성년월", example = "1")
  private String CREDTM;
  
  @ApiModelProperty(value = "삭제유무", example = "1")
  private String DELYN;
  
  @ApiModelProperty(value = "원본파일명", example = "1")
  private String ORGFILENAME;

public String getIDX() {
	return IDX;
}

public void setIDX(String iDX) {
	IDX = iDX;
}

public String getFILENAME() {
	return FILENAME;
}

public void setFILENAME(String fILENAME) {
	FILENAME = fILENAME;
}

public String getCREDTM() {
	return CREDTM;
}

public void setCREDTM(String cREDTM) {
	CREDTM = cREDTM;
}

public String getDELYN() {
	return DELYN;
}

public void setDELYN(String dELYN) {
	DELYN = dELYN;
}

public String getORGFILENAME() {
	return ORGFILENAME;
}

public void setORGFILENAME(String oRGFILENAME) {
	ORGFILENAME = oRGFILENAME;
}
  
  
  
}
