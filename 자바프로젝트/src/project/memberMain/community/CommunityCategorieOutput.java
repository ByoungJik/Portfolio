package project.memberMain.community;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;

/**
 * 커뮤니티의 전체적인 레이아웃과 관련된 클래스입니다.
 * @author 정병직
 */
public class CommunityCategorieOutput {

	/**
	 * (회원용)카테고리 값(category)과 해당 카테고리의 클래스 배열(list)을 받아 TOP5를 출력시켜주는 메소드입니다.
	 * @param category 카테고리 값
	 * @param list 카테고리 데이터 배열
	 * @author 정병직
	 */
	public static void CommunityCategorieMenu(String category, ArrayList<CategorySetClass> list) {
		System.out.println();
		System.out.println();
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.printf("                [%s] 최신 개봉작 TOP5\n", category);
		System.out.printf("1.%s 2.%s 3.%s 4.%s 5.%s\n"
									, list.get(0).getName()
									, list.get(1).getName()
									, list.get(2).getName()
									, list.get(3).getName()
									, list.get(4).getName());
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("1. 장르별 보기");
		System.out.println("2. 현재 상영작 보기");
		System.out.println("3. 비슷한 취향 작품 보기");
		System.out.println("4. 작품 검색 보기");
		System.out.println("5. [커뮤니티] 돌아가기");
	}
	
	/**
	 * (비회원용)카테고리 값(category)과 해당 카테고리의 클래스 배열(list)을 받아 TOP5를 출력시켜주는 메소드입니다.
	 * @param category 카테고리 값
	 * @param list 카테고리 데이터 배열
	 * @author 정병직
	 */
	public static void nonCommunityCategorieMenu(String category, ArrayList<CategorySetClass> list) {
		System.out.println();
		System.out.println();
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.printf("                [%s] 최신 개봉작 TOP5\n", category);
		System.out.printf("1.%s 2.%s 3.%s 4.%s 5.%s\n"
									, list.get(0).getName()
									, list.get(1).getName()
									, list.get(2).getName()
									, list.get(3).getName()
									, list.get(4).getName());
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("1. 장르별 보기");
		System.out.println("2. 현재 상영작 보기");
		System.out.println("3. 작품 검색");
		System.out.println("4. 비회원 메인 메뉴로 돌아가기");
		System.out.print("입력 : ");
	}
	
	/**
	 * 장르별 보기 메뉴를 출력해주는 메소드입니다.
	 * @author 정병직
	 */
	public static void CommunityGenreMenu() {
		System.out.println();
		System.out.println();
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("                 장르별 보기");
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("1. 액션");
		System.out.println("2. 드라마");
		System.out.println("3. 멜로");
		System.out.println("4. 스릴러");
		System.out.println("5. 코믹");
		System.out.println("6. 다큐멘터리");
		System.out.println("7. 애니메이션");
		System.out.println("8. 공포");
		System.out.println("9. [카테고리 선택] 돌아가기");
		System.out.print("입력 : ");
	}
	
	/**
	 * 로그인한 회원의 관심 리스트(tasteList)와 장르 선택 메뉴창을 출력해주는 메소드입니다.
	 * @param tasteList 관심 장르 리스트
	 * @author 정병직
	 */
	public static void CommunityTasteMenu(ArrayList<String> tasteList) {
		System.out.println();
		System.out.println();
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("                관심 장르 리스트");
		System.out.printf("             %s\n",tasteList.toString());
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("1. 장르 선택");
		System.out.println("2. 새로운 장르 추천");
		System.out.println("3. [카테고리 선택] 돌아가기");
		System.out.print("입력 : ");
	}
	
	/**
	 * 로그인한 회원의 관심 장르 외 타 장르(newGenre) 선택 메뉴창을 출력해주는 메소드입니다.
	 * @param newGenre 타 장르 리스트
	 * @author 정병직
	 */
	public static void CommunitynewGenreMenu(HashSet<String> newGenre) {
		System.out.println();
		System.out.println();
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("               새로운 장르 리스트");
		System.out.printf("   %s\n",newGenre.toString());
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("1. 장르 선택");
		System.out.println("2. [관심 장르] 돌아가기");
		System.out.print("입력 : ");
	}
	
