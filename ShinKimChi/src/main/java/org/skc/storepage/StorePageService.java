package org.skc.storepage;

import java.util.List;

import org.skc.admin.review.ReviewVO;
import org.skc.admin.store.StoreVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface StorePageService {

	public StoreVO getStore(int st_tel);

	public List<MenuVO> getMenu(int st_tel);

	public List<ReviewVO> getReview(PagingCriteria cri);

	public PageMaker countPaging(PagingCriteria cri);

	public void insertReview(ReviewVO reviewVO);

	public void menuGrade(MenuVO menuVO);

	public List<MenuVO> getMenuAll(PagingCriteria cri);

	public PageMaker countPagingMenu(PagingCriteria cri);

}
