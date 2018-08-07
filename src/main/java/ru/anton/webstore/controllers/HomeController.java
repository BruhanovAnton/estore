package ru.anton.webstore.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String mainPage(Model model) {

		return "main";

	}

	@RequestMapping("/slideShow")
	public String slideShow() {

		return "mainPage/slideShow";

	}
	
	@RequestMapping("/aboutUs")
	public String aboutUs() {

		return "aboutUs";

	}
	
	@RequestMapping("/contacts")
	public String contacts() {

		return "contacts";

	}
}
