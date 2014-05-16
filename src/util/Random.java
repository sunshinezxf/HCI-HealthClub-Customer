package util;

public class Random {
	private static final java.util.Random SEED = new java.util.Random();
	private static final char[] code = { '0', '1', '2', '3', '4', '5', '6',
			'7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
			'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
			'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
			'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
			'X', 'Y', 'Z' };
	private static final char[] no = { '0', '1', '2', '3', '4', '5', '6', '7',
			'8', '9' };

	private static int num(int min, int max) {
		return min + SEED.nextInt(max - min);
	}

	public static char generate() {
		return code[num(0, code.length)];
	}

	public static char generate_id() {
		return no[num(0, no.length)];
	}
}
