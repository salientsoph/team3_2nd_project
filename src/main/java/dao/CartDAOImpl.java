package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import dto.CartDTO;
import util.DbUtil;

public class CartDAOImpl implements CartDAO {
	Properties proFile = new Properties();
	


	public CartDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("cartReviewQuery.properties"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int addToCart(CartDTO cartDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		int result = 0;
		String sql = proFile.getProperty("cart.addToCart");
		try {
			con = DbUtil.getConnection();
			CartDTO dbDTO = selectCartByCustomerNoAndItemNo(cartDTO.getCustomerNo(), cartDTO.getItemNo(), con);
			if(dbDTO ==null) {
				ps = con.prepareStatement(sql);
				//insert into cart values (cart_no_seq.nextval, ?, ?, ?)
				//CUSTOMER_NO NUMBER
				ps.setInt(1, cartDTO.getCustomerNo());
				//ITEM_NO NUMBER
				ps.setInt(2, cartDTO.getItemNo());
				//CART_ITEM_COUNT NUMBER
				ps.setInt(3, cartDTO.getCartItemCount());
				
				result = ps.executeUpdate();
			}else {
				result = updateCart(dbDTO.getCartItemCount()+cartDTO.getCartItemCount(), dbDTO.getCartNo(), dbDTO.getCustomerNo());
			}
			
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	public int updateCart(int cartItemCount, int cartNo, int customerNo, Connection con) throws SQLException {
		PreparedStatement ps =null;
		int result = 0;
		String sql = proFile.getProperty("cart.updateCart");
		//update cart set cart_item_count= ? where cart_no = ? and customer_no = ?
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, cartItemCount);
			ps.setInt(2, cartNo);
			ps.setInt(3, customerNo);
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	@Override
	public int updateCart(int cartItemCount, int cartNo, int customerNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		int result = 0;
		String sql = proFile.getProperty("cart.updateCart");
		//update cart set cart_item_count= ? where cart_no = ? and customer_no = ?
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cartItemCount);
			ps.setInt(2, cartNo);
			ps.setInt(3, customerNo);
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}	
	
	@Override
	public int deleteFromCart(int cartNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		int result = 0;
		String sql = proFile.getProperty("cart.deleteFromCart");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cartNo);
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	
	

	@Override
	public List<CartDTO> selectCartByCustomerNo(int customerNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		String sql = proFile.getProperty("cart.selectByCustomerNo");
		System.out.println(sql);
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, customerNo);
			rs = ps.executeQuery();
			while(rs.next()) {
				//public CartDTO(int cartNo, int customerNo, int itemNo, int cartItemCount)
				CartDTO cartDto = new CartDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
				System.out.println(cartDto);
				cartList.add(cartDto);
			}
		}finally {
			DbUtil.dbClose(rs, ps,con);
		}
		return cartList;
	}

	
	public CartDTO selectCartByCustomerNoAndItemNo(int customerNo, int itemNo, Connection con) throws SQLException {
		PreparedStatement ps =null;
		ResultSet rs= null;
		CartDTO result = null;
		String sql = proFile.getProperty("cart.selectByCustomerNoAndItemNo");
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, customerNo);
			ps.setInt(2, itemNo);
			rs = ps.executeQuery();
			if(rs.next()) {
				//public CartDTO(int cartNo, int customerNo, int itemNo, int cartItemCount)
				result = new CartDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
				
			}
		}finally {
			DbUtil.dbClose(rs, ps,null);
		}
		return result;
	}

}
