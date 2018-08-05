package ru.anton.webstore.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ru.anton.webstore.dao.OrderDao;
import ru.anton.webstore.models.LineItem;
import ru.anton.webstore.models.Order;
import ru.anton.webstore.supportModels.OrderDetails;
import ru.anton.webstore.supportModels.Status;

public class OrderServiceImpl implements OrderService{

	private OrderDao orderDao;
	
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	@Transactional
	public void addOrderWithLineItems(Order order, List<LineItem> items) {
		orderDao.addOrderWithLineItems(order, items);
		
	}

	@Override
	@Transactional
	public List<Order> getOrdersList() {
		
		return orderDao.getOrdersList();
	}

	@Override
	@Transactional
	public List<OrderDetails> getJoinLineItemsListAndProducts(Long id) {
		
		return orderDao.getJoinLineItemsListAndProducts(id);
	}

	@Override
	@Transactional
	public void changeOrderStatus(Long id, Status status) {
		orderDao.changeOrderStatus(id, status);
		
	}

}
