package DemoKarate.feature;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class writeDataToFile {
    public static void writeData(String arg) throws FileNotFoundException, UnsupportedEncodingException {
        PrintWriter writer = new PrintWriter("data.json", "UTF-8");
        writer.println(arg);
        writer.close();
    }


}
