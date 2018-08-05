package ru.anton.webstore.controllers;

import java.io.IOException;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ru.anton.webstore.models.Product;
import ru.anton.webstore.service.LineItemService;
import ru.anton.webstore.service.OrderService;
import ru.anton.webstore.service.ProductService;
import ru.anton.webstore.supportModels.Status;

@Controller
public class AdminController {

	@Autowired(required = true)
	@Qualifier(value = "productService")
	private ProductService productService;

	@Autowired(required = true)
	@Qualifier(value = "orderService")
	private OrderService orderService;

	@Autowired(required = true)
	@Qualifier(value = "lineItemService")
	private LineItemService lineItemService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Locale locale, Model model) {

		model.addAttribute("orders", orderService.getOrdersList());

		model.addAttribute("product", new Product());

		return "admin";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@RequestParam("file") MultipartFile files, @ModelAttribute Product product, Model model) {

		try {
			product.setSmallImage(files.getBytes());
			model.addAttribute("message", "Товар: " + product.getTitle() + " добавлен в базу!");

		} catch (IOException e1) {

			e1.printStackTrace();
		}
		productService.addProduct(product);

		return "admin";

	}

	@RequestMapping(value = "/changeDataProduct", method = RequestMethod.POST)
	public String changeDataProduct(@RequestParam("file") MultipartFile files, @ModelAttribute Product product,
			Model model) {

		try {
			product.setSmallImage(files.getBytes());
			model.addAttribute("message", "Товар: " + product.getTitle() + " успешно изменен!");

		} catch (IOException e1) {

			e1.printStackTrace();
		}
		productService.updateProduct(product);

		return "admin";

	}

	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
	public String deleteProduct(@ModelAttribute Product product, Model model) {

		byte[] b = "null".getBytes();
		product.setSmallImage(b);
		productService.deleteProduct(product);

		model.addAttribute("message", "Товар c ID " + product.getProductId() + " удален!");

		return "admin";

	}

	@RequestMapping(value = "/actionsWithProducts", method = RequestMethod.GET)
	public String actionsWithProducts(Model model) {

		model.addAttribute("product", new Product());

		return "actionsWithProducts";
	}

	@RequestMapping(value = "/adminOrderActions", method = RequestMethod.GET)
	public String adminOrderActions(Model model) {

		model.addAttribute("orders", orderService.getOrdersList());

		return "adminOrderActions";
	}

	@RequestMapping(value = "/orderDetailInfo{id}", method = RequestMethod.GET)
	public String orderDetailInfo(@PathVariable("id") Long id, Model model) {

		model.addAttribute("items", orderService.getJoinLineItemsListAndProducts(id));
		model.addAttribute("orderId", orderService.getJoinLineItemsListAndProducts(id).get(0).getOrderId());

		return "orderDetailInfo";
	}

	@RequestMapping(value = "/chageOrderStatusTocCompleted{id}", method = RequestMethod.GET)
	public String chageOrderStatusTocCompleted(@PathVariable("id") Long id, Model model) {

		orderService.changeOrderStatus(id, Status.completed);

		return "orderDetailInfo";
	}

	@RequestMapping(value = "/chageOrderStatusTocCancel{id}", method = RequestMethod.GET)
	public String chageOrderStatusTocCancel(@PathVariable("id") Long id, Model model) {

		orderService.changeOrderStatus(id, Status.cancel);

		return "orderDetailInfo";
	}

}
