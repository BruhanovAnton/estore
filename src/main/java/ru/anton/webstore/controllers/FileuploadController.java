package ru.anton.webstore.controllers;

import java.io.IOException;

import java.util.Base64;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ru.anton.webstore.models.Product;


@Controller
public class FileuploadController {
//	@Autowired
//	ServletContext context;

	@RequestMapping(value = "/a", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("product", new Product());
		return "index";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(@ModelAttribute Product product,@RequestParam("file") List<MultipartFile> files) {

		System.out.println(files.get(1).getOriginalFilename());
		System.out.println(product.getTitle());
		
		byte[] bytes;
		try {
			bytes = files.get(0).getBytes();
			String base64 = Base64.getEncoder().encodeToString(bytes);
			System.out.println("Image code: " );
			System.out.println("code " + base64 + " code" );
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "success";
	}
}
