package project.managereMode;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;


/**
 * 블랙리스트 텍스트 파일과 컬렉션의 상호작용과 관련된 클래스입니다.
 * 
 * @author 주혜원
 */
public class BlacklistData {
	public static ArrayList<BlackList> blist = new ArrayList<BlackList>();


	/**
	 * 블랙리스트의 텍스트 파일을 ArrayList에 옮기는 메소드입니다.
	 * @author 주혜원
	 */
	public static void loadBlacklist() {


		try {// 파일 -> 컬렉션에 옮김
			BufferedReader reader = new BufferedReader(new FileReader("data\\블랙리스트\\블랙리스트.txt"));
			String line = "";
			while ((line = reader.readLine()) != null) {
				String temp[] = line.split("■");
				BlackList b = new BlackList(temp[0], temp[1], temp[2], temp[3], temp[4], temp[5],
						temp[6], temp[7], temp[8]);


				blist.add(b);

			}
			reader.close();

		} catch (IOException e) {

			e.printStackTrace();
		}

	}

	/**
	 * ArrayList에 있는 요소를 블랙리스트 텍스트 파일로 옮기는 메소드입니다.
	 * @author 주혜원
	 */
	public static void saveBalcklist() {


		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter("data\\블랙리스트\\블랙리스트.txt"));


			for (BlackList b : blist) {
				String str = String.format("%s■%s■%s■%s■%s■%s■%s■%s■%s■\n", b.getBid(),
						b.getBpassword(), b.getBname(), b.getBbirth(), b.getBgender(), b.getBtel(),
						b.getBfollow(), b.getBgenre(), b.getBschool());

				writer.write(str);

			}
			writer.close();
		} catch (IOException e) {

			e.printStackTrace();
		}


	}
}


