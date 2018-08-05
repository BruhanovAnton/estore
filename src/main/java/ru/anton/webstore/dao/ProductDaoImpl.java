package ru.anton.webstore.dao;

import java.util.ArrayList;
import java.util.Formatter;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import ru.anton.webstore.models.Product;
import ru.anton.webstore.supportModels.ProductFilter;

public class ProductDaoImpl implements ProductDao{

	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addProduct(Product product) {

		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(product);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void updateProduct(Product product) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(product);
		session.getTransaction().commit();
		session.close();
		
	}

	@Override
	
	public void deleteProduct(Product product) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(product);
		session.getTransaction().commit();
		session.close();
		
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Product> getProductsList() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<Product> products = null;

		products = (List<Product>) session.createSQLQuery("SELECT * FROM products").addEntity(Product.class).list();
		session.getTransaction().commit();
		session.close();
		return products;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Product> getSearchResult(String param) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<Product> books = null;

		books = (List<Product>) session.createSQLQuery("SELECT * FROM products where title like " + "'%" + param + "%'")
				.addEntity(Product.class).list();
		session.getTransaction().commit();
		session.close();
		return books;
	}

	@Override
	public Product getProduct(Long id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		long productId = id;
		Product product = session.get(Product.class, productId);
		session.getTransaction().commit();
		session.close();
		
		return product;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Product> getViaFilter(ProductFilter filter) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<Product> filteredProducts = new ArrayList<Product>();
		String query = "";
		String brandParams = "";
		String priceRabgeParams = "";
		
		Formatter fmtPriceRange = new Formatter();
		priceRabgeParams = fmtPriceRange.format("price between %d and %d ", filter.getMinPrice(), filter.getMaxPrice())
				.toString();

		Formatter fmtQuery = new Formatter();
		query = fmtQuery.format("SELECT * FROM products where %s %s ", brandParams, priceRabgeParams).toString();

		List<Product> productList = (List<Product>) session.createSQLQuery(query).addEntity(Product.class).list();

		session.getTransaction().commit();
		session.close();
		
		return productList;
	}

}
