package ru.anton.webstore.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import ru.anton.webstore.models.LineItem;
import ru.anton.webstore.models.Order;
import ru.anton.webstore.models.Product;
import ru.anton.webstore.supportModels.OrderDetails;
import ru.anton.webstore.supportModels.Status;

public class OrderDaoImpl implements OrderDao{

	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addOrderWithLineItems(Order order, List<LineItem> items) {

		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(order);

		for (LineItem item : items) {
			session.save(item);
		}
		session.getTransaction().commit();
		session.close();
		

	}

	@Override
	public List<Order> getOrdersList() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<Order> orders = null;
		orders = (List<Order>) session.createSQLQuery("SELECT * FROM orders WHERE status = 'в обработке' ").addEntity(Order.class).list();
		session.getTransaction().commit();
		session.close();
		return orders;
	}

	@Override
	public  List<OrderDetails> getJoinLineItemsListAndProducts(Long id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<OrderDetails> od = new ArrayList<OrderDetails>();
		List<Object[]> items = null;
		items = (List<Object[]>) session.createSQLQuery("SELECT * FROM lineitems INNER JOIN products ON lineitems.productId = products.productId where order_Id =  " + id).addEntity(LineItem.class).addEntity(Product.class).list();
		
		
		for(int i=0; i<items.size(); i++) {
			Object[] row = (Object[]) items.get(i);
			LineItem item = (LineItem)row[0];
			Product product = (Product)row[1];
			OrderDetails orderDetails = new OrderDetails();
			orderDetails.setBrand(product.getBrand());
			orderDetails.setDescription(product.getDescription());
			orderDetails.setPrice(product.getPrice());
			orderDetails.setProductId(product.getProductId());
			orderDetails.setQuantity(item.getQuantity());
			orderDetails.setSmallImage(product.getSmallImage());
			orderDetails.setTitle(product.getTitle());
			orderDetails.setOrderId(item.getOrder().getOrderId());
			
			od.add(orderDetails);
						
		}	
		
		session.getTransaction().commit();
		session.close();
		return od;
		
	}

	@Override
	public void changeOrderStatus(Long id, Status status) {
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		if(status == Status.completed){
			session.createSQLQuery("UPDATE orders SET status = 'выполнен' WHERE orderId = "+id).executeUpdate();
		}else if(status == Status.cancel){
			session.createSQLQuery("UPDATE orders SET status = 'отменен' WHERE orderId = "+id).executeUpdate();
		}
		 
		 session.getTransaction().commit();
		    session.close();
	}

}
