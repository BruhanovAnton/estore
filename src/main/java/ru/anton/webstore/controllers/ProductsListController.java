package ru.anton.webstore.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ru.anton.webstore.models.Product;
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
	
	
	@RequestMapping(value = "/addToCart{id}", method = RequestMethod.GET)
	public void addToCartById(@PathVariable long id,  HttpServletRequest request, HttpSession httpSession,
			Model model) {

		System.out.println("You add book number " + id);

		BookManager manager = new BookManager();
		manager.setup();
		

		httpSession.setAttribute(""+id, manager.getProduct(id));

		manager.exit();

	}
	
}
