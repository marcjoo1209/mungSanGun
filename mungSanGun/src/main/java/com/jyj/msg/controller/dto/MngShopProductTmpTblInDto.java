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
public class MngShopProductTmpTblInDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  @NotEmpty(message = "순서를 입력 하세요.")
  @Size(max = 5, message = "순서 입력 길이를 확인 하세요.")
  private String DIDX;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNA1;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNA2;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNA3;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNA4;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNA5;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNA6;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNA7;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNA8;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNA9;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNB1;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNB2;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNB3;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNB4;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNB5;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNB6;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNB7;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNB8;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNB9;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNC1;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNC2;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNC3;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNC4;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNC5;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNC6;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNC7;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNC8;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNC9;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMND1;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMND2;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMND3;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMND4;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMND5;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMND6;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMND7;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMND8;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMND9;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNE1;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNE2;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNE3;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNE4;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNE5;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNE6;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNE7;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNE8;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNE9;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNF1;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNF2;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNF3;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNF4;
  @ApiModelProperty(value = "Column", example = "Column")
  private String COLUMNF5;
  @ApiModelProperty(value = "USEYN", example = "USEYN")
  private String DUSEYN;
  @ApiModelProperty(value = "AUDITDTM", example = "AUDITDTM")
  private String DAUDITDTM;
  @ApiModelProperty(value = "CREATEDTM", example = "CREATEDTM")
  private String DCREATEDTM;
  @ApiModelProperty(value = "AUDITID", example = "AUDITID")
  private String DAUDITID;


}
