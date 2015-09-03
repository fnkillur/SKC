package org.skc.storepage;

import java.util.List;

import javax.inject.Inject;

import org.skc.admin.review.ReviewVO;
import org.skc.admin.store.StoreVO;
import org.skc.mapper.StorePageMapper;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
import org.springframework.stereotype.Service;

@Service
public class StorePageServiceImpl implements StorePageService {

	@Inject
	private StorePageMapper mapper;
	
	@Override
	public StoreVO getStore(int st_tel) {

		return mapper.getStore(st_tel);
	}

	@Override
	public List<MenuVO> getMenu(int st_tel) {
		
		return mapper.getMenu(st_tel);
	}

	@Override
	public List<ReviewVO> getReview(PagingCriteria cri) {
		
		return mapper.getReview(cri);
	}

	@Override
	public PageMaker countPaging(PagingCriteria cri) {

		return mapper.countPaging(cri);
	}

	@Override
	public void insertReview(ReviewVO reviewVO) {

		mapper.insertReview(reviewVO);
	}

	@Override
	public void menuGrade(MenuVO menuVO) {

		mapper.menuGrade(menuVO);
	}

	@Override
	public List<MenuVO> getMenuAll(PagingCriteria cri) {

		return mapper.getMenuAll(cri);
	}

	@Override
	public PageMaker countPagingMenu(PagingCriteria cri) {

		return mapper.countPagingMenu(cri);
	}

}
