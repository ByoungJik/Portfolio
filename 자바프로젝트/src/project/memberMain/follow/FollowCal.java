package project.memberMain.follow;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Calendar;
import java.util.Scanner;
import project.PrintList;
import project.login.userLogin;
import project.memberMain.MyPageCode.FindReview;
import project.memberMain.MyPageCode.MyReviewCalendar;
import project.memberMain.MyPageCode.ReviewList;
import project.memberMain.MemberMain;
import project.memberMain.memOutput;

/**
 * Follow한 유저의 캘린더를 공유받기 위한 클래스입니다.
 * @author 정병직
 *
 */
public class FollowCal {
	
	public static String followerId;
	private static File dir = new File("data\\마이페이지");
	private static File[] list = dir.listFiles();
	
	private static Calendar now = Calendar.getInstance();
	private static Scanner scan = new Scanner(System.in);
	private static ReviewList reviewList;
	
	/**
	 * follow한 유저의 캘린더를 확인하기 위한 메뉴창 내부 메소드입니다.
	 * @author 정병직
	 */
	public static void followCal() {
		
		memOutput.line(1);
		PrintList.FollowingList();
		memOutput.followCalMain();
		System.out.print("입력 : ");
		String input = scan.nextLine();
		
		
		if (input.equals("1")) {
			
			
			followCalMethod(scan);
			
			
		} else if (input.equals("2")) {
			
			FollowMain.followMain();
			
		} else {
			memOutput.followBack();
		}
		
		
	}

	/**
	 * 캘린더 공유받을 Follow 유저 아이디를 입력받은 후 현재 날짜와 함께 내부로 이동하기 위한 메소드입니다.
	 * @param scan
	 * @author 정병직
	 */
	public static void followCalMethod(Scanner scan) {
		memOutput.line(1);
		System.out.println("캘린더를 확인할 Follower 아이디를 입력하세요.");
		System.out.print("입력 : ");
		String inputId = scan.nextLine();
		
		followerId = follower(inputId);
		
		if (followerId != null) {
			
			
			reviewList = new ReviewList(followerId);
			MyReviewCalendar followerCal = new MyReviewCalendar(now.get(Calendar.YEAR), now.MONTH+2, inputId);
			followerCal.monthlyCalendar();
			followCalMenu(inputId);
			
			
		} else {
			
			
			System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
			System.out.println(" **정확한 아이디를 입력하세요**");
			followCalMethod(scan);
			
			
		}
	}

	/**
	 * 입력값(inputId)를 통하여 입력값이 Follow한 유저의 아이디와 동일한지 체크하는 메소드입니다.
	 * @param inputId
	 * @return
	 * @author 정병직
	 */
	public static String follower(String inputId) {

		String userPath = null;
		for (File d : list) {
			if (d.isDirectory()) {
				if (d.getName().equals(userLogin.id)) {
					userPath = dir + "\\" + d.getName() + "\\following.txt" ;
					
				}
			}
		}
		
		int overlap = 0;
		
		try {
			BufferedReader reader = new BufferedReader(new FileReader(userPath));
			String line = null;

			while ((line = reader.readLine()) != null) {
				if (line.equals(inputId)) {
					overlap = 1;
				} else if (inputId.equals(userLogin.id)) {
					overlap = 2;
				}
			}
			reader.close();
		} catch (Exception e) {
			System.out.println("FollowCal.follower");
			e.printStackTrace();
		}
		
		if (overlap == 1) {
			
			return inputId;
			
		}
		
		return null;
	}

	/**
	 * 캘린더 출력 후 해당 유저의 기록을 보기 메뉴창을 출력 및 기능을 하는 메소드입니다.
	 * @param inputId
	 * @author 정병직
	 */
	public static void followCalMenu(String inputId) {
		System.out.println(" 1. 날짜별 기록 검색하기");
		System.out.println(" 2. 전체 목록 보기");
		System.out.println(" 3. [Follow]로 돌아가기");
		System.out.print  (" ⦿ 선택: ");
		
		String input = scan.nextLine();
		
		if(input.equals("1")) {
			System.out.println(" 엔터를 검색하면 날짜 검색 화면으로 이동합니다.");
			scan.nextLine();
			
			FindReview find = new FindReview(inputId);
			find.find("follow");
		
		} else if(input.equals("2")) {
			System.out.println();
			System.out.println(" 엔터를 누르시면 전체목록으로 이동합니다.");
			scan.nextLine();
			reviewList.allReviewlist();
			call(inputId);
			
			
		} else if(input.equals("3")) {
			System.out.println();
			System.out.println(" 엔터를 누르시면 마이페이지로 이동합니다.");
			scan.nextLine(); 
			

			
		} else {
			System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
			System.out.println(" **정확한 번호를 입력하세요**");
			scan.nextLine();
			followCalMenu(inputId);
			
		}
	}

	/**
	 * 기록 확인 후 캘린더 메뉴창으로 돌아가기 위한 메소드입니다.
	 * @param inputId
	 * @author 정병직
	 */
	public static void call(String inputId) {
		
		System.out.print("엔터를 누르시면 [캘린더]로 이동합니다.");
		String input = scan.nextLine();
		MyReviewCalendar followerCal = new MyReviewCalendar(now.YEAR, now.MONTH+2, inputId);
		followerCal.monthlyCalendar();
		followCalMenu(inputId);
		
	}
	
	

}
































