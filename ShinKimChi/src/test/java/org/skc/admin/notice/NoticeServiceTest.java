package org.skc.admin.notice;

import javax.inject.Inject;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class NoticeServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceTest.class);
	
	@Inject
	private NoticeService service;
	/*
	@Test
	public void testListAll() throws Exception{
		
		PagingCriteria cri = new PagingCriteria();
		
		List<NoticeVO> list = service.listAll(cri);
		
		for(NoticeVO noticeVO : list){
			logger.info(noticeVO.toString());
		}
	}
	
	@Test
	public void testRead() throws Exception{
		
		NoticeVO noticeVO = service.read(5);
		
		logger.info(noticeVO.toString());
	}
	
	@Test
	public void testModify() throws Exception{
		
		NoticeVO notice = new NoticeVO();
		notice.setNo_seq(5);
		notice.setNo_title("modify---");
		notice.setNo_content("welcome");
		
		service.modify(notice);
	}
	
	@Test
	public void testDelete() throws Exception{
		
		NoticeVO notice = new NoticeVO();
		notice.setNo_seq(7);
		
		service.delete(notice);
	}
	
	@Test
	public void testRegits() throws Exception{
		
		NoticeVO notice = new NoticeVO();
		notice.setNo_title("regist");
		notice.setNo_content("regist");
		
		service.regist(notice);
	}
	
	@Test
	public void testCountPaging() throws Exception{
		
		PagingCriteria cri = new PagingCriteria();
		
		PageMaker pm = service.countPaging(cri);
		logger.info(pm.toString());
	}
	*/
}
