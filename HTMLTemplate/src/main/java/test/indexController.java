package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/index.kosmo")
public class indexController extends HttpServlet{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//모델통신
		//모델통신요청처리
		//모델통신요청처리완료된거리퀘스트에저장
		
		req.setAttribute("Message", "서브맀 매핑 완료");
		req.getRequestDispatcher("./index.jsp").forward(req, resp);
							//view의경로(index.jsp)
	
	}                       
}
