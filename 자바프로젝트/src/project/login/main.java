package project.login;

import java.util.Scanner;

/**
 * 사용자의 초기화면과 관련된 카테고리들을 모아놓은 클래스입니다.
 * 
 * @author 주혜원
 */

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub


		Data.load();


		userLogin login = new userLogin();
		SignUp signup = new SignUp();



		boolean loop = true;

		Output.title();

		while (true) {
			System.out.println();
			System.out.println();


			Output.subtitle();
			Scanner scan = new Scanner(System.in);
			System.out.println("숫자를 입력하세요");
			String input = scan.nextLine();



			if (input.equals("1")) { // 로그인
				login.Login();

			} else if (input.equals("2")) {// 회원가입
				signup.addMember();
				Data.Save();

			} else if (input.equals("3")) { // 계정찾기
				login.findMyId();

			} else if (input.equals("4")) { // 비회원 계정으로 이동하기
				nonUserLogin.nonUserLogin();

			} else if (input.equals("5")) {
				System.exit(0);
			} else {
				loop = false;
			}
		}
	}

}


