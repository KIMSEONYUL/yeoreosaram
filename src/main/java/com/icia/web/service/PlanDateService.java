package com.icia.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.icia.web.dao.PlanDateDao;
import com.icia.web.model.PlanDate;
import com.icia.web.model.PlanMake;

@Service("planDateService")
public class PlanDateService {
   
   private static Logger logger = LoggerFactory.getLogger(PlanDateService.class);
   
   @Autowired
   private PlanDateDao planDateDao;
   
   /*조회*/
   public List<PlanDate> planViewList(PlanDate planDate) {
      
      
         List<PlanDate> planViewlist = null;
         
         try
          {
            planViewlist = planDateDao.planViewList(planDate);
          }
          catch(Exception e)
          {
             logger.error("[PlanDateService] planList Exception", e);
          }
          
          return  planViewlist;
      
      }
   
   /*추가*/
   public int planDateInsert2(PlanDate planDate)
   {
      int count=0;
         
   try
   {   
      count=planDateDao.planDateInsert2(planDate);
   }
   catch(Exception e)
   {
      logger.error("[PlanDateService] planDateInsert2 Exception", e);
   }
   
         return count;
   }
   
   /*조회*/
  public PlanDate planDateSelect2(long pNoSeq2) {
      PlanDate planDate = null;
      
      try 
      {
         planDate = planDateDao.planDateSelect2(pNoSeq2);       
      }
      catch(Exception e) 
      {
         logger.error("[PlanDateService] planDateSelect2 Exception 오류 확인!",e);
      }
      return planDate;
   }
   

   
   
   public List<PlanDate> planList(PlanDate planDate) {
      List<PlanDate> planlist = null;
      
      try
       {
          planlist = planDateDao.planList(planDate);
       }
       catch(Exception e)
       {
          logger.error("[PlanDateService] planList Exception", e);
       }
       
       return  planlist;
   
   }


   public int planDelete(long pNoSeq2)
   {
      int count = 0;
      
      try
      {
         count = planDateDao.planDelete(pNoSeq2);
      }
      catch(Exception e)
      {
         logger.error("[PlanDateService] planDelete Exception", e);
      }
      
      return count;
   }

   
}