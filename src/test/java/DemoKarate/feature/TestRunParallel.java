package DemoKarate.feature;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import net.masterthought.cucumber.ReportParser;
import static org.junit.Assert.*;
import com.intuit.karate.junit5.Karate;


public class TestRunParallel {
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:DemoKarate").tags("~@ignore").parallel(5);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());

    }

    /**
     * generateReportMethod
     * @param karateOutputPath
     */
    public static void generateReport(String karateOutputPath){

        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonpaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonpaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Karate_Intellij");
        ReportBuilder reportBuilder = new ReportBuilder(jsonpaths, config);
        reportBuilder.generateReports();
    }

}
