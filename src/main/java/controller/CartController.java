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
		
		if(cartList ==null) return new ModelAndView("page-cart-empty.jsp");
		ItemService itemService = new ItemServiceImpl();
		List<CartViewDTO> cartViewList = new ArrayList<CartViewDTO>();
		
		for(CartDTO cart: cartList) {
			//������ ��ȣ�� �Է����� ������ DTO�����ϴ� �޼ҵ� 
			//ItemDTO item = itemService.
			//cartViewList.add(new CartViewDTO(cart.getCartNo(), item.getItemName(), item.getItemPrice(), cart.getItemCount()));
		}
		
		//request.setAttribute("list", cartViewList);
		return new ModelAndView("page-cart.jsp");
	}
	
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		
	
		int result = cartService.deleteFromCart(cartNo);
		
		if (result==0) {
			request.setAttribute("errmsg", "��������");
			return new ModelAndView("error.jsp");
		}
		
		request.setAttribute("key", "cart");
		request.setAttribute("methodName", "select");
        return new ModelAndView("front", true);
	}	
}