package org.skc.admin.notice;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class NoticeControllerTest {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeControllerTest.class);
	
	@Inject
	private WebApplicationContext wac;

	private MockMvc mockMvc;
	
	@Test
	public void noticeList() throws Exception{
		
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/admin/skc/notice/list")).andReturn();
		
		List<NoticeVO> list = (List<NoticeVO>)result.getModelAndView().getModel().get("list");
		
		for(NoticeVO noticeVO : list){
			logger.info(noticeVO.toString());
		}
	}
	
	@Test
	public void noticeRead() throws Exception{
		
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/admin/skc/notice/read").param("no_seq", "5")).andReturn();
		
		NoticeVO noticeVO = (NoticeVO)result.getModelAndView().getModel().get("noticeVO");
		
		logger.info(noticeVO.toString());
	}
	
	@Test
	public void noticeModify() throws Exception{

		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/admin/skc/notice/modify")
				.param("no_seq", "5")
				.param("no_title", "testmodify")
				.param("no_content", "conmodi")
				).andReturn();
		
		NoticeVO noticeVO = (NoticeVO)result.getModelAndView().getModel().get("noticeVO");
		
		logger.info(noticeVO.toString());
	}
	
	@Test
	public void noticeDelete() throws Exception{
		
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/admin/skc/notice/delete")
				.param("no_seq", "6")).andReturn();
		
		NoticeVO noticeVO = (NoticeVO)result.getModelAndView().getModel().get("noticeVO");
		
		logger.info(noticeVO.toString());
	}
	
	@Test
	public void noticeRegist() throws Exception{
		
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/admin/skc/notice/delete")
				.param("no_title", "registTest")
				.param("no_content", "regist")
				).andReturn();
		
		NoticeVO noticeVO = (NoticeVO)result.getModelAndView().getModel().get("noticeVO");
		
		logger.info(noticeVO.toString());
	}
}
