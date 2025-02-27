package membership;
/*
 * DTO (Data TransFer Object)
 * :JSP와 Java 파일간에 데이터를 전달하기 위한 객체로 자바빈 규약에 의해 제작한다.
 * 
 * 자바빈즈 규약 
 * 1.자바빈즈는 기본(default)패키지 이외의 패키지에 속해야한다.
 * 2.멤버변수(속성)의 접근지정자는 private로 선언한다.
 * 3.기본 생성자가 있어야 한다.
 * 4.멤버변수에 접근할 수 있는 getter/setter가 있어야한다.
 * 5.getter/setter는 public 접근지정자를 가져야한다.
 * */
public class MemberDTO {
	//멤버변수 : member 테이블의 컬럼과 동일하게 생성

	private String id;
	private String pass;
	private String name;
	private String regidate;
	/*
	 * 정보은닉된 멤버변수에 접근하기 위해 public으로 정의된
	 * getter/setter메서드를 정의한다.
	 * */
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
}
