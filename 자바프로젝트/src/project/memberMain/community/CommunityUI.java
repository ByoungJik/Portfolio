package project.memberMain.community;

import java.util.Scanner;

/**
 * 커뮤니티 선택 메뉴창 출력 클래스입니다.
 * @author 정병직
 *
 */
public class CommunityUI {

	private Scanner scan;
	
	public CommunityUI() {
		this.scan = new Scanner(System.in);
	}
	
	public static void communityMenu() {
		
		System.out.println("1. 영화");
		System.out.println("2. 연극");
		System.out.println("3. 뮤지컬");
		System.out.println("4. 도서");
		System.out.println("5. [메인 메뉴] 돌아가기");
		System.out.print("입력 : ");
		
		
	}
	
	
}

































