package com.jyj.msg.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MyInterceptor extends HandlerInterceptorAdapter {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		logger.info("===========================          START         ===========================");
		logger.info(" Request URI \t:  " + request.getRequestURI());
		try {
			if(request.getRequestURI().equals("/TonyTest.do") 
					|| request.getRequestURI().equals("/home.do")
					|| request.getRequestURI().equals("/ModifyItemList.do")
					|| request.getRequestURI().equals("/postModifyItemList.do")
					|| request.getRequestURI().equals("/ModifyTeamInfo.do")
					|| request.getRequestURI().equals("/postModifyTeam.do")
					|| request.getRequestURI().equals("/ModifyGubun.do")
					|| request.getRequestURI().equals("/ModifyInfo.do")
					|| request.getRequestURI().equals("/mainpage.do")
					|| request.getRequestURI().equals("/getListOrderItemLst.do")
					|| request.getRequestURI().equals("/createOrderItemLst.do")
					|| request.getRequestURI().equals("/getOrderItemLst.do")
                    || request.getRequestURI().equals("/")
                    || request.getRequestURI().equals("")
                    || request.getRequestURI().equals("/admin-page-lst")
                    || request.getRequestURI().equals("/modifyAdminPage")
                    || request.getRequestURI().equals("/removeAdminPage")
                    || request.getRequestURI().equals("/user-page")
                    || request.getRequestURI().equals("/admin-page-lst-main")
                    || request.getRequestURI().equals("/modifyAdminPage")
                    || request.getRequestURI().equals("/modifyAdminPage")
                    || request.getRequestURI().equals("/excelDownload")
                    || request.getRequestURI().equals("/excelUpload")
			   ) {
				return true;
			} 
			if (request.getSession().getAttribute("_loginSession_") == null
					   && (request.getRequestURI().equals("/userLogin.do")
						|| request.getRequestURI().equals("/admin_main.do")
						|| request.getRequestURI().equals("/login.do")
						|| request.getRequestURI().equals("/getDongList")
						|| request.getRequestURI().equals("/getHoList")
					    || request.getRequestURI().equals("/pdf_lst.do")
					    || request.getRequestURI().equals("/pdf_lst_v2.do")
					    || request.getRequestURI().equals("/pdf_lst_v3.do")
					    || request.getRequestURI().equals("/pdf_lst_v5.do")
					    || request.getRequestURI().equals("/pdf_lst_v6.do")
					    || request.getRequestURI().equals("/pdf_lst_v7.do")
					    || request.getRequestURI().equals("/pdf_lst_v8.do")
					    || request.getRequestURI().equals("/pdf_lst_v9.do")
					    || request.getRequestURI().equals("/pdf_lst_v9_1.do")
					    || request.getRequestURI().equals("/pdf_lst_v10.do")
					    || request.getRequestURI().equals("/pdf_lst_v11.do")
					    || request.getRequestURI().equals("/pdf_lst_v12.do")
					    || request.getRequestURI().equals("/pdf_lst_v13.do")
					    || request.getRequestURI().equals("/pdf_lst_v14.do")
					    || request.getRequestURI().equals("/pdf_lst_v15.do")
					    || request.getRequestURI().equals("/pdf_lst_v16.do")
					    || request.getRequestURI().equals("/pdf_lst_v17.do")
					    || request.getRequestURI().equals("/delConInfo.do")
						|| request.getRequestURI().equals("/pdfAllview.do")
						|| request.getRequestURI().equals("/excelDownload")
						|| request.getRequestURI().equals("/chart.do")
						|| request.getRequestURI().equals("/defect_admin_main.do")
						|| request.getRequestURI().equals("/getDefectHoList")
						|| request.getRequestURI().equals("/getDefectDongList")
						|| request.getRequestURI().equals("/excelDefectListDownload")
						|| request.getRequestURI().equals("/defect_pdf_lst.do")
						|| request.getRequestURI().equals("/viewDefect.do")
						|| request.getRequestURI().equals("/trans_pdf_lst.do")
						|| request.getRequestURI().equals("/defectPdfAllview.do")
						|| request.getRequestURI().equals("/defectAptInfoCheck")
						|| request.getRequestURI().equals("/insertDefectAptInfo.do")
						|| request.getRequestURI().equals("/logout")
						|| request.getRequestURI().equals("/DefectUpload.do")
						  )
			          ) {
				response.sendRedirect("/userLogin.do");
				return false;
			} else if (request.getSession().getAttribute("_loginSession_") != null
					   && (request.getRequestURI().equals("/userLogin.do")
						|| request.getRequestURI().equals("/admin_main.do")
						|| request.getRequestURI().equals("/login.do")
						|| request.getRequestURI().equals("/getDongList")
						|| request.getRequestURI().equals("/getHoList")
					    || request.getRequestURI().equals("/pdf_lst.do")
					    || request.getRequestURI().equals("/pdf_lst_v2.do")
					    || request.getRequestURI().equals("/pdf_lst_v3.do")
					    || request.getRequestURI().equals("/pdf_lst_v5.do")
					    || request.getRequestURI().equals("/pdf_lst_v6.do")
					    || request.getRequestURI().equals("/pdf_lst_v7.do")
					    || request.getRequestURI().equals("/pdf_lst_v8.do")
					    || request.getRequestURI().equals("/pdf_lst_v9.do")
					    || request.getRequestURI().equals("/pdf_lst_v9_1.do")
					    || request.getRequestURI().equals("/pdf_lst_v10.do")
					    || request.getRequestURI().equals("/pdf_lst_v11.do")
					    || request.getRequestURI().equals("/pdf_lst_v12.do")
					    || request.getRequestURI().equals("/pdf_lst_v13.do")
					    || request.getRequestURI().equals("/pdf_lst_v14.do")
					    || request.getRequestURI().equals("/pdf_lst_v15.do")
					    || request.getRequestURI().equals("/pdf_lst_v16.do")
					    || request.getRequestURI().equals("/pdf_lst_v17.do")
					    || request.getRequestURI().equals("/delConInfo.do")
						|| request.getRequestURI().equals("/pdfAllview.do")
						|| request.getRequestURI().equals("/excelDownload")
						|| request.getRequestURI().equals("/chart.do")
						|| request.getRequestURI().equals("/defect_admin_main.do")
						|| request.getRequestURI().equals("/getDefectHoList")
						|| request.getRequestURI().equals("/getDefectDongList")
						|| request.getRequestURI().equals("/excelDefectListDownload")
						|| request.getRequestURI().equals("/defect_pdf_lst.do")
						|| request.getRequestURI().equals("/viewDefect.do")
						|| request.getRequestURI().equals("/trans_pdf_lst.do")
						|| request.getRequestURI().equals("/defectPdfAllview.do")
						|| request.getRequestURI().equals("/defectAptInfoCheck")
						|| request.getRequestURI().equals("/insertDefectAptInfo.do")
						|| request.getRequestURI().equals("/logout")
						|| request.getRequestURI().equals("/DefectUpload.do")
						  )
			          ) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv) throws Exception {
		
		logger.info("===========================          END           ===========================");
	}

}
	