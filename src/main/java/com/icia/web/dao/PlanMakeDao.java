package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.icia.web.model.PlanMake;

@Repository("planMakeDao")
public interface PlanMakeDao {
   
   //Calendar 에서 table로 추가
   public int planMakeInsert2(PlanMake planMake);
   
   //myPlan에서 조회(pNoSeq로 Id하나의 모든 일정 조회)
   public PlanMake planMakeSelect2(long pNoSeq);
   
   
   public List<PlanMake> planList(PlanMake planMake);
   
	/////////////////////////////////////////
	//삭제
	public int planDelete (long pNoSeq);

}