package service;

import java.sql.SQLException;
import java.util.List;

import dto.ItemDTO;
import dto.ReviewDTO;

public interface ItemService {
	 /**
	  * ItemDAOImpl에서 레코드 전체 검색 메소드 호출
	  * */
	  List<ItemDTO> selectAll() throws SQLException;
	  
	 /**
	  * 레코드 전체 검색(페이지처리)
	  * */
	  List<ItemDTO> getBoardList(int pageNo) throws SQLException;
	  
	 /**
	  * ItemDAOImpl에서 카테고리에 해당하는 레코드 검색 메소드 호출
	  * */
	  List<ItemDTO> selectByCategoryNo(int categoryNo) throws SQLException;
	  
	 /**
	  * ItemDAOImpl에서 입력된 단어를 포함하는 레코드 검색 메소드 호출
	  * */
	  List<ItemDTO> selectByInputItemName(String input) throws SQLException;
	  
	  /**
	  * ItemDAOImpl에서 해당하는 번호에 포함되는 레코드 검색 메소드 호출
	  * */
	  ItemDTO selectByNo(int itemNo) throws SQLException;
	  
	  
	 /**
	  * ItemDAOImpl에서 해당하는 지역에 포함되는 레코드 검색 메소드 호출
	  * */
	  List<ItemDTO> selectByRegion(int regionNo) throws SQLException;
	  
	  /**
	   * ItemDAOImpl에서 해당하는 지역의 카테고리를 검색하는 메소드 호출
	   */
	  List<ItemDTO> selectByCategoryOfRegion(int regionNo, int categoryNo) throws SQLException;
	  
	  /**
	  * ItemDAOImpl에서 레코드 삽입 메소드 호출
	  * */
	  int insert(ItemDTO item) throws SQLException;
	  
	  /**
	   * ItemDAOImpl에서 상품번호에 해당하는 레코드 삭제 메소드 호출
	   * */
	  void delete(int itemNo, int sellerNo) throws SQLException;
	  
	  /**
	   * ItemDAOImpl에서 상품번호에 해당하는 레코드 수정 메소드 호출
	   * */
	  int update(ItemDTO itemDTO) throws SQLException;
	  
	  
	  /**
	   * ItemDAOImpl에서 상품정보에 해당하는 리뷰 정보 메소드 호출
	   * */
	  List<ReviewDTO> selectReviewByItemNo(int itemNo) throws SQLException;

	  
	  List<ItemDTO> selectBySellerNo(int sellerNo) throws SQLException;
}
