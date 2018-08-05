package ru.anton.webstore.service;

import java.util.List;

import ru.anton.webstore.models.LineItem;
import ru.anton.webstore.models.Order;
import ru.anton.webstore.supportModels.OrderDetails;
import ru.anton.webstore.supportModels.Status;

public interface OrderService {
	public void addOrderWithLineItems(Order order, List<LineItem> items);
	public List<Order> getOrdersList();
	public  List<OrderDetails> getJoinLineItemsListAndProducts(Long id);
	public void changeOrderStatus(Long id, Status status);
}
