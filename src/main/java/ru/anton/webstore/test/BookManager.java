package ru.anton.webstore.test;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.Formatter;
import java.util.List;

import javax.imageio.ImageIO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import ru.anton.webstore.models.LineItem;
import ru.anton.webstore.models.Order;
import ru.anton.webstore.models.Product;

import ru.anton.webstore.supportModels.ProductFilter;


public class BookManager {
	protected SessionFactory sessionFactory;

	public void setup() {
		final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure() // configures
																									// settings
																									// from
																									// hibernate.cfg.xml
				.build();
		try {
			sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
		} catch (Exception ex) {
			StandardServiceRegistryBuilder.destroy(registry);
		}
	}

	public void exit() {
		// code to close Hibernate Session factory
	}

	
	public void addOrderWithLineItems(Order order, List<LineItem> items){
				
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		session.save(order);
		
		for(LineItem item : items){
			session.save(item);
		}

		session.getTransaction().commit();
		session.close();
		
		
	}
	
	
	public void addProduct(Product product) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		session.save(product);

		session.getTransaction().commit();
		session.close();
	}

	public void read() {
//		Session session = sessionFactory.openSession();
//
//		long bookId = 1;
//		Book book = session.get(Book.class, bookId);
//
//		System.out.println("Title: " + book.getTitle());
//		System.out.println("Author: " + book.getAuthor());
//		System.out.println("Price: " + book.getPrice());
//
//		session.close();
	}

	public void updateProduct(Product product) {
//		Book book = new Book();
//		book.setId(1);
//		book.setTitle("Ultimate Java Programming");
//		book.setAuthor("Nam Ha Minh");
//		book.setPrice(19.99f);
//
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		session.update(product);

		session.getTransaction().commit();
		session.close();
	}

	public void deleteProduct(Product product) {
//		Book book = new Book();
//		book.setId(1);
//
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		session.delete(product);

		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<Product> getProductsList() {
		Session session = sessionFactory.openSession();
		List<Product> products = null;

		products = (List<Product>) session.createSQLQuery("SELECT * FROM products").addEntity(Product.class).list();
		
		return products;
	}
	
	public List<Order> getOrdersList() {
		Session session = sessionFactory.openSession();
		
		List<Order> orders = null;
		orders = (List<Order>) session.createSQLQuery("SELECT * FROM orders").addEntity(Order.class).list();
		
		
		
		
		return orders;
	}
	
	
	public List<Product> getSearchResult(String param) {
		Session session = sessionFactory.openSession();
		List<Product> books = null;

		books = (List<Product>) session.createSQLQuery("SELECT * FROM products where title like " +"'%"+param+"%'").addEntity(Product.class).list();
		
		return books;
	}

	public Product getProduct(Long id){
		Session session = sessionFactory.openSession();

		long productId = id;
		
		
		return session.get(Product.class, productId);
	}
	
	
	public List<Product> getViaFilter(ProductFilter filter){
		Session session = sessionFactory.openSession();
		List<Product> filteredProducts = new ArrayList<Product>();
		String query = "";
		String brandParams = "";
		String priceRabgeParams = "";
		
		
		
//		
//			Formatter fmtBrand = new Formatter();
//			fmtBrand.format("WHERE brand in('%s','%s','%s','%s','%s')", filter.getBrand()[0], 
//					brandParams = filter.getBrand()[1], filter.getBrand()[2], filter.getBrand()[3], filter.getBrand()[4]).toString();
//			
//			
		
			Formatter fmtPriceRange = new Formatter();
			priceRabgeParams = fmtPriceRange.format("price between %d and %d ", filter.getMinPrice(), filter.getMaxPrice()).toString();
		
		
		
		Formatter fmtQuery = new Formatter();
		query = fmtQuery.format("SELECT * FROM products where %s %s ", brandParams, priceRabgeParams).toString();
	
		 
		

		return (List<Product>) session.createSQLQuery(query).addEntity(Product.class).list();
		
		
	}
	
	public static void main(String[] args) {
		BookManager manager = new BookManager();
		manager.setup();
		
		List<LineItem> items = new ArrayList<LineItem>();
		
		Order order = new Order();
		order.setCustomerId(2);
		order.setTotalCost(80000);
		order.setOrderDate(new Date());

		LineItem item1 = new LineItem();
		item1.setProductId(4);
		item1.setQuantity(2);
		item1.setOrder(order);

		LineItem item2 = new LineItem();
		item2.setProductId(1);
		item2.setQuantity(3);
		item2.setOrder(order);
		
		items.add(item1);
		items.add(item2);
		
		manager.addOrderWithLineItems(order, items);
		

		manager.exit();
	}
}
