package membership;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

/*
DAO(Data Access Object)
: 실제 데이터베이스에 접근하여 기본적인 CRUD 작업을 하기위한 객체이다. 
DB접속 및 select와 같은 쿼리문을 실행한 후 결과를 반환받아 처리하는
기능을 수행한다. 
 */

//JDBC를 위한 클래스를 상속하여 DB에 연결한다. 
public class MemberDAO extends JDBConnect {
	
	//생성자1 : 드라이버, 커넥션URL 등 4개의 매개변수로 정의
    public MemberDAO(String drv, String url, String id, String pw) {
        //super()를 통해 부모클래스의 생성자를 호출한다. 
    	super(drv, url, id, pw);
    }
    //생성자2 : application 내장객체를 매개변수로 정의 
    public MemberDAO(ServletContext application) {
        super(application);
    }
    
    /*
    사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 select한 후
    존재하는 회원정보인 경우 DTO객체에 레코드를 저장한 후 반환한다. 
     */
    public MemberDTO getMemberDTO(String uid, String upass) {
        //회원인증을 위한 쿼리문 실행 후 회원정보를 저장하기 위한 인스턴스 생성
    	MemberDTO dto = new MemberDTO();
    	/*로그인 폼에서 입력한 아이디, 패스워드를 통해 인파라미터를 
    	설정할 수 있도록 쿼리문을 작성 */
    	String query = "SELECT * FROM member WHERE id=? AND "
    			+ " pass=?";
    	
        try {
        	//쿼리문 실행을 위한 prepared 인스턴스 생성 
            psmt = con.prepareStatement(query);
            //쿼리문의 인파라미터 설정(아이디와 비번)
            psmt.setString(1, uid);     
            psmt.setString(2, upass);  
            //쿼리문 실행 및 결과는 ResultSet으로 반환받는다. 
            rs = psmt.executeQuery();
            //반환된 ResultSet객체에 정보가 저장되어 있는지 확인한다. 
            if (rs.next()) {
            	//회원정보가 있다면 DTO 객체에 저장한다. 
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString(3));
                dto.setRegidate(rs.getString(4));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        //회원정보를 저장한 DTO객체를 반환한다. 
        return dto;
    }
    
    
//    //새로운 게시물 입력을 위한 메서드 
//    public int insertWrite(BoardDTO dto) {
//        int result = 0;
//        
//        try {
//        	//인파라미터가 있는 동적쿼리문으로 insert문 작성
//        	//게시물의 일련번호는 시퀀스를 통해 자동부여받고, 
//        	//조회수의 경우에는 0을 입력한다. 
//            String query = "INSERT INTO board ( "
//                         + " num,title,content,id,visitcount) "
//                         + " VALUES ( "
//                         + " seq_board_num.NEXTVAL, ?, ?, ?, 0)";  
//            //동적쿼리문 이므로 prepared객체를 통해 인파라미터를
//            //채워준다. 
//            psmt = con.prepareStatement(query); 
//            psmt.setString(1, dto.getTitle());  
//            psmt.setString(2, dto.getContent());
//            psmt.setString(3, dto.getId());  
//            //insert를 실행하여 입력된 행의 갯수를 반환받는다.
//            result = psmt.executeUpdate(); 
//        }
//        catch (Exception e) {
//            System.out.println("게시물 입력 중 예외 발생");
//            e.printStackTrace();
//        }
//        
//        return result;
//    }
    
}