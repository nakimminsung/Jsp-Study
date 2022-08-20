package data.dto;

public class FoodDto {
	private int no;
	private String foodname;
	private String foodphoto;
	private int price;
	private String day;
	
	public FoodDto() {
		super();
	}

	

	public FoodDto(int no, String foodname, String foodphoto, int price, String day) {
		super();
		this.no = no;
		this.foodname = foodname;
		this.foodphoto = foodphoto;
		this.price = price;
		this.day = day;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFoodname() {
		return foodname;
	}

	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}



	public String getFoodphoto() {
		return foodphoto;
	}



	public void setFoodphoto(String foodphoto) {
		this.foodphoto = foodphoto;
	}
	
	
	
}
