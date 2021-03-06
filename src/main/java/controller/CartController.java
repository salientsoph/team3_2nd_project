package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BoardDTO;
import dto.CartDTO;
import dto.CartViewDTO;
import dto.CustomerDTO;
import dto.ItemDTO;
import service.CartService;
import service.CartServiceImpl;
import service.ItemService;
import service.ItemServiceImpl;

public class CartController implements Controller {
    private CartService cartService = new CartServiceImpl();
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
    
	
	public ModelAndView select(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		HttpSession session = request.getSession();
		CustomerDTO dto = (CustomerDTO)session.getAttribute("customerDTO");
		
		
		int customerNo = dto.getCustomerNo();
		List<CartDTO> cartList = cartService.selectCartByCustomerNo(customerNo);
		
		if(cartList ==null || cartList.size() == 0) return new ModelAndView("html/namdo-market/page-cart-empty.jsp");
		ItemService itemService = new ItemServiceImpl();
		List<CartViewDTO> cartViewList = new ArrayList<CartViewDTO>();
		
		//카트 번호, 회원 번호, 상품 번호, 상품 갯수
		//필요한거 : 상품 이름, 상품 가격
		for(CartDTO cart: cartList) {
			//아이템 번호를 입력으로 받으면 DTO리턴하는 메소드 
			ItemDTO item = itemService.selectByNo(cart.getItemNo());
			cartViewList.add(new CartViewDTO(cart.getCartNo(), item.getItemName(), item.getItemPrice(), cart.getCartItemCount(), item.getMainImg()));
		}
		request.setAttribute("list", cartViewList);
		return new ModelAndView("html/namdo-market/page-cart.jsp");
	}
	
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		CustomerDTO customer = (CustomerDTO)session.getAttribute("customerDTO");
		
		int customerNo = customer.getCustomerNo();
		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		int itemCount = Integer.parseInt(request.getParameter("itemCount"));

		//우선 카트에 해당 고객이 해당 아이템을 갖고 있는지 확인
		
		
		CartDTO cart = new CartDTO(customerNo, itemNo, itemCount);
		
		int result = cartService.addToCart(cart);
		
		
		if (result==0) {
			request.setAttribute("errmsg", "삭제실패");
			return new ModelAndView("html/namdo-market/error/error.jsp");
		}
		
        return new ModelAndView("html/namdo-market/cart/addOk.jsp");
	}
	
	
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		
	
		int result = cartService.deleteFromCart(cartNo);
		
		if (result==0) {
			request.setAttribute("errmsg", "삭제실패");
			return new ModelAndView("html/namdo-market/error/error.jsp");
		}
		
        return new ModelAndView("front?key=cart&methodName=select", true);
	}	
}
