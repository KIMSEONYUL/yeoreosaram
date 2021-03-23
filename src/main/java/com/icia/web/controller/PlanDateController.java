package com.icia.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.icia.web.model.HiBoard;
import com.icia.web.model.Paging;
import com.icia.web.model.PlanDate;
import com.icia.web.model.PlanMake;
import com.icia.web.model.Response;
import com.icia.web.service.PlanDateService;
import com.icia.web.service.PlanMakeService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;
import com.icia.web.util.JsonUtil;

@Controller("PlanDateController")
public class PlanDateController {
   
   private static Logger logger = LoggerFactory.getLogger(PlanDateController.class);
   
   //쿠키명
   @Value("#{env['auth.cookie.name']}")
   private String AUTH_COOKIE_NAME; 
   
   @Autowired
   private PlanDateService planDateService;
   
   @Autowired
   private PlanMakeService planMakeService;


   @RequestMapping(value="/board2/myPlan")
   public String myPlan(ModelMap model,HttpServletRequest request, HttpServletResponse response)
   {
       String userId2 = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
       PlanDate planDate = new PlanDate();
       PlanMake planMake = new PlanMake();
       String pTitle = null;
      List<PlanDate> planlist = null;
      List<PlanMake> planlist2 = null;
      
      
      if(userId2 != null)
      {      
         planDate.setUserId2(userId2);
         planMake.setUserId2(userId2);
         
         planlist =  planDateService.planList(planDate);
         
         if(planlist != null)
         {
            try 
            {
            //planMake = planMakeService.planMakeSelect2(planlist.get(0).getpNoSeq2());
            planlist2 = planMakeService.planList(planMake);
            
            pTitle = planMake.getpTitle();
            }
            catch(Exception e)
            {
               pTitle = null;
            }
         }
      }
      
      logger.debug("+++++++++++++++++++++ pTitle=[" + pTitle + "]+++++++++++++++++++++++++++");
      
      
      
       model.addAttribute("pTitle", pTitle);
       model.addAttribute("userId2", userId2);
       model.addAttribute("planlist", planlist);
       model.addAttribute("planlist2", planlist2);

       
       return "/board2/myPlan";
       
   }

   

   // planDate 테이블에 넣기
   @RequestMapping(value="/planDate/planInsert2", method=RequestMethod.POST)

   public String planInsert2(ModelMap model , HttpServletRequest request, HttpServletResponse response) {
      
      int i=1;
      String userId2 = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
       long pNoSeq2 = HttpUtil.get(request, "pNoSeq", (long)0);
       String pTitle = HttpUtil.get(request, "pTitle", "");
       String pStart = HttpUtil.get(request, "pStart", "");
       String pEnd = HttpUtil.get(request, "pEnd", "");
       long pStartNum = Long.parseLong(pStart);
       long pEndNum = Long.parseLong(pEnd);
       
       
       PlanDate planDate = new PlanDate();
       List<PlanDate> planlist = null;

       
      
       if(pStart != null && pEnd != null)
       {                    
          for(i=1 ; i<=(pEndNum-pStartNum)+1 ; i++)
          {
             planDate.setpNoSeq2(pNoSeq2);
             planDate.setUserId2(userId2);
             
             
             HashMap<String, String> pDay = new HashMap<String, String>();
             pDay.put("Day" , HttpUtil.get(request, "pDay"+i , ""));
             planDate.setpDay(pDay.get("Day"));
             
             
             request.setAttribute("pDay"+i, pDay);
//////////////////////////////////////////////////////////////////////////////////////////////////////////        
             HashMap<String, String> place_split = new HashMap<String, String>();
             place_split.put("place_split1", HttpUtil.get(request, "location"+i, ""));   //day1의 일정을 배열로 담는다
             
             logger.debug("+++++++++++++++++++++++++++++++");
             logger.debug("+++++++++ pPlace = [" + place_split.get("place_split1") + "] +++++++++");
             
             for(int j=0 ; j<place_split.get("place_split1").split(" ").length ; j++)      //출력할 장소가 들어있는 배열의 길이 만큼 반복해야함
             {
                planDate.setpPlace(place_split.get("place_split1").split(" ")[j]);
                
                planDateService.planDateInsert2(planDate);
                
                
             }
             
             request.setAttribute("location"+i, place_split.get("place_split1"));   //pPlace+i는 배열인 상태로 존재한다
          }
          
          
          planlist =  planDateService.planList(planDate); 
       }
       

       model.addAttribute("pNoSeq2", pNoSeq2);
       model.addAttribute("userId2", userId2);
       model.addAttribute("pTitle", pTitle);
       model.addAttribute("pStart", pStart);
       model.addAttribute("pEnd", pEnd);
       model.addAttribute("pStartNum", pStartNum);
       model.addAttribute("pEndNum", pEndNum);
       model.addAttribute("planlist", planlist);
       
       //return "/board2/myPlan";
       return "redirect:/board2/myPlan";   //(redirect:) : 새로고침
   }
   
   
   //게시물 조회
   @RequestMapping(value="/board2/myPlanView")
   public String view(ModelMap model, HttpServletRequest request, HttpServletResponse response)
   {
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
       long pNoSeq2 = HttpUtil.get(request, "pNoSeq2", (long)0);
       String pTitle = HttpUtil.get(request, "pTitle", "");
       
       logger.debug("+++++++++++++ pTitle = [" + pTitle + "]+++++++++++++++++++++");
             
     //게시물 리스트
       List<PlanDate> list = null;
       PlanDate planDate = new PlanDate();
       
       planDate.setpNoSeq2(pNoSeq2);
       planDate.setUserId2(cookieUserId);
       
       //if(pNoSeq2 > 0)
       //{
          list = planDateService.planViewList(planDate);
      
      // }
       
       model.addAttribute("pNoSeq2", pNoSeq2);
       model.addAttribute("list", list);
       model.addAttribute("pTitle", pTitle);
      return "/board2/myPlanView";
   }
   
   
   @RequestMapping(value="/board2/planDelete", method=RequestMethod.POST)
   @ResponseBody
   public Response<Object> planDelete(HttpServletRequest request, HttpServletResponse response)
   {
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
      long pNoSeq2 = HttpUtil.get(request, "pNoSeq2", (long)0);         
      
      logger.debug("++++++++++++++++++pNoSeq2 =[" + pNoSeq2 + "]++++++++++++++++++++");
      
      Response<Object> ajaxResponse = new Response<Object>();
      
      if(pNoSeq2 > 0)
      {
  
               try
               {                                                     
                     if(planDateService.planDelete(pNoSeq2) > 0)
                     {
                        planMakeService.planDelete(pNoSeq2);
                        ajaxResponse.setResponse(0, "Seccess");
                     }
                     else
                     {
                        ajaxResponse.setResponse(500, "Internal Server Error");
                     }                  
               }
               
               catch(Exception e)
               {
                  logger.error("[HiBoardController] /board/delete Exception", e);
                  ajaxResponse.setResponse(500, "internal Server Error");
               }

      }

      
      if(logger.isDebugEnabled())
         {
            logger.debug("[PlanDateController] /board2/planDelete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
         }
      
      return ajaxResponse;
      
      
   }
   
}