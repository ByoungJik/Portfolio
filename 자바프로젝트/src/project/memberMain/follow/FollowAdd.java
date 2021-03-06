package project.memberMain.follow;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Scanner;
import project.login.userLogin;
import project.memberMain.memOutput;

/**
 * Follow 기능에서 Follow할 유저를 추가하는 기능의 클래스입니다.
 * @author 정병직
 *
 */
public class FollowAdd {
	
	private static String path;
	private static String openUserId;
	private static File dir = new File("data\\마이페이지");
	private static File[] list = dir.listFiles();
	
	/**
	 * Follow 추가의 메뉴창 출력 및 해당 값에 맞춰 이동하기 위한 메소드입니다.
	 * @author 정병직
	 */
	public static void followAdd() {
		
		Scanner scan = new Scanner(System.in);
		memOutput.line(1);
		memOutput.followAddMain();
		System.out.print("입력 : ");
		String input = scan.nextLine();
		
		
		if (input.equals("1")) {
			
			followAddMethod(scan);
			
		} else if (input.equals("2")) {
			
			FollowMain.followMain();
			
		} else {
			memOutput.followBack();
		}
		
	}

	/**
	 * 입력값(inputId)를 통해 Follow를 추가시키기 전 예외처리를 하기 위한 메소드입니다.
	 * @param scan
	 * @author 정병직
	 */
	public static void followAddMethod(Scanner scan) {
		memOutput.line(1);
		System.out.println("Follow할 아이디를 입력하세요.");
		System.out.print("입력 : ");
		String inputId = scan.nextLine();
		memOutput.line(1);
		
		
		openUserId = openUser(inputId);
		
		if (inputId.equals(openUserId)) {
			
			String userPath = null;
			
			for (File d : list) {
				if (d.isDirectory()) {
					if (d.getName().equals(userLogin.id)) {
						userPath = dir + "\\" + d.getName() + "\\following.txt" ;
					}
				}
			}
			
			// 중복 확인
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
				System.out.println("FollowAdd.followAddMethod");
				e.printStackTrace();
			}
			
			// 상대 Follow 여부 확인
			try {
				File file = new File("data\\마이페이지\\" + inputId + "\\info.txt");
				
				if (!file.exists()) {
					try {
						file.createNewFile();
					} catch (Exception e) {
						System.out.println("FollowMain.followMain");
						e.printStackTrace();
					}
				}
				
				BufferedReader reader = new BufferedReader(new FileReader(file));
				
				String line = null;
				
				while ((line = reader.readLine()) != null) {
					line = line.toLowerCase();
					if (line.lastIndexOf("n") > -1) {
						overlap = 3;
					}
				}
				
				reader.close();
			} catch (Exception e) {
				System.out.println("FollowAdd.followAddMethod");
				e.printStackTrace();
			}
			
			if (overlap == 1) {
				memOutput.line(1);
				System.out.println("이미 Follow한 회원입니다.");
				System.out.println("[Follow 추가]로 돌아갑니다.");
				memOutput.line(1);
				followAdd();
			} else if (overlap == 2){
				memOutput.line(1);
				System.out.printf("[%s]는 본인이므로 Follow 추가할 수 없습니다.\n", inputId);
				System.out.println("[Follow 추가]로 돌아갑니다.");
				memOutput.line(1);
				followAdd();
			} else if (overlap == 3){
				memOutput.line(1);
				System.out.printf("[%s]는 Follow를 거부하여 추가할 수 없습니다.\n", inputId);
				System.out.println("[Follow 추가]로 돌아갑니다.");
				memOutput.line(1);
				followAdd();
			} else {
				following(scan, inputId, userPath);
			}
			
		} else if (openUserId.equals("실패")) {
			memOutput.line(1);
			System.out.printf("[%s]를 찾을 수 없습니다.\n", inputId);
			System.out.println("[Follow 추가]로 돌아갑니다.");
			memOutput.line(1);
			followAdd();
		}
	}

	/**
	 * 예외처리 완료 후 (Y/N)을 통하여 본인/상대방 following.txt 파일에 서로 Follow한 아이디를 기입하기 위한 메소드입니다.
	 * @param scan
	 * @param inputId
	 * @param userPath
	 * @author 정병직
	 */
	public static void following(Scanner scan, String inputId, String userPath) {
		System.out.printf("[%s]를 Follow 하시겠습니까?(Y/N)\n", inputId);
		System.out.print("입력 : ");
		if (scan.nextLine().toLowerCase().equals("y")) {
			try {
				// 본인 follow.txt에 상대 id 추가
				BufferedReader reader = new BufferedReader(new FileReader(userPath));
				BufferedWriter writer = new BufferedWriter(new FileWriter(userPath, true));
				
				String line = null;
				int count = 0;
				
				
				while ((line = reader.readLine()) != null) {
					writer.write(inputId);
					writer.newLine();
					count++;
				}
				
				if (count == 0) {
					writer.write(inputId);
					writer.newLine();
				}
				
				writer.close();
				reader.close();
				
				// 상대 follow.txt에 본인 id 추가
				File file = new File("data\\마이페이지\\" + inputId + "\\following.txt");
				
				if (!file.exists()) {
					try {
						file.createNewFile();
					} catch (Exception e) {
						System.out.println("FollowMain.followMain");
						e.printStackTrace();
					}
				}
				
				reader = new BufferedReader(new FileReader(file));
				writer = new BufferedWriter(new FileWriter(file, true));
				
				
				line = null;
				count = 0;
				while ((line = reader.readLine()) != null) {
					writer.write(userLogin.id);
					writer.newLine();
				}
				
				if (count == 0) {
					writer.write(userLogin.id);
					writer.newLine();
				}
				
				writer.close();
				reader.close();
				
				// dm 파일 생성
				path = "data\\DM";
				String DMPath = String.format(path + "\\%s_%s.txt", userLogin.id, inputId);
				File dm = new File(DMPath);
				dm.createNewFile();
				
			} catch (Exception e) {
				System.out.println("FollowAdd.followAdd");
				e.printStackTrace();
			}
		} else if (scan.nextLine().toLowerCase().equals("n")){
			System.out.println("[Follow 추가]로 돌아갑니다.");
			followAdd();
		}
	}

	/**
	 * 상대방이 Follow 공개 여부를 체크하기 위한 메소드입니다.
	 * @param inputId
	 * @return
	 * @author 정병직
	 */
	public static String openUser(String inputId) {
		
		for (File d : list) {
			if (d.isFile()) {
				path = dir + "\\user.txt";
			}
		}
		
		try {
			BufferedReader reader = new BufferedReader(new FileReader(path));
			String line = null;

			while ((line = reader.readLine()) != null) {
				
				String[] userInfo = line.split("■");
				
				if (userInfo[6].toLowerCase().equals("y") && userInfo[0].equals(inputId)) {
					return userInfo[0];
				}
				
			}

			reader.close();
			return "실패";
		} catch (Exception e) {
			System.out.println("FollowAdd.followAdd");
			e.printStackTrace();
		}
		return null;
	}
	
}
