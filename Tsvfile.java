// Importing required java packages
import java.io.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

public class Tsvfile{
    public static void main(String[] arg) throws Exception {
        PrintWriter pw = new PrintWriter(new File("test.csv")); // Prints output text stream to the file
        StringBuilder sb = new StringBuilder(); // Used to append or insert and form a string
        int i =0;
        //Reading and storing column names
        Scanner s1 = new Scanner(new File("column_headers.tsv")); // Open column names file
        String headers = s1.nextLine(); // Read the names from file
        String[] names= headers.split("\t", -1); // Split at tab space
        for (String b : names) {
            //System.out.println(b);
            String temp = "\"" + b + "\"";
            sb.append(temp);
            sb.append(',');
        }
        sb.append('\n');
        pw.write(sb.toString()); // Writing to csv file
        sb = new StringBuilder(); // Reinitialize
        //Reading and storing data rows
        Scanner s = new Scanner(new File("sample_1000.tsv"));
        while (s.hasNextLine()) {
            String line = s.nextLine(); // Read the names from file
            i++;
            String[] items= line.split("\t", -1); // Split at tab space
            sb = new StringBuilder(); // Reinitialize   
            
            //int j = 0;         
            for (String a : items) {
                //System.out.println(a);
                // According to CSV specifications, to store a string containing single double quote, we need to use two double quotes
                a = a.replace("\"", "\"\""); 
                String temp = "\"" + a + "\"";
                sb.append(temp);
                sb.append(',');
            }
            sb.append('\n');
            //System.out.println("Length of array =" + items.length);
            pw.write(sb.toString()); // Writing to csv file
            System.out.println("Line : " + i); // Count of lines
        }
        pw.close(); // Close printwriter
        s.close(); // Close scanner
        s1.close(); // Close scanner
        System.out.println("\nEnd of Program");
    }
}