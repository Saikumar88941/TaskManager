import java.util.*;
import java.io.*;

public class FrequencyTable
{
	public static void main(String[] args) throws FileNotFoundException
	{
		HashMap<String,Integer> freq = new HashMap<String,Integer>();
		Scanner in = new Scanner(new File("words.txt"));
		
		while(in.hasNext())
		{
			String word = in.next();
			Integer count = freq.get(word);
			if(count == null)
			{
				freq.put(word, 1);
			}
			else
			{
				freq.put(word, count + 1);
			}
		}
		System.out.println(freq);
		
		System.out.println("Number of distinct words: " + freq.size());
		
		int maxCount = 0;
		String maxWord = null;
		for(String word: freq.keySet())
		{
			if(freq.get(word) > maxCount)
			{
				maxCount = freq.get(word);
				maxWord = word;
			}
		}
		System.out.println("Most frequently occurring word: " + maxWord);
		
	}
}