package fileupload;

import common.DBConnPool;
import common.JDBConnect;
import jakarta.servlet.ServletContext;


/*
 * DTO (Data TransFer Object)
 * :JSP와 Java 파일간에 데이터를 전달하기 위한 객체로 자바빈 규약에 의해 제작한다.
 * 
 * 자바빈즈 규약 
 * 1.자바빈즈는 기본(default)패키지 이외의 패키지에 속해야한다.
 * 2.멤버변수(속성)의 접근지정자는 private로 선언한다.
 * 3.기본 생성자가 있어야 한다.
 * 4.멤버변수에 접근할 수 있는 getter/setter가 있어야한다.
 * 5.getter
*/
public class FileDAO extends DBConnPool{

	
	
	public int insertFile(FileDTO dto) {
		int result = 0;
		try {
			 String sql = "INSERT INTO myfile (idx,title, cate, ofile, sfile, postdate) "
				  		+ "VALUES (myfile_seq.NEXTVAL,?, ?, ?, ?, SYSDATE)" ;
			 
			 
			 
			psmt=con.prepareStatement(sql);
			
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getCate());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getPostdate());
			result = psmt.executeUpdate(); 
			System.out.println("디비넣기성공");
		}
		catch (Exception e){
			e.printStackTrace();
			System.out.println("오류발생");
		}
		 
		  
		  
 return result;
		
	}
		
		
}
