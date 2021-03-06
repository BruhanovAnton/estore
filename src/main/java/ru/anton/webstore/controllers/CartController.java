package ru.anton.webstore.controllers;

import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.anton.webstore.models.LineItem;
import ru.anton.webstore.models.Order;
import ru.anton.webstore.models.Product;
import ru.anton.webstore.service.OrderService;
import ru.anton.webstore.service.ProductService;
import ru.anton.webstore.supportModels.Cart;

@Controller
public class CartController {

	@Autowired(required = true)
	@Qualifier(value = "orderService")
	private OrderService orderService;

	@Autowired(required = true)
	@Qualifier(value = "productService")
	private ProductService productService;

	@RequestMapping(value = "/addOrder", method = RequestMethod.POST)
	public String addOrder(@ModelAttribute Cart cart, Model model, HttpSession session) {

		Order order = new Order();
		order.setCustomerId(cart.getUserId());
		order.setTotalCost(cart.getTotalCost());
		order.setOrderDate(new Date());
		order.setStatus("� ���������");

		Map<Integer, Integer> map = cart.getLineItems();
		List<LineItem> items = new ArrayList<LineItem>();

		for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
			int key = entry.getKey();
			int value = entry.getValue();

			LineItem item = new LineItem();
			item.setProductId(key);
			item.setQuantity(value);
			item.setOrder(order);
			items.add(item);

			System.out.println("key = " + key + " value = " + value);
		}
		System.out.println("Total cost = " + cart.getTotalCost());
		System.out.println("User ID is: " + cart.getUserId());

		orderService.addOrderWithLineItems(order, items);

		for (String productName : session.getValueNames()) {

			session.removeAttribute(productName);
		}

		return "redirect:/orderComplete";

	}

	@RequestMapping("/orderComplete")
	public String orderComplete(Model model) {
		model.addAttribute("message", "����� ��������");
		return "orderComplete";
	}

	@RequestMapping("/cartDeleteItem/{id}")
	public String bookData(@PathVariable("id") int id, HttpSession session, Model model) {

		System.out.println("��������� ����� � ID: " + id);

		session.removeAttribute("" + id);

		List<Product> products = new ArrayList<Product>();

		for (String productName : session.getValueNames()) {
			products.add((Product) session.getAttribute(productName));
		}

		model.addAttribute("cart", new Cart());
		model.addAttribute("product", new Product());
		model.addAttribute("products", products);

		return "redirect:/cart";
	}

	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String showCart(Model model, HttpSession httpSession) {

		List<Product> products = new ArrayList<Product>();

		for (String productName : httpSession.getValueNames()) {
			products.add((Product) httpSession.getAttribute(productName));
		}

		model.addAttribute("cart", new Cart());
		model.addAttribute("product", new Product());
		model.addAttribute("products", products);

		return "cart";
	}

	@RequestMapping(value = "/addToCart{id}", method = RequestMethod.GET)
	public void addToCartById(@PathVariable long id, HttpServletRequest request, HttpSession httpSession, Model model) {

		System.out.println("You add book number " + id);

		httpSession.setAttribute("" + id, productService.getProduct(id));

	}
	
	
	
}
