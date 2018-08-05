package ru.anton.webstore.dao;

import java.util.List;

import ru.anton.webstore.models.Product;
import ru.anton.webstore.supportModels.ProductFilter;

public interface ProductDao {
	public void addProduct(Product product);
	public void updateProduct(Product product);
	public void deleteProduct(Product product);
	public List<Product> getProductsList();
	public List<Product> getSearchResult(String param);
	public Product getProduct(Long id);
	public List<Product> getViaFilter(ProductFilter filter);
}
