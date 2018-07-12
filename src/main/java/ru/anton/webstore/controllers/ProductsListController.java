package ru.anton.webstore.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ru.anton.webstore.supportModels.ProductFilter;
import ru.anton.webstore.test.BookManager;

@Controller
public class ProductsListController {
	@RequestMapping("/productList")
	public String listOfProducts(Model model) {
		BookManager manager = new BookManager();
		manager.setup();
		model.addAttribute("products", manager.getProductsList());
		manager.exit();
		
		return "products/productList";
	}
	
	
	@RequestMapping("/catalog")
	public String catalog(Model model) {
		model.addAttribute("filter", new ProductFilter());
		
		return "products/catalog";
	}
}
