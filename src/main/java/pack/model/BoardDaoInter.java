package pack.model;

import java.util.ArrayList;
import pack.controller.BoardBean;

public interface BoardDaoInter {
	ArrayList<BoardDto> getList();
	int totalCnt();
	
	boolean insert(BoardBean bean);
	int currentNum();

	ArrayList<BoardDto> getSearch(BoardBean bean);

	boolean updateReadCnt(String num);
	BoardDto getDetail(String num);
	
	String selectPass(String num);

	boolean update(BoardBean bean);
	boolean delete(String num);

	
	boolean updateOnum(BoardBean bean);
	boolean insertReply(BoardBean bean);
}
