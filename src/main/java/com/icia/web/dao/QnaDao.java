package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.HiBoard;
import com.icia.web.model.Qna;
import com.icia.web.model.QnaHiBoardFile;

@Repository("qnaDao")
public interface QnaDao {
	
	   //게시물 조회
	   public List<Qna> qnaList(Qna qna);
	   
	 //게시물 총개수
	   public long qnaListCount(Qna qna);
	   
	   //게시물 등록
	   public int qnaInsert(Qna qna);
	   
	   //게시물 답글 등록
	   public int qnaReplyInsert(Qna qna);
	   
	   //게시물 조회
	   public Qna qnaSelect(long qnaHiBbsSeq);
	   
	   //게시물 수정
	   public int qnaUpdate(Qna qna);
	   
	   //게시물 그룹 순서 변경
	   public int qnaGroupOrderUpdate(Qna qna);
	   
	   //게시물 조회수 증가
	   public int qnaReadCntPlus(long qnaHiBbsSeq);
	   
	   //게시물 삭제
	   public int qnaDelete(long qnaHiBbsSeq);
	   
	   // ############################################################
	   //게시물 첨부파일 등록
	   public int qnaHiBoardFileInsert(QnaHiBoardFile qnaHiBoardFile);
	   
	   //게시물 첨부파일 조회
	   public QnaHiBoardFile qnaHiBoardFileSelect(long qnaHiBbsSeq);
	   
	   //게시물 첨부파일 삭제
	   public int qnaHiBoardFileDelete(long qnaHiBbsSeq);
	   
	 //게시물 삭제시, 답변 글 수 체크
	   public int qnaAnswersCount(long qnaHiBbsSeq);

	   
}
