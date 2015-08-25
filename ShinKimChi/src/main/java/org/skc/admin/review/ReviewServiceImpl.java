package org.skc.admin.review;

import java.util.List;

import javax.inject.Inject;

import org.skc.mapper.ReviewMapper;
import org.skc.page.PagingCriteria;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Inject
	private ReviewMapper reMapper;
	
	@Override
	public List<ReviewVO> listSelect(PagingCriteria cri) {
		return reMapper.listSelect(cri);
	}

	@Override
	public void deleteList(int d_no) {
		reMapper.deleteList(d_no);
	}

}
