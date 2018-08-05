package ru.anton.webstore.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import ru.anton.webstore.models.LineItem;

public class LineItemDaoImpl implements LineItemDao{

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<LineItem> getLineItemsList(Long id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<LineItem> items = null;
		items = (List<LineItem>) session.createSQLQuery("SELECT * FROM lineitems where order_Id = " + id).addEntity(LineItem.class).list();
		session.getTransaction().commit();
		session.close();
		return items;
	}

}
