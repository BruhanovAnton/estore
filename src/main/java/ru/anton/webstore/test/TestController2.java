package ru.anton.webstore.test;


import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ru.anton.webstore.test.BookManager;
import ru.anton.webstore.models.Product;
import ru.anton.webstore.service.ProductService;
import ru.anton.webstore.supportModels.Cart;
import ru.anton.webstore.supportModels.ProductFilter;






@Controller
public class TestController2 {
	
	
	
	private ProductService productService;

	@Autowired(required = true)
	@Qualifier(value = "productService")
	public void setProductService(ProductService productService) {
	    this.productService = productService;
	}
	
	
	private ProductFilter filterData = new ProductFilter();
	
	

	
	@RequestMapping("/test")
	public String testTest() {

		return "test";
	}
	
	@RequestMapping("/json")
	public String jsonTest() {

		return "json";
	}
	
	

	@RequestMapping(value = "/testPage", method = RequestMethod.GET)
	public String printWelcome(Model model) {

		
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

//	@SuppressWarnings("deprecation")
//	@RequestMapping(value = "/cart", method = RequestMethod.GET)
//	public String showCart(Model model, HttpSession httpSession) {
//
//		List<Product> prods = productService.getProductsList();
//		
//		for(Product p : prods){
//			System.out.println(p.getTitle() + " " + p.getPrice());
//		}
//	
//		
//		List<Product> products = new ArrayList<Product>();
//
//		for (String productName : httpSession.getValueNames()) {
//			products.add((Product) httpSession.getAttribute(productName));
//		}
//
//		model.addAttribute("cart", new Cart());
//		model.addAttribute("product", new Product());
//		model.addAttribute("products", products);
//
//		// String encoded =
//		// Base64.getEncoder().encodeToString(products.get(0).getSmallImage());
//		//
//		// model.addAttribute("img", encoded);
//
//		return "cart";
//	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String filter(@RequestBody ProductFilter filter, HttpSession session, Model model) {

		
		

		model.addAttribute("products", productService.getSearchResult(filter.getSearch()));
		
		return "products/productList";

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
	
	
	@RequestMapping(value = "/filter", method = RequestMethod.POST)
	public String filter2(@RequestBody ProductFilter filter, HttpSession session, Model model) {

			
		model.addAttribute("products", productService.getViaFilter(filter));
		
		return "products/productList";

	}
	

	@RequestMapping("/product")
    public String bookData(){
		      

        return "product2";
    }
	
	@RequestMapping(value = "/simple/", method = RequestMethod.GET)
	public @ResponseBody String emailcheck(@RequestParam("name") String name, @RequestParam("email") String email, HttpSession session) {

		System.out.println(name + " "+ email);
		
		
	    String meaaseg = "success";
	    return meaaseg;
	}
}
