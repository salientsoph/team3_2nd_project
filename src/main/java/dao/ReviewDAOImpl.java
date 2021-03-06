package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import dto.ReviewDTO;
import util.DbUtil;

public class ReviewDAOImpl implements ReviewDAO {
	Properties proFile = new Properties();
	
	public ReviewDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("cartReviewQuery.properties"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<ReviewDTO> reviewSelectByItemNo(int itemNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		List<ReviewDTO> reivewList = new ArrayList<ReviewDTO>();
		String sql = proFile.getProperty("review.selectByItemNo"); 
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, itemNo);
			rs = ps.executeQuery();
			while(rs.next()) {
				ReviewDTO reviewDto = new ReviewDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5));
				reivewList.add(reviewDto);
			}
		} finally {
			DbUtil.dbClose(rs, ps,con);
		}
		return reivewList;
	}
	
	@Override
	public int createReview(ReviewDTO review) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("review.createReview");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			//insert into review values(review_no_seq.nextval, ?, ?, ?, ?, DEFAULT)
			//ITEM_NO
			ps.setInt(1, review.getItemNo());
			//CUSTOMER_NO
			ps.setString(2, review.getCustomerName());
			//REVIEW_GRADE
			ps.setInt(3, review.getReviewGrade());
			//REVIEW_CONTENT
			ps.setString(4, review.getReviewContent());
			result = ps.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}	
		finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	@Override
	public int deleteReview(int reviewNo, int customerNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		int result = 0;
		String sql = proFile.getProperty("review.deleteReview");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			ps.setInt(2, customerNo);
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int updateReview(String content, int reviewNo, int customerNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		int result = 0;
		String sql = proFile.getProperty("review.updateReview");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, content);
			ps.setInt(2, reviewNo);
			ps.setInt(3, customerNo);
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public List<ReviewDTO> reviewSelectByCustomerNo(int customerNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		List<ReviewDTO> reivewList = new ArrayList<ReviewDTO>();
		String sql = proFile.getProperty("review.selectByCustomerNo"); 
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, customerNo);
			rs = ps.executeQuery();
			while(rs.next()) {
				ReviewDTO reviewDto = new ReviewDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6));
				reivewList.add(reviewDto);
			}
		} finally {
			DbUtil.dbClose(rs, ps,con);
		}
		return reivewList;
	}

	

}
