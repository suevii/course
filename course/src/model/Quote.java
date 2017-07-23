package model;

import java.util.Random;

public class Quote {
	public static final String[] sentences = 
		{
		"苟利国家生死以，岂因祸福以避之。",
		"祝同学们学习愉快 ^ ^",
		"孩子们是祖国的花朵。",
		"Stay young, stay simple."}; 
	public static String randomQuote(){
		Random random = new Random();
		int i = random.nextInt(sentences.length);
		String str = sentences[i];
		return str;
	}
}
