package project.memberMain.follow;

import java.util.Scanner;
import project.PrintList;
import project.memberMain.memOutput;

/**
 * 팔로우를 관리하는 클래스
 * @auther 남건희
*/
public class ManageFollow {
	
	/**
	 * 팔로우한 유저들을 출력해주고 선택지를 받는 메소드
	 * @auther 남건희
	*/
	public static void manageFollow(){
		
		
		
		Scanner scan = new Scanner(System.in);
		
		PrintList.FollowingList();
		
		System.out.println("1. 삭제할 유저 선택");
		System.out.println("2. [Follow] 돌아가기");
		memOutput.line(1);
		
		System.out.print("입력: ");
		String input = scan.next();
		memOutput.line(1);
		
		if(input.equals("1")) {
			
			DeleteFollow.deleteFollow();
			
		}else {
			
			FollowMain.followMain(); // [Follow]로 돌아가기
			
		}
		
		
		
		
		
	}

}
