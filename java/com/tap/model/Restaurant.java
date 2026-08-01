package com.tap.model;

public class Restaurant {
	private Integer restaurantid;   // PK
	private String name;
	private String address;
	private String phone;
	private Double rating;          // DECIMAL(2,1)
	private String cuisineType;
	private Boolean isActive = true;
	private Integer eta;            // Estimated delivery time (minutes)
	private Integer adminUserId;    // FK
	private String imagePath;  
	
	
	
	public Restaurant(Integer restaurantid, String name, String address, String phone, Double rating,
			String cuisineType, Boolean isActive, Integer eta, Integer adminUserId, String imagePath) {
		super();
		this.restaurantid = restaurantid;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.rating = rating;
		this.cuisineType = cuisineType;
		this.isActive = isActive;
		this.eta = eta;
		this.adminUserId = adminUserId;
		this.imagePath = imagePath;
	}



	public Integer getRestaurantid() {
		return restaurantid;
	}



	public void setRestaurantid(Integer restaurantid) {
		this.restaurantid = restaurantid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public Double getRating() {
		return rating;
	}



	public void setRating(Double rating) {
		this.rating = rating;
	}



	public String getCuisineType() {
		return cuisineType;
	}



	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}



	public Boolean getIsActive() {
		return isActive;
	}



	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}



	public Integer getEta() {
		return eta;
	}



	public void setEta(Integer eta) {
		this.eta = eta;
	}



	public Integer getAdminUserId() {
		return adminUserId;
	}



	public void setAdminUserId(Integer adminUserId) {
		this.adminUserId = adminUserId;
	}



	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}



	@Override
	public String toString() {
		return "Restaurant [restaurantid=" + restaurantid + ", name=" + name + ", address=" + address + ", phone="
				+ phone + ", rating=" + rating + ", cuisineType=" + cuisineType + ", isActive=" + isActive + ", eta="
				+ eta + ", adminUserId=" + adminUserId + ", imagePath=" + imagePath + "]";
	}

	
	
	
	
	

}
