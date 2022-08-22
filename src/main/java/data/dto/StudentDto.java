package data.dto;

public class StudentDto {
	private String name;
	private String addr;
	private int score;
	
	public StudentDto() {
		super();
	}

	public StudentDto(String name, String addr, int score) {
		super();
		this.name = name;
		this.addr = addr;
		this.score = score;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
}
