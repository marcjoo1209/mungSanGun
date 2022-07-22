/**
 * @file dto.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Getter
@Setter
public class CodeLstOutDto {
  @ApiModelProperty(value = "순서", example = "1")
  private String IDX;

  @ApiModelProperty(value = "코드아이디", example = "1")
  private String CODEID;
  
  @ApiModelProperty(value = "코드이름", example = "1")
  private String CODENM;
  
  @ApiModelProperty(value = "코드값1", example = "1")
  private String CODEVAL1;
  
  @ApiModelProperty(value = "코드값2", example = "1")
  private String CODEVAL2;
  
  @ApiModelProperty(value = "코드값3", example = "1")
  private String CODEVAL3;
  
  @ApiModelProperty(value = "코드값4", example = "1")
  private String CODEVAL4;
  
  @ApiModelProperty(value = "코드값5", example = "1")
  private String CODEVAL5;
  
  @ApiModelProperty(value = "코드값6", example = "1")
  private String CODEVAL6;
  
  @ApiModelProperty(value = "코드값7", example = "1")
  private String CODEVAL7;
  
  @ApiModelProperty(value = "코드값8", example = "1")
  private String CODEVAL8;
  
  @ApiModelProperty(value = "코드값9", example = "1")
  private String CODEVAL9;
  
  @ApiModelProperty(value = "코드값10", example = "1")
  private String CODEVAL10;
  
  @ApiModelProperty(value = "변경사용자", example = "1")
  private String AUDITID;
  
  @ApiModelProperty(value = "변경일자", example = "1")
  private String AUDITDTM;

}
