package project.memberMain.follow;

import java.util.Scanner;
import project.PrintList;
import project.memberMain.memOutput;

/**
 * Follow의 DM 기능 클래스
 * @auther 남건희
*/
public class DMconfirm {
	
	/**
	 * DM 가능한 상대 리스트 출력과 입력값을 받는 메소드
	 * @auther 남건희
	*/
	public static void dmConfirm() {
		
		Scanner scan = new Scanner(System.in);
		
		PrintList.myDMList();
		memOutput.line(1);
		System.out.println("1. DM 확인하기");
		System.out.println("2. [Follow] 돌아가기");
		memOutput.line(1);
		System.out.print("입력: ");
		String input = scan.next();
		
		if(input.equals("1")) {
				
			System.out.print("대화할 상대(ID) 입력: ");
			String input1 = scan.next();	
			
			UserChat.userChat(input1);	 //대화창 이동
		}else {
			FollowMain.followMain(); // [팔로우] 이동
		}

		
		
		
		
		
		
		
	}	

}
