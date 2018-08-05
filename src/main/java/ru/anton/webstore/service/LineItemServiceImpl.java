package ru.anton.webstore.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;



import ru.anton.webstore.dao.LineItemDao;
import ru.anton.webstore.models.LineItem;

public class LineItemServiceImpl implements LineItemService{

	private LineItemDao lineItemDao;
	
	
	public void setLineItemDao(LineItemDao lineItemDao) {
		this.lineItemDao = lineItemDao;
	}


	@Override
	@Transactional
	public List<LineItem> getLineItemsList(Long id) {
		
		return lineItemDao.getLineItemsList(id);
	}

}
