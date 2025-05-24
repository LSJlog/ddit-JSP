import java.util.ArrayList;
import java.util.Scanner;

public class Test1 {
	public static <E> void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		ArrayList<String> list = new ArrayList<String>();
		
		for (int i = 0; i < 4; i++) {
			System.out.println("이름을 입력하세요>> ");
			list.add(sc.nextLine());
		}
		String max = ""; 
		
		for (String s : list) {
			System.out.print(s);
			System.out.println();
			
			if (s.length() > max.length()) {
				max = s;
			}
		}
		
		System.out.println("가장 긴 이름은 : " + max);
		
	}
}
