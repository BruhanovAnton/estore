package ru.anton.webstore.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ru.anton.webstore.dao.ProductDao;
import ru.anton.webstore.models.Product;
import ru.anton.webstore.supportModels.ProductFilter;

public class ProductServiceImpl implements ProductService{

	private ProductDao productDao;
	
	
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	
	public void addProduct(Product product) {
		productDao.addProduct(product);
		
	}

	@Override
	
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
		
	}

	@Override
	
	public void deleteProduct(Product product) {
		productDao.deleteProduct(product);
		
	}

	@Override
	
	public List<Product> getProductsList() {
		
		return productDao.getProductsList();
	}

	@Override
	
	public List<Product> getSearchResult(String param) {
		
		return productDao.getSearchResult(param);
	}

	@Override
	
	public Product getProduct(Long id) {
		
		return productDao.getProduct(id);
	}

	@Override
	
	public List<Product> getViaFilter(ProductFilter filter) {
		
		return productDao.getViaFilter(filter);
	}

}
