package com.icia.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.common.util.StringUtil;
import com.icia.web.dao.PlanMakeDao;
import com.icia.web.model.PlanDate;
import com.icia.web.model.PlanMake;
import com.icia.web.model.Response;
import com.icia.web.service.PlanDateService;
import com.icia.web.service.PlanMakeService;
import com.icia.web.service.UserService2;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;

@Controller("PlanMakeController")
public class PlanMakeController {
   private static Logger logger = LoggerFactory.getLogger(PlanMakeController.class);
   
   //쿠키명
   @Value("#{env['auth.cookie.name']}")
   private String AUTH_COOKIE_NAME; 
   
   @Autowired
   private PlanMakeService planMakeService;
   
   @Autowired
   private PlanDateService planDateService;

   //myPlan으로 경로 추가 해주기
  /*@RequestMapping(value="/board2/myPlan")
   public String myPlan(ModelMap model,HttpServletRequest request, HttpServletResponse response)
   {

       String userId2 = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);

      PlanMake planMake = new PlanMake();
      List<PlanMake> planlist = null;
      
      planMake.setUserId2(userId2);

      logger.debug("+++++++++++++++++++++++++++++++++++");
      logger.debug("+++++++ userId2 = [ " + userId2 + "] +++++++++++++++++++");
      
      planlist =  planMakeService.planList(planMake);
      
      logger.debug("+++++++++++++++++++++++++++++++++++");
      logger.debug("+++++++ planlist = [ " + planlist + "] +++++++++++++++++++");

       model.addAttribute("userId2", userId2);
       model.addAttribute("planlist", planlist);

       
       return "/board2/myPlan";
       
   }*/
   

   @RequestMapping(value="/travel/join3")
   public String join3(ModelMap model,HttpServletRequest request, HttpServletResponse response)
   {
      String userId2 = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
       String pTitle = HttpUtil.get(request, "pTitle", "");
       String regDate2 = HttpUtil.get(request, "regDate2", "");        
       String pStart = HttpUtil.get(request,"pStart", "");
       String pEnd = HttpUtil.get(request, "pEnd", "");

       

      PlanMake planMake = new PlanMake();
      
      planMake.setUserId2(userId2);
      planMake.setpTitle(pTitle);
      planMake.setRegDate2(regDate2);
      planMake.setpStart(pStart);
      planMake.setpEnd(pEnd);
      
      planMakeService.planMakeInsert2(planMake);
      
      long pNoSeq = planMake.getpNoSeq();

      
      
       
       model.addAttribute("pNoSeq", pNoSeq);
       model.addAttribute("userId2", userId2);
       model.addAttribute("pTitle", pTitle);
       model.addAttribute("regDate2", regDate2);
       model.addAttribute("pStart", pStart);
       model.addAttribute("pEnd", pEnd);
       
       return "/travel/join3";
   }

   
   
   //일정 추가 (캘린더에 있는 값)
   @RequestMapping(value="/planMake/planInsert", method=RequestMethod.POST)
   @ResponseBody
   public Response<Object> planInsert(HttpServletRequest request, HttpServletResponse response) {
      
      //조회항목
       String userId2 = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
       String pTitle = HttpUtil.get(request, "_pTitle", "");      
       String pStart = HttpUtil.get(request,"_pStart");
       String pEnd = HttpUtil.get(request, "_pEnd");
       
       
       
       Response<Object> ajaxResponse = new Response<Object>();
       
       if(!StringUtil.isEmpty(userId2)) 
       {
             PlanMake planMake = new PlanMake();
             
             planMake.setUserId2(userId2);
             planMake.setpTitle(pTitle);
             planMake.setpStart(pStart);
             planMake.setpEnd(pEnd);


             
             if(planMakeService.planMakeInsert2(planMake) > 0) 
             {
                logger.debug("+++++++++++++++++++++++++++++++++++++++++++");
                logger.debug("pNoSeq = [ " + planMake.getpNoSeq() + "]++++++++++++++++++++++"); 
                
                long pNoSeq = planMake.getpNoSeq();
                
                ajaxResponse.setResponse(0, "성공! 테이블 확인~");
             }
             else 
             {
                ajaxResponse.setResponse(500, "에러^^;");
             }
       }
       
       return ajaxResponse;
   }

}