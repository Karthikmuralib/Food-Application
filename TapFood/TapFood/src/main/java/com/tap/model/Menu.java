package com.tap.model;

public class Menu {
	  private Integer menuid;
	  private Integer restaurantId; 
	  private String name;
	  private String description;
	  private Double price;
	  private Boolean isActive = true;
	  private String imagePath;
	  
	  
	  public Menu(Integer menuid, Integer restaurantId, String name, String description, Double price, Boolean isActive,
			String imagePath) {
		super();
		this.menuid = menuid;
		this.restaurantId = restaurantId;
		this.name = name;
		this.description = description;
		this.price = price;
		this.isActive = isActive;
		this.imagePath = imagePath;
	  }


	  public Integer getMenuId() {
		  return menuid;
	  }


	  public void setMenuid(Integer menuid) {
		  this.menuid = menuid;
	  }


	  public Integer getRestaurantId() {
		  return restaurantId;
	  }


	  public void setRestaurantId(Integer restaurantId) {
		  this.restaurantId = restaurantId;
	  }


	  public String getName() {
		  return name;
	  }


	  public void setName(String name) {
		  this.name = name;
	  }


	  public String getDescription() {
		  return description;
	  }


	  public void setDescription(String description) {
		  this.description = description;
	  }


	  public Double getPrice() {
		  return price;
	  }


	  public void setPrice(Double price) {
		  this.price = price;
	  }


	  public Boolean getIsActive() {
		  return isActive;
	  }


	  public void setIsActive(Boolean isActive) {
		  this.isActive = isActive;
	  }


	  public String getImagePath() {
		  return imagePath;
	  }


	  public void setImagePath(String imagePath) {
		  this.imagePath = imagePath;
	  }
	  
	  
	  

}
