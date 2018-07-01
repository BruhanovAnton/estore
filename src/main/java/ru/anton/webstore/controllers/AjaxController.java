package ru.anton.webstore.controllers;

import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ru.anton.webstore.models.Product;

@Controller
public class AjaxController {
	
	
	@RequestMapping( value="/subView", method = RequestMethod.GET, produces="application/json")
    public ModelAndView getSubView( Model model ) {
        model.addAttribute( "user", "Joe Dirt" );
        model.addAttribute( "time", new Date());
        
        return new ModelAndView("test2");
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
