package dto;

public class OrderDetailDTO {
    private int orderDetailNo;        //주문상세번호
    private int itemNo;               //상품 번호
    private int orderNo;              //주문번호
    private int orderItemCount;       //상품개수
    private String orderDate;    //주문일자
    private String orderStatus;  //주문상태

    public OrderDetailDTO() {}

	public OrderDetailDTO(int itemNo, int orderNo, int orderItemCount) {
		super();
		this.itemNo = itemNo;
		this.orderNo = orderNo;
		this.orderItemCount = orderItemCount;
	}    
    
	public OrderDetailDTO(int orderDetailNo, int itemNo, int orderNo, int orderItemCount) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.itemNo = itemNo;
		this.orderNo = orderNo;
		this.orderItemCount = orderItemCount;
	}

	
	
	
	public OrderDetailDTO(int orderDetailNo, int itemNo, int orderNo, int orderItemCount,
			String orderDate, String orderStatus) {
		this(orderDetailNo, itemNo, orderNo, orderItemCount);
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
	}

	public int getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(int orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getOrderItemCount() {
		return orderItemCount;
	}

	public void setOrderItemCount(int orderItemCount) {
		this.orderItemCount = orderItemCount;
	}


	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


    
    
}
