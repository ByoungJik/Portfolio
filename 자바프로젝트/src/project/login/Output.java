package project.login;


/**
 * 사용자에게 보여지는 레이아웃과 관련된 클래스입니다.
 * 
 * @author 주혜원
 */
public class Output {

	/**
	 * 초기 타이틀을 출력해주는 메소드입니다.
	 * @author 주혜원
	 */
	public static void title() {
		System.out.println("                                        \r\n"
				+ "                     .::LPBIBZ       \r\n"
				+ "               .:vEMPIiBBBM  B       \r\n"
				+ "         .vbZPsBBBB    BBB           \r\n"
				+ "    b5bBBBJ   BB                    \r\n"
				+ "    B  BBBY                          \r\n"
				+ "    qQZBBQZqPUri..::7YJJvi7ivs2i     \r\n"
				+ "    :B .BBBb   vBBQB ..rBBBB  PB     \r\n"
				+ "    :B.. IBBBQ.. 2BBBB.. vBBBg1Q     \r\n"
				+ "    :B                        iB     \r\n"
				+ "    iB                        YB     \r\n"
				+ "    :B                        vB     \r\n"
				+ "    iB                        rB     \r\n"
				+ "    :BsUU52IU52IU525IIIIUI251jBB     \r\n"
				+ "                                        ");
		System.out.println("=================================================");
		System.out.println("           문화 생활 기록 관리 시스템");
		System.out.println("=================================================");



	}

	/*
	 * 서브타이틀을 출력해주는 메소드입니다
	 * @author주혜원
	 */
	public static void subtitle() {
		System.out.println("[1.로그인]");
		System.out.println("[2.회원가입]");
		System.out.println("[3.계정찾기]");
		System.out.println("[4.비회원모드 로그인]");
		System.out.println("[5.프로그램 종료]");
	}



}
