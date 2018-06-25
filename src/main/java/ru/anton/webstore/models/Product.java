package ru.anton.webstore.models;

import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "Products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productId")
	private long productId;

	@Column(name = "title")
	private String title;

	@Column(name = "brand")
	private String brand;

	@Column(name = "description", columnDefinition = "text")
	private String description;

	@Column(name = "price")
	private float price;

	@Lob
	@Column(name = "smallImage", nullable = false, columnDefinition = "mediumblob")
	private byte[] smallImage;
	
	
	

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getSmallImage() {
		String encoded = Base64.getEncoder().encodeToString(smallImage);
		return encoded;
	}

	public void setSmallImage(byte[] smallImage) {
		this.smallImage = smallImage;
	}

	

}
