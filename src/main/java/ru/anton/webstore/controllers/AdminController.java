package ru.anton.webstore.controllers;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ru.anton.webstore.models.Product;

import ru.anton.webstore.test.BookManager;

@Controller
public class AdminController {
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Locale locale, Model model) {

		
		BookManager bm = new BookManager();
		bm.setup();
		model.addAttribute("orders", bm.getOrdersList());
		bm.exit();
		
		
		model.addAttribute("product", new Product());
		

		return "admin";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@RequestParam("file") MultipartFile files, @ModelAttribute Product product, Model model) {

		BookManager bm = new BookManager();
		bm.setup();
		try {
			product.setSmallImage(files.getBytes());
			model.addAttribute("message", "Товар: " + product.getTitle() + " добавлен в базу!");

		} catch (IOException e1) {

			e1.printStackTrace();
		}
		bm.addProduct(product);
		bm.exit();

		return "admin";

	}
	
	@RequestMapping(value = "/changeDataProduct", method = RequestMethod.POST)
	public String changeDataProduct(@RequestParam("file") MultipartFile files, @ModelAttribute Product product, Model model) {

		BookManager bm = new BookManager();
		bm.setup();
		try {
			product.setSmallImage(files.getBytes());
			model.addAttribute("message", "Товар: " + product.getTitle() + " успешно изменен!");

		} catch (IOException e1) {

			e1.printStackTrace();
		}
		bm.updateProduct(product);
		bm.exit();

		return "admin";

	}
	
	
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
	public String deleteProduct(@ModelAttribute Product product, Model model) {

		BookManager bm = new BookManager();
		bm.setup();
		byte[] b = "null".getBytes();
		product.setSmallImage(b);
		bm.deleteProduct(product);;
		bm.exit();	
		model.addAttribute("message", "Товар c ID " + product.getProductId() + " удален!");

		
		
		

		return "admin";

	}

}
