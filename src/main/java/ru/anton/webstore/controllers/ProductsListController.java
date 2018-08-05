package ru.anton.webstore.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ru.anton.webstore.service.ProductService;
import ru.anton.webstore.supportModels.ProductFilter;
import ru.anton.webstore.test.BookManager;



@Controller
public class ProductsListController {
	
	@Autowired(required = true)
	@Qualifier(value = "productService")
	private ProductService productService;
	
	
	@RequestMapping("/productList")
	public String listOfProducts(Model model) {
		;
		model.addAttribute("products", productService.getProductsList());
		

		return "products/productList";
	}

	@RequestMapping("/catalog")
	public String catalog(Model model) {
		model.addAttribute("filter", new ProductFilter());

		return "products/catalog";
	}

}
