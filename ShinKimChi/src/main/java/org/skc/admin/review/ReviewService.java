package org.skc.admin.review;

import java.util.List;

import org.skc.page.PagingCriteria;

public interface ReviewService {

	public List<ReviewVO> listSelect(PagingCriteria cri);
	
	public void deleteList(int d_no);
	
}
