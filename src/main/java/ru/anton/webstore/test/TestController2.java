package ru.anton.webstore.test;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ru.anton.webstore.test.BookManager;
import ru.anton.webstore.models.Product;
import ru.anton.webstore.supportModels.Cart;
import ru.anton.webstore.supportModels.ProductFilter;

@Controller
public class TestController2 {

	@RequestMapping(value = "/testPage", method = RequestMethod.GET)
	public String printWelcome(Model model) {

		BookManager manager = new BookManager();
		manager.setup();
		model.addAttribute("products", manager.getProductsList());
		manager.exit();
		model.addAttribute("filter", new ProductFilter());
		model.addAttribute("product", new Product());

		return "index3";

	}

	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public void addToCart(@RequestBody Product product, HttpServletRequest request, HttpSession httpSession,
			Model model) {

		System.out.println("You add book number " + product.getProductId());

		BookManager manager = new BookManager();
		manager.setup();
		Long id = (long) product.getProductId();

		httpSession.setAttribute(""+product.getProductId(), manager.getProduct(id));

		manager.exit();

	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String showCart(Model model, HttpSession httpSession) {

		List<Product> products = new ArrayList<Product>();

		for (String productName : httpSession.getValueNames()) {
			products.add((Product) httpSession.getAttribute(productName));
		}

		model.addAttribute("cart", new Cart());
		model.addAttribute("product", new Product());
		model.addAttribute("products", products);

		// String encoded =
		// Base64.getEncoder().encodeToString(products.get(0).getSmallImage());
		//
		// model.addAttribute("img", encoded);

		return "cart";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchResults(@ModelAttribute ProductFilter filter, Model model) {

		System.out.println(filter.getSearch());

		BookManager manager = new BookManager();
		manager.setup();
		model.addAttribute("products", manager.getSearchResult(filter.getSearch()));
		manager.exit();
		
		model.addAttribute("filter", new ProductFilter());
		model.addAttribute("product", new Product());

		return "index3";

	}

	@RequestMapping(value = "/filterAct", method = RequestMethod.POST)
	public String productFilter(@ModelAttribute ProductFilter filter, Model model) {

		System.out.println(filter.getBrand()[0]);
		System.out.println(filter.getMaxPrice());

		BookManager manager = new BookManager();
		manager.setup();
		model.addAttribute("products", manager.getViaFilter(filter));
		manager.exit();
		

		model.addAttribute("filter", new ProductFilter());
		model.addAttribute("product", new Product());

		return "index3";

	}
	
	
	@RequestMapping("/product/{id}")
    public String bookData(@PathVariable("id") int id, Model model){
		
		System.out.println(id);
		
		Long productId = new Long(id);
		
		BookManager manager = new BookManager();
		manager.setup();
		model.addAttribute("product", manager.getProduct(productId));
		manager.exit();
		       

        return "product";
    }
	

	@RequestMapping("/product")
    public String bookData(){
		      

        return "product2";
    }
	
	

}
