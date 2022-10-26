/**
 * @file TelegramNotiUserLstController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.jyj.msg.controller.dto.TelegramNotiUserLstInDto;
import com.jyj.msg.controller.dto.TelegramNotiUserLstOutDto;
import com.jyj.msg.service.TelegramNotiUserLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
//@Slf4j
@Controller
@SessionAttributes("aptinfo")
public class TelegramNotiUserLstController {
	@Autowired
	TelegramNotiUserLstService telegramNotiUserLstService;

	@RequestMapping(value = "/getlist-telegram-noti-user-lst", method = RequestMethod.POST)
	@ApiOperation(value = "알림 대상 리스트 조회 로컬 호출", notes = "알림 대상 리스트 조회 로컬 호출")
	public List<TelegramNotiUserLstOutDto> getListTelegramNotiUserLst() throws IOException {
		// log.debug("/getlist-telegram-noti-user-lst 호출 시작");
		List<TelegramNotiUserLstOutDto> outDto = telegramNotiUserLstService.getListTelegramNotiUserLst();

		return outDto;
	}

	@RequestMapping(value = "/get-telegram-noti-user-lst", method = RequestMethod.POST)
	@ApiOperation(value = "알림 대상 조회 호출", notes = "알림 대상 리스트 조회 호출")
	public TelegramNotiUserLstOutDto getTelegramNotiUserLst(@RequestBody TelegramNotiUserLstInDto inDto)
			throws IOException {
		// log.debug("/get-telegram-noti-user-lst 호출 시작");
		TelegramNotiUserLstOutDto outDto = telegramNotiUserLstService.getTelegramNotiUserLst(inDto);

		return outDto;
	}

	@RequestMapping(value = "/create-telegram-noti-user-lst", method = RequestMethod.POST)
	@ApiOperation(value = "알림 대상 생성 호출", notes = "알림 대상 리스트 생성 호출")
	public Integer createTelegramNotiUserLst(@RequestBody TelegramNotiUserLstInDto inDto) throws IOException {
		// log.debug("/create-telegram-noti-user-lst 호출 시작");
		Integer outDto = telegramNotiUserLstService.createTelegramNotiUserLst(inDto);

		return outDto;
	}

	@RequestMapping(value = "/modify-telegram-noti-user-lst", method = RequestMethod.POST)
	@ApiOperation(value = "알림 대상 수정 호출", notes = "알림 대상 리스트 수정 호출")
	public Integer modifyTelegramNotiUserLst(@RequestBody TelegramNotiUserLstInDto inDto) throws IOException {
		// log.debug("/modify-telegram-noti-user-lst 호출 시작");
		Integer outDto = telegramNotiUserLstService.modifyTelegramNotiUserLst(inDto);

		return outDto;
	}

	@RequestMapping(value = "/remove-telegram-noti-user-lst", method = RequestMethod.POST)
	@ApiOperation(value = "알림 대상 수정 호출", notes = "알림 대상 리스트 수정 호출")
	public Integer removeTelegramNotiUserLst(@RequestBody TelegramNotiUserLstInDto inDto) throws IOException {
		// log.debug("/remove-telegram-noti-user-lst 호출 시작");
		Integer outDto = telegramNotiUserLstService.removeTelegramNotiUserLst(inDto);

		return outDto;
	}
}
