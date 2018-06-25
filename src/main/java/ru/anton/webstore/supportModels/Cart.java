package ru.anton.webstore.supportModels;

import java.util.Map;

public class Cart {

	private Map<Integer, Integer> lineItems;
	private int userId;
	private float totalCost;

	public Map<Integer, Integer> getLineItems() {
		return lineItems;
	}

	public void setLineItems(Map<Integer, Integer> lineItems) {
		this.lineItems = lineItems;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}

}