	/**
	 * 장르를 입력하는 화면을 출력해주는 메소드입니다.
	 * @author 정병직
	 */
	public static void tasteSelectprint() {
		System.out.println();
		System.out.println();
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("장르를 입력해주세요.");
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.print("입력 : ");
	}
	
	/**
	 * 선택한 장르(tasteList)와 유저가 선택한 장르의 작품 배열(userTasetSelectList)을 출력해주는 메소드입니다.
	 * methodName은 상위 메소드로 돌아가기 위한 변수입니다.
	 * @param tasteList 선택한 장르
	 * @param userTasetSelectList 선택 장르의 작품 배열
	 * @param methodName 상위 메소드 이름
	 * @author 정병직
	 */
	public static void CommunityUserTasteMenu(String tasteList, ArrayList<String> userTasetSelectList, String methodName) {
		System.out.println();
		System.out.println();
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.printf("                  [%s] TOP5\n", tasteList);
		System.out.printf("1.%s 2.%s 3.%s 4.%s 5.%s\n"
				, userTasetSelectList.get(0)
				, userTasetSelectList.get(1)
				, userTasetSelectList.get(2)
				, userTasetSelectList.get(3)
				, userTasetSelectList.get(4));
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("1. 작품 선택");
		if (methodName.equals("tasteSelect")) {
			System.out.println("2. [관심 장르] 돌아가기");
		} else if (methodName.equals("genreView")) {
			System.out.println("2. [장르별 보기] 돌아가기");
		}
		System.out.print("입력 : ");
	}
	
	
	/**
	 * 선택한 작품(n)의 상세정보를 출력해주는 메소드입니다.
	 * methodName는 상위 메소드로 돌아가기 위한 변수입니다.
	 * @param n 선택한 작품 클래스
	 * @param methodName 상위 메소드
	 * @author 정병직
	 */
	public static void workInformation(CategorySetClass n, String methodName) {
		System.out.println();
		System.out.println();
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.printf("                  [%s]\n", n.getName());
		System.out.printf("연출 : %s\n", n.getDirector());
		System.out.printf("배우 : %s\n", n.getActer());
		System.out.printf("평점 : %.1f\n", n.getGPA());
		System.out.printf("장르 : %s\n", n.getGenre());
		System.out.printf("개봉일 : %tF\n", n.getReleaseDate());
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("1. 한줄평 모아보기");
		System.out.println("2. 한줄평 작성하기");
		if (methodName.equals("tasteSelect")) {
			System.out.println("3. [비슷한 취향 작품 추천] 돌아가기");
		} else if (methodName.equals("genreView")) {
			System.out.println("3. [장르별 보기] 돌아가기");
		} else if (methodName.equals("genreSelect")) {
			System.out.println("3. [현재 상영작 보기] 돌아가기");
		} else if (methodName.equals("workSeach")) {
			System.out.println("3. [작품 검색] 돌아가기");
		} 
		System.out.print("입력 : ");
		
	}
	
	/**
	 * 현재 상영작 리스트(nowMovieList)를 출력해주는 메소드입니다.
	 * @param nowMovieList
	 * @author 정병직
	 */
	public static void nowMovieMenu(ArrayList<String> nowMovieList) {
		System.out.println("\n");
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("                 현재 상영작 리스트");
		for (int i = 0; i < nowMovieList.size(); i++) {
			System.out.println(nowMovieList.get(i));
		}
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("1. 작품 선택");
		System.out.println("2. [카테고리] 돌아가기");
		System.out.print("입력 : ");
	}

	
	/**
	 * 작품 검색 메뉴창을 출력해주는 메소드입니다.
	 * @author 정병직
	 */
	public static void tasteSeach() {
		System.out.println("\n");
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("                  작품 검색");
		System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
		System.out.println("1. 작품 검색");
		System.out.println("2. 연출자 검색");
		System.out.println("3. 배우 검색");
		System.out.println("4. [카테고리 선택] 돌아가기");
		System.out.print("입력 : ");
	}
}

























