package project.memberMain.group;

import java.util.Scanner;
import project.memberMain.MemberMain;
import project.memberMain.memOutput;

/**
 *  모임 메인의 선택지를 출력하고 입력을 받는 클래스 입니다.
 * @auther 남건희
*/
public class GroupMain {
	/**
	 *  모임 메인의 선택지를 출력하고 입력을 받는 메소드 입니다.
	 * @auther 남건희
	*/
	public static void groupMain() {		
		
		Scanner scan = new Scanner(System.in);

		memOutput.subtitle("     모임");
		memOutput.groupMain();
		memOutput.line(1);

		System.out.print("입력: ");
		String input = scan.nextLine();

		boolean loop = true;

		
			if (input.equals("1")) {
				
				GroupConnect.groupConnect(); // 모임 접속
				
			} else if (input.equals("2")) {
				
				GroupJoin.groupJoin();
				
			} else if (input.equals("3")) {
				
				GroupExit.groupExit();// 모임 탈퇴
				
			} else if (input.equals("4")) {
				
				MemberMain.memberMain();;// [메인 메뉴] 돌아가기   memberMain();
				
			}
	}

}