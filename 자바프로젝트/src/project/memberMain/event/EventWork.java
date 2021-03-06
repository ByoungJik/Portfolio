package project.memberMain.event;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Scanner;

/**
 * 이벤트 업무 처리 클래스
 * @author 남건희
 *
 */
public class EventWork {

	private static Scanner scan;
	
	/**
	 * 이벤트 업무 처리 메소드
	 * @auther 남건희
	 */
	public EventWork() {
		this.scan = new Scanner(System.in);
	}
	/**
	 * 유저가 선택한 이벤트 내용을 출력하는 메소드
	 * @auther 남건희
	*/
	public static void eventSelect() {		// 이벤트 고르기
		

		File dir = new File("data\\이벤트");			
		File[] files = dir.listFiles();
		
		System.out.print("이벤트 선택(번호): ");						
		int num = scan.nextInt();


		if (num >= 1 && num < files.length+1) {

			File event = new File(String.format("data\\이벤트\\%s" 		// 선택한 번호에 맞는 이벤트 경로 찾기
					, files[num - 1].getName()));																// 선택 번호는 1부터 시작하기에 num+1

			try {
				BufferedReader reader = new BufferedReader(new FileReader(event));
				String line = null;
				while ((line = reader.readLine()) != null) {											// 이벤트 내용 출력
					System.out.println(line);
				}
				reader.close();

			} catch (Exception e) {
				System.out.println("EventWork.eventSelect");
				e.printStackTrace();
			}
			
		}
	}

}
