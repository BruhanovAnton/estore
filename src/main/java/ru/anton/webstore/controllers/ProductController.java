package ru.anton.webstore.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ru.anton.webstore.service.ProductService;


@Controller
public class ProductController {

	@Autowired(required = true)
	@Qualifier(value = "productService")
	private ProductService productService;
	
	
	@RequestMapping("/product/{id}")
    public String bookData(@PathVariable("id") int id, Model model){
		
		System.out.println(id);
		
		Long productId = new Long(id);
		
		
		model.addAttribute("product", productService.getProduct(productId));
		
		       

        return "productPage";
    }
	
}
