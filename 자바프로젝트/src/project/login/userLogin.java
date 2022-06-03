package project.login;

import java.util.Calendar;
import java.util.Scanner;
import project.managereMode.Admin_Main;
import project.memberMain.memOutput;
import project.memberMain.MyPageCode.MyPageMain;
import project.memberMain.MyPageCode.MyReviewCalendar;
import project.memberMain.MyPageCode.Title;
import project.memberMain.community.CommunityMain;
import project.memberMain.event.EventMain;
import project.memberMain.follow.FollowMain;
import project.memberMain.group.GroupMain;


/**
 * 유저가 회원 혹은 관리자 혹은 가입되지 않은 회원으로 로그인 할 경우 관련된 클래스입니다/
 * 
 * @author 주혜원
 */
// 메인메뉴 1을 눌렀을때 로그인 클래스의 메소드들로 접근
public class userLogin {

	static Scanner scan = new Scanner(System.in);
	public static String id = "";
	private static String password = "";
	public static int userLoginCount = 0;
	private static Calendar now = Calendar.getInstance();


	/**
	 * 사용자가 회원,관리자로 로그인 하였을때 출력되는 화면 메소드입니다.
	 * @author 주혜원
	 */
	// 첫 로그인 화면
	public static void Login() {
		System.out.println("==================================================");
		System.out.println("                      [로그인]");
		System.out.println("==================================================");



		System.out.print("아이디: ");
		id = scan.nextLine();


		System.out.println("비밀번호: ");
		password = scan.nextLine();



		// 회원이나 관리자인 경우
		if (findUser() == true) {

		} else {
			// 등록된 회원이 아닌경우 -> 아이디,비밀번호 찾기로 넘어감
			whoareu();
		}



	}


	private static boolean findUser() {

		for (User u : Data.list) {
			if (u.getId().equals(id) && u.getPassword().equals(password)) {
				if (u.getId().equals(id) && u.getPassword().equals(password)) {
					System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
					System.out.println("           [회원]으로 로그인이 완료되었습니다.");
					System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
					userLoginCount++;

					LoginCategory(id);
					// 로그인이 된 다음 화면은 이부분에 추가하면됨.

					return true;
				}

			}
		}

		if (id.equals("admin") && password.equals("1234")) {
			System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
			System.out.println("           [관리자]로 로그인이 완료되었습니다.");
			System.out.println("            관리자 메인메뉴로 이동합니다.");
			System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");



			Admin_Main.adminMain(); // 관리자 메인메뉴로 이동



			return true;

		}
		return false;
	}



	/**
	 * 사용자가 회원으로 로그인을 하여 입장하고 나서 카테고리를 출력하고 이동시켜주는
	 * 메소드입니다.
	 * @author 주혜원
	 */
	// 로그인 하고 난 다음 화면
	public static void LoginCategory(String id) { // 로그인 하고 나면 그 다음 카테고리로 들어감
		System.out.println("             [  " + id + "님 환영합니다 ] ");
		System.out.println("--------------------------------------------------");
		memOutput.memberMain();
		memOutput.line(1);
		System.out.print("입력: ");
		String answer = scan.nextLine();

		MyReviewCalendar myCalendar =
				new MyReviewCalendar(now.get(Calendar.YEAR), (now.MONTH) + 2, id);


		if (answer.equals("1")) {
			Title.mypageTitle();
			MyPageMain.myPageMain(id);
		} else if (answer.equals("2")) {
			// 관람 기록 이동
			myCalendar.monthlyCalendar();
			myCalendar.calendarMenu();
		} else if (answer.equals("3")) {
			// 커뮤니티 이동
			CommunityMain.commuMain();

		} else if (answer.equals("4")) {

			GroupMain.groupMain();// 모임 이동

		} else if (answer.equals("5")) {

			FollowMain.followMain(); // Follow이동

		} else if (answer.equals("6")) {

			EventMain.eventMain(); // 이벤트 이동

		} else if (answer.equals("7")) {
			userLogin.id = "";
			main.main(null);
		} else {
			System.out.println("잘못된 입력입니다.");
			LoginCategory(id);
		}

	}


	/**
	 * 사용자가 가입되어 있지 않을 경우 출력되는 화면과 관련된 메소드입니다.
	 * @author 주혜원
	 */

	public static void whoareu() {
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("               가입이 되어있지 않습니다");
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

		System.out.println("[Q]1 .아이디를 찾으시겠습니까?");
		System.out.println("[Q]2 .회원가입을 하시겠습니까?");
		System.out.println("숫자를 입력하세요 : ");
		String answer = scan.nextLine();
		if (answer.equals("1")) {
			if (findMyId() == true) { // 해당하는 아이디가 있다면, 비밀번호를 찾을 수 있도록
				findMyPassword();
			} else {
				System.out.println("[!]현재 가입된 계정이 없습니다.");
			}
		}
		if (answer.equals("2")) {
			SignUp.addMember();
			Data.Save();

		}

		else {
			System.out.println("프로그램을 종료합니다.");
			System.out.println();
		}

	}


	/**
	 * 아이디 찾기와 관련된 메소드입니다.
	 * @author 주혜원
	 */
	// 아이디 찾기 - 이름 전화번호 입력
	public static boolean findMyId() {
		System.out.println("-------------------------------------------------");
		System.out.println("                  아이디 찾기");
		System.out.println("-------------------------------------------------");
		System.out.println("[Q]이름을 입력하세요 :  ");
		String name = scan.nextLine();
		System.out.println("[Q]전화번호를 입력하세요 :  ");
		String telnumber = scan.nextLine();



		for (User u : Data.list) { // 등록된 아이디가 있다면,
			if (u.getName().equals(name) && u.getTel().equals(telnumber)) {
				System.out.println(u.getName() + "의 아이디는" + u.getId() + "입니다.");
				findMyPassword();
				return true;


			}
		}
		System.out.println("[!]등록된 아이디가 없습니다. ");
		return false;
	}


	/**
	 * 비밀번호 찾기와 관련된 메소드입니다.
	 * @author 주혜원
	 */
	public static void findMyPassword() {
		System.out.println("[Q]비밀번호를 찾으시겠습니까?[Y/N]");
		String answer2 = scan.nextLine();

		if (answer2.toLowerCase().equals("y")) {

			System.out.println("-------------------------------------------------");
			System.out.println("                 비밀번호 찾기");
			System.out.println("-------------------------------------------------");
			System.out.println("[Q]아이디를 입력하세요 ");
			String userid = scan.nextLine();
			System.out.println("[Q]전화번호를 입력하세요");
			String usertell = scan.nextLine();
			System.out.println("[Q]본인의 출신 초등학교를 입력하세요");
			String userschool = scan.nextLine();



			for (User u : Data.list) {
				if (u.getId().equals(userid) && u.getTel().equals(usertell)
						&& u.getSchool().equals(userschool)) {
					System.out.println(u.getName() + "님의 비밀번호는" + u.getPassword() + "입니다");
					break;
				}
			} // for문

		}



		System.out.println("프로그램을 종료합니다");

	}

}
