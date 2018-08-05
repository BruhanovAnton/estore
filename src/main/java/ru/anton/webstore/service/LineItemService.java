package ru.anton.webstore.service;

import java.util.List;

import ru.anton.webstore.models.LineItem;

public interface LineItemService {
	public List<LineItem> getLineItemsList(Long id);
}
