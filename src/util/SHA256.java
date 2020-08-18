package util;

import java.security.MessageDigest;

public class SHA256 {

	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
		
		try {
			//salt라는 것을 이용해 악의적인 해킹을 방지
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] salt = "Hello! This is Salt".getBytes();	//단순하게 sha 256을 적용하면 보안에 위협이 되므로 salt값을 적용
			digest.reset();
			//salt값을 적용
			digest.update(salt);
			//배열변수를 만들어 인코딩
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			//실재 해시로 적용한 값을 캐릭터 변수로 담아주고 문자열 형태로 만들어줌
			for(int i=0; i<chars.length; i++) {
				//oxff핵스 값과 현재 해시값을 적용한 캐릭터의 해당 인덱스를 &연산을 적용해
				//한지리수면 0을 더해 두자리로 만든다
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length() == 1) {
					result.append('0');
					result.append(hex);
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
}
