package org.skc.admin.qna;

import java.util.List;

public interface QnAService {

	public List<QnAVO> searchList();
	
	public void insertAnswer(QnAVO vo);
	
	public void deleteList(int del_no);
	
	public void deleteParent(int del_no);
	
	public QnAVO searchRead(int no);
	
	public void updateList(int up_no, String qna_content );
}
