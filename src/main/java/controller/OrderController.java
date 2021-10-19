package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.CartDTO;
import dto.CustomerDTO;
import dto.OrderDTO;
import dto.OrderDetailDTO;
import service.CartService;
import service.CartServiceImpl;
import service.OrderService;
import service.OrderServiceImpl;

public class OrderController implements Controller {
    private CartService cartService = new CartServiceImpl();
    private OrderService orderService = new OrderServiceImpl();
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView addOrder(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String addr;
		HttpSession session = request.getSession();
		
		CustomerDTO dto = (CustomerDTO)session.getAttribute("customerDTO");
		
		
		int customerNo = dto.getCustomerNo();
		int total = Integer.parseInt(request.getParameter("amount"));
		List<CartDTO> cartList = cartService.selectCartByCustomerNo(customerNo);
		
		//주소설정
		if(request.getParameter("addrInput2").equals("") || request.getParameter("addrInput2")==null ) addr = request.getParameter("addrInput1");
		else addr = request.getParameter("addrInput2") + " " + request.getParameter("detailAddrInput");
		
		
		//1이면 주문성공, 0이면 실패
		int result = orderService.orderItems(new OrderDTO(customerNo, addr, "배송중", total), cartList);
		
		if(result ==0) {
			request.setAttribute("errmsg", "주문실패!!!");
			return new ModelAndView("html/namdo-market/error.jsp");
		}
		else return new ModelAndView("html/namdo-market/order/orderOk.jsp");

	}

}
