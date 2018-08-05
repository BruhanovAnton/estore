package ru.anton.webstore.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;


public class Mother {
	@Autowired
	// @Qualifier("child")
	public Child child;
	public String color;

	public Mother() {

	}

	@Required
	public void setColor(String color) {
		this.color = color;
	}

	public Mother(Child child) {

		super();
		this.child = child;

	}

	public void M1() {
		child.M2();
		System.out.println(color);
	}


}
