package fileupload;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {
	//multiple 속성이 부여되어 2개 이상의 파일을 업로드 처리
	public static ArrayList<String> multipleFile(HttpServletRequest req,String sDirectory)
	throws ServletException, IOException{
		//파일명 저장을 위한 List 계열의 컬렉션 생성
		ArrayList<String> listFileName = new ArrayList<>();
		
		//getParts() 메서드로 Part 인스턴스를 컬렉션의 형태로 생성
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			/* 전송된 폼값중 파일이 아니라면 업로드의 대상이 아니므로 반복문의 처음으로
			 * 이동한다.*/
			if (!part.getName().equals("ofile"))
				continue;
			
			//폼값 중 파일이 맞다면 헤더값을 얻어온다.
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader="+partHeader);
			//헤더값에서 파일명을 잘라낸다.
			String[] phArr = partHeader.split("filename=");
			String orginalFileName = phArr[1].trim().replace("\"", "");
			
			//파일명을 디렉토리에 저장한다.
			if (!orginalFileName.isEmpty()) {
				part.write(sDirectory+File.separator+orginalFileName);
				
			}
			//List에 파일명을 추가한다.
			listFileName.add(orginalFileName);
		}
		//모든 파일의 업로드가 완료되면 파일명을 저장한 List를 반환한다.
		return listFileName;
	}

	
	//파입업로드 구현
	//파일 저장을 위한 저장 디렉토리와 request내장객체를 매개변수로 정의
	public static String uploadFile(HttpServletRequest req,String sDirectory)
	throws  IOException, ServletException{
		
		
		
		
		/*
		 * 파일첨부를 위한 <input>태그의 name속성값을 이용해서 Part 인서튼서를 생성한다.
		 * 이를 통해 파일을 서버에 저장할 수 있다.
		 * */
		Part part = req.getPart("ofile");
		
		/*
		 * Part 인스턴스에서 헤더값을 통해 원본 파일명을 얻어온다. 차후 업로드 테스트 시
		 * 콘솔에사 확인할 수 있다.
		 * */
		String partHeader = part.getHeader("content-disposition");
		System.out.println("partHeader="+partHeader);
		
		/*
		 * 헤더값을 통해 얻어온 문자열에서 "filename="을 구분자로 split한다.
		 * 그러면 String 타입의 배열로 반환된다.
		 * */
		String[] phArr = partHeader.split("filename=");
		/*
		 * 위 결과 중 1번 인덱스의 값이 파일명이 된다. 여기서 더블쿼테이션을 
		 * 제거해야 하므로 아래와 같이 replace()를 사용한다. 단 더블쿼테이션 앞에
		 * 이스케이프 시퀀스 기호를 반드시 추가해야 한다.
		 * */
		String originalFileName = phArr[1].trim().replace("\"", "");
		
		/*
		 * 전송된 파일이 있는 경우라면 서버의 디렉토리에 파일을 저장한다.
		 * File.separtor:운영체제(os)마다 경로를 표시해주는 기호가 다르므로
		 * 해당 os에 맞는 구분기호를 자동으로 추가해준다.
		 * */
		if (!originalFileName.isEmpty()) {
			part.write(sDirectory+File.separator+originalFileName);
		}
		//저장된 원본파일명을 반환한다.
		return originalFileName;
	}
	//파일명 변경 기능
	/*
	 * 서버에 저장된 파일명이 한글인 경우 웹브라우저에서 꺠짐 현상이 발생할 수 잇으므로 영문 혹은 숫자의 조합으로
	 * 변경하는 것이 안전하다.
	 * */
	public static String renameFile(String sDirectroy,String fileName) {
		
		/*
		 * 파일명에서 확장자를 잘라내기 위해 뒤에서부터 .이 있는 위치를 찾는다.
		 * 파일명이 2개 잇아의 닷(.)을 사용할 수 있기 때문이다.
		 * */
		String ext = fileName.substring(fileName.lastIndexOf("."));
		/*
		 * 날짜와 시간을 이용해서 파일명으로 사용할 문자열을 생성한다.
		 * "년월일_시분초999"와 같은 형태가 된다.마지막의 대문자 S는
		 * 밀리세컨즈 단위의 시간을 3자리로 반환한다.
		 * */
		String now = new SimpleDateFormat("yyyyMMdd_HmsS")		
				.format(new Date());
		String newFileName = now+ext;
		
		File oldFile = new File(sDirectroy+ File.separator + fileName);
		File newFile = new File(sDirectroy+ File.separator + newFileName);
		//파일명을 새로운 이름으로 변경한다.
		oldFile.renameTo(newFile);
		return newFileName;
	}
}
