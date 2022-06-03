package project.login;


/**
 * 사용자가 가입할때입력한 정보들에 관련된 메소들입니다
 * 
 * @author 주혜원
 */
public class User {
	private String id;
	private String password;
	private String name;
	private String birth;
	private String gender;
	private String tel;
	private String follow;
	private String genre;
	private String school;


	/**
	 * 사용자와 관련된 정보들을 매개변수로 받는 생성자 메소드입니다.
	 * @author 주혜원
	 */
	public User(String id, String password, String name, String birth, String gender, String tel,
			String follow, String genre, String school) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.tel = tel;
		this.follow = follow;
		this.genre = genre;
		this.school = school;

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFollow() {
		return follow;
	}

	public void setFollow(String follow) {
		this.follow = follow;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}



}

