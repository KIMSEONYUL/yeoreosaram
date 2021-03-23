package com.icia.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.web.dao.PlanMakeDao;
import com.icia.web.model.PlanDate;
import com.icia.web.model.PlanMake;


@Service("planMakeService")

public class PlanMakeService {
   private static Logger logger = LoggerFactory.getLogger(PlanMakeService.class);
   
   @Autowired
   private PlanMakeDao planMakeDao;

   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
      public int planMakeInsert2(PlanMake planMake)
      {
         int count=0;
         
         try
         {   
            count=planMakeDao.planMakeInsert2(planMake);
         }
         catch(Exception e)
         {
            logger.error("[PlanMakeService] planMakeInsert2 Exception", e);
         }
         
         return count;
      }
   
   
   //일정 조회[아이디 조회로 다 바꿈]
   public PlanMake planMakeSelect2(long pNoSeq)
   {
      PlanMake planMake = null;
      
      try {
         planMake = planMakeDao.planMakeSelect2(pNoSeq);
      }
      catch(Exception e) {
         logger.error("[PlanMakeService] planMakeSelect2 Exception 오류다!",e);
      }
      return planMake;
   }
   
  
   
   public List<PlanMake> planList(PlanMake planMake) {
      List<PlanMake> planlist = null;
      
      try
       {
          planlist = planMakeDao.planList(planMake);
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
         count = planMakeDao.planDelete(pNoSeq2);
      }
      catch(Exception e)
      {
         logger.error("[PlanMakeService] planDelete Exception", e);
      }
      
      return count;
   }
   
   
}