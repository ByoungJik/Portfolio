package project.memberMain;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;


/**
 * 그룹 및 팔로우의 선택지 출력을 모아 놓은 클래스입니다.
 * @author user
 */
public class memOutput {
	
	/**
	 * 모임내 금지어를 입력했을때 '*'로 바꾸어주는 메소드 입니다.
	 * @param input
	 * @return
	 * @auther 남건희
	 */
	public static String swearWord(String input) {				// 욕설 
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader("data\\비속어\\비속어.txt"));
			
			String line = null;
			
			while((line = reader.readLine())!= null) {
				
				if(input.contains(line)) {
					
					String star = "";
					
					for(int i = 0 ; i<line.length(); i++) {
						star += "*";
					}
					
					input = input.replace(line,star);
				}
				
				
			}
			reader.close();			
			
		} catch (Exception e) {
			System.out.println("Output.swearWord");
			e.printStackTrace();
		}
		return input;
			
	}
	
	/**
	 * 게시물의 선택지를 출력해주는 메소드 입니다.
	 * @auther 남건희
	*/
	public static void groupComment(String str) {
		
		memOutput.line(1);
		System.out.println("1. 댓글 작성하기");
		System.out.printf(String.format("2. [%s 모임의 게시물] 돌아가기\n", str));
		memOutput.line(1);
		
	}
	/**
	 * 모임 탈퇴의 선택지를 출력해주는 메소드 입니다.
	 * @auther 남건희
	*/
	public static void groupExitMain() {
		System.out.println("1. 탈퇴할 모임 선택");
		System.out.println("2. [모임] 돌아가기");
	}
	
	/**
	 * 모임 가입의 선택지를 출력해주는 메소드 입니다.
	 * @auther 남건희
	*/
	public static void groupJoinMain() {
		System.out.println("1. 가입할 모임 선택");
		System.out.println("2. [모임] 돌아가기");
	}
	
	/**
	 * 모임 메인의 선택치를 출력해주는 메소드 입니다.
	 * @auther 남건희
	*/
	public static void groupMain() {
		System.out.println("1. 모임 접속");
		System.out.println("2. 모임 가입");
		System.out.println("3. 모임 탈퇴");
		System.out.println("4. [메인메뉴] 돌아가기");
	}
	
	/**
	 * 유저 메인의 선택지를 출력해주는 메소드 입니다.
	 * @auther 남건희
	*/
	public static void memberMain() {
		System.out.println("1. MYPage");
		System.out.println("2. 관람 기록");
		System.out.println("3. 커뮤니티");
		System.out.println("4. 모임");
		System.out.println("5. Follow");
		System.out.println("6. 이벤트");
		System.out.println("7. 로그아웃");
	}
	/**
	 * 팔로우의 선택지를 출력해주는 메소드 입니다.
	 * @auther 남건희
	*/
	public static void followMain() {
		System.out.println("1. Follow 추가");
		System.out.println("2. 메신저(DM) 확인");
		System.out.println("3. Follow 회원 캘린더 보기");
		System.out.println("4. Follow 관리");
		System.out.println("5. [메인 메뉴] 돌아가기");
	}

	public static void followAddMain() {
		System.out.println("1. Follow 검색");
		System.out.println("2. [Follow] 돌아가기");
	}
	
	public static void followCalMain() {
		System.out.println("1. Follow 선택");
		System.out.println("2. [Follow] 돌아가기");
	}
	
	public static void followBack() {
		memOutput.line(1);
		System.out.println("잘못된 입력입니다.");
		System.out.println("[Follow]로 돌아갑니다.");
		memOutput.line(1);
	}
	
	/**
	 * 게시물의 위치를 출력해주는 메소드 입니다.
	 * @auther 남건희
	*/
	public static void subtitle(String title) {
			System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
			System.out.println("                   " + title);
			System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
	}
	
	/**
	 * 프로그램을 일시 중지 해주는 메소드입니다.
	 * @auther 남건희
	*/
	public static void pause() {
		
		System.out.println("계속하시려면 [엔터]를 입력하세요.");
		
		//프로그램 일시 정지
		Scanner scan = new Scanner(System.in);
		
		scan.nextLine(); //블럭.. == 일시 정지
		
	}
	/**
	 *  게시물의 위치를 출력해주는 메소드 입니다.
	 * @auther 남건희
	*/
	  public static void subtitle1(String title) {
	      System.out.println("                    " + title);
	      System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
	}
	  /**
		 *  선을 출력해주는 메소드 입니다.
		 * @auther 남건희
		*/
	public static void line(int num) {
		
		for(int i = 0 ; i < num; i++) {
			System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		}
		
	}

}
