package project.login;

import java.util.Scanner;
import project.memberMain.community.Community;
import project.memberMain.community.CommunityCategorieOutput;
import project.memberMain.community.CommunityUI;
import project.memberMain.event.EventMain;

/**
 * 비회원으로 로그인하였을때와 관련된 클래스입니다.
 * 
 * @author 주혜원
 */
public class nonUserLogin {
	public static int nonUserCount = 0;
	static Scanner scan = new Scanner(System.in);
	private static Community commu = new Community();

	/**
	 * 비회원으로 입장하였음을 출력해주는 메소드입니다.
	 * @author 주혜원
	 */
	public static void nonUserLogin() {
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("               [비회원]으로 입장하였습니다");
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

		nonUserCount++;

		nonUserMain();

	}

	/**
	 * 비회원의 카테고리를 출력해주는 메소드입니다.
	 * @author 주혜원
	 */

	public static void nonUserMain() {
		System.out.println("-------------------------------------------------");
		System.out.println("               [비회원]으로 메인 메뉴입니다");
		System.out.println("-------------------------------------------------");
		System.out.println("1.커뮤니티");
		System.out.println("2.이벤트");
		System.out.println("3.[메인 메뉴]로 돌아가기");
		System.out.println("숫자를 입력하세요:    ");
		System.out.println();
		System.out.println();
		String answer = scan.nextLine();


		if (answer.equals("1")) {
			nonUserCategory();
		} else if (answer.equals("2")) {
			EventMain.eventMain(); // 메인 메뉴로 돌아가기
		} else if (answer.equals("3")) {
			main.main(null); // 메인 메뉴로 돌아가기
		}


	}

	/**
	 * 비회원의 카테고리를 출력해주는 메소드입니다
	 * @author 주혜원
	 */

	public static void nonUserCategory() {
		
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("                  커뮤니티");
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		CommunityUI.communityMenu();
		Scanner scan = new Scanner(System.in);
		String input = scan.nextLine();
		switch (input) {
			
			case "1" :
				commu.movie(input);
				break;
			case "2" :
				commu.play(input);
				break;
			case "3" :
				commu.musical(input);
				break;
			case "4" :
				commu.book(input);
				break;
			case "5" :
				nonUserMain();
				
		}
	}



}
