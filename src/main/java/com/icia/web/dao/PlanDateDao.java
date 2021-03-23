package com.icia.web.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.HiBoard;
import com.icia.web.model.PlanDate;
import com.icia.web.model.PlanMake;

@Repository("planDateDao")
public interface PlanDateDao 
{
   //일정추가(join3)
   public int planDateInsert2(PlanDate planDate); 
   
   //일정조회(myPlan)
   public PlanDate planDateSelect2(long pNoSeq2);
   
   //myPlan
   public List<PlanDate> planList(PlanDate planDate);
   
   //myPlanView
   public List<PlanDate> planViewList(PlanDate planDate);
   
   public int planDelete(long pNoSeq2);
}