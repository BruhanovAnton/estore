package ru.anton.webstore.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ru.anton.webstore.models.Product;
import ru.anton.webstore.test.Employee;

@Controller
public class AjaxController {
	
	
	@RequestMapping( value="/subView", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView getSubView( Model model ) {
        model.addAttribute( "user", "Joe Dirt" );
        model.addAttribute( "time", new Date());
        
        return new ModelAndView("test2");
    }
	
	@RequestMapping(value="/olist", method = RequestMethod.POST)
	public @ResponseBody Employee add(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Employee employee = new Employee();
		
		employee.setEmail("Reimy4@gmail.com");
		employee.setFirstName("Anton");
		employee.setLastName("Bruhanov");

Employee employee2 = new Employee();
		
		employee2.setEmail("Reimy4@gmail.com2");
		employee2.setFirstName("Anton2");
		employee2.setLastName("Bruhanov2");
		
		List<Employee> emp = new ArrayList<Employee>();
		
		
		return employee2;
	}
	
	
	    @RequestMapping(value = "/ajaxtest", method = RequestMethod.GET)
	    public @ResponseBody
	    String getTime() {
	 
	        Random rand = new Random();
	        float r = rand.nextFloat() * 100;
	        String result = "<br>Next Random # is <b>" + r + "</b>. Generated on <b>" + new Date().toString() + "</b>";
	        System.out.println("Debug Message from CrunchifySpringAjaxJQuery Controller.." + new Date().toString());
	        return result;
	    }


}
