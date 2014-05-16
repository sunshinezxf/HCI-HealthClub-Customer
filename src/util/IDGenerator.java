package util;

public class IDGenerator {
	private final static int LENGTH = 5;
	private final static int PERSON_NO = 8;

	public static String generateSGVIP() {
		return "SG" + generateCode(LENGTH);
	}

	public static String generateHMVIP() {
		return "HM" + generateCode(LENGTH);
	}

	public static String generateUsername() {
		return generateUsername(PERSON_NO);
	}

	private static String generateCode(int length) {
		char[] temp = new char[length];
		for (int i = 0; i < length; i++) {
			temp[i] = Random.generate();
		}
		return new String(temp);
	}

	private static String generateUsername(int length) {
		char[] temp = new char[length];
		for (int i = 0; i < length; i++) {
			temp[i] = Random.generate_id();
		}
		return new String(temp);
	}
}
