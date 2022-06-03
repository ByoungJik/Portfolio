package project.memberMain.community;

import java.util.Scanner;
import project.login.userLogin;
import project.memberMain.MemberMain;
import project.memberMain.group.GroupMain;

/**
 * 커뮤니티의 카테고리 메뉴창을 출력 및 선택하는 클래스입니다.
 * @author 정병직
 *
 */
public class CommunityMain {

	/**
	 * 커뮤니티 선택창을 출력한 뒤 입력값(input)을 받아 해당 타 클래스의 메소드로 넘어가는 메소드입니다.
	 * @author 정병직
	 */
	public static void commuMain() {
		Community commu = new Community();
		
		boolean loop = true;
		
		while (loop) {
			System.out.println();
			System.out.println();
			System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
			System.out.println("                 커뮤니티");
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
					userLogin.LoginCategory(userLogin.id);
					
			}
		}
	}
}
