package ru.anton.webstore.dao;

import java.util.List;

import ru.anton.webstore.models.LineItem;

public interface LineItemDao {
	public List<LineItem> getLineItemsList(Long id);
}
