package com.icia.web.model;

import java.io.Serializable;

public class PlanDate implements Serializable {
   
   private static final long serialVersionUID = 1L;
    
    private String pDay;
    private String pPlace;
    private long pNoSeq2;
    private String userId2;
    
    

   //생성자
    public PlanDate()
    {
       pDay="";
       pPlace="";
       pNoSeq2=0;
       userId2="";
    }

   public String getpDay() {
      return pDay;
   }

   public String getpPlace() {
      return pPlace;
   }

   public long getpNoSeq2() {
      return pNoSeq2;
   }

   public void setpDay(String pDay) {
      this.pDay = pDay;
   }

   public void setpPlace(String pPlace) {
      this.pPlace = pPlace;
   }

   public void setpNoSeq2(long pNoSeq2) {
      this.pNoSeq2 = pNoSeq2;
   }
   
   public String getUserId2() {
      return userId2;
   }

   public void setUserId2(String userId2) {
      this.userId2 = userId2;
   }
    
}