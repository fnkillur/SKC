package org.skc.admin.notice;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.skc.mapper.NoticeMapper;
import org.skc.page.PagingCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class NoticeMapperTest {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceTest.class);
	
	@Inject
	private NoticeMapper mapper;
	/*
	@Test
	public void testListAll() throws Exception{
		
		PagingCriteria cri = new PagingCriteria();
		List<NoticeVO> list = mapper.listAll(cri);
		
		for(NoticeVO noticeVO : list){
			logger.info(noticeVO.toString());
		}
	}
	
	@Test
	public void testRead() throws Exception{
		
		NoticeVO noticeVO = mapper.read(5);
		
		logger.info(noticeVO.toString());
	}
	
	@Test
	public void testModify() throws Exception{
		
		NoticeVO notice = new NoticeVO();
		notice.setNo_seq(5);
		notice.setNo_title("welcome");
		notice.setNo_content("modify ---");
		
		mapper.modify(notice);
	}
	
	@Test
	public void testDelete() throws Exception{
		
		NoticeVO notice = new NoticeVO();
		notice.setNo_seq(8);
		
		mapper.delete(notice);
	}
	
	@Test
	public void testRegist() throws Exception{
		
		NoticeVO notice = new NoticeVO();
		notice.setNo_title("regist");
		notice.setNo_content("regist");
		
		mapper.regist(notice);
	}
	
	@Test
	public void testCountPaging() throws Exception{
		
		PagingCriteria cri = new PagingCriteria();
		PageMaker pm = mapper.countPaging(cri);
		
		logger.info(pm.toString());
	}
	*/
	@Test
	public void testListSearch() throws Exception{
		
		PagingCriteria cri = new PagingCriteria().setSearchType("t").setKeyword("hello");
		
		List<NoticeVO> list = mapper.listAll(cri);
		
		for(NoticeVO noticeVO : list){
			logger.info(noticeVO.getNo_seq()+":"+noticeVO.getNo_title());
		}
	}
}
