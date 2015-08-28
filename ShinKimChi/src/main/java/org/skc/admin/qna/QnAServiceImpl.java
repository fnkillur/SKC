package org.skc.admin.qna;

import java.util.List;

import javax.inject.Inject;

import org.skc.mapper.QnAMapper;
import org.springframework.stereotype.Service;

@Service
public class QnAServiceImpl implements QnAService{

	@Inject
	private QnAMapper qnaMapper;
	
	@Override
	public List<QnAVO> searchList() {
		return qnaMapper.searchList();
	}

	@Override
	public void insertAnswer(QnAVO vo) {
		qnaMapper.insertAnswer(vo);
	}

	@Override
	public void deleteList(int del_no) {
		qnaMapper.deleteList(del_no);
	}

	@Override
	public void deleteParent(int del_no) {
		qnaMapper.deleteParent(del_no);
	}

	@Override
	public QnAVO searchRead(int no) {
		return qnaMapper.searchRead(no);
	}

	@Override
	public void updateList(int up_no, String qna_content) {
		qnaMapper.updateList(up_no, qna_content);
	}

}
