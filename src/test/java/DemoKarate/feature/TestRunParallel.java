package DemoKarate.feature;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

import com.intuit.karate.core.ScenarioResult;
import org.junit.Assert;
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
        //Assert.assertEquals(results.getFailCount(), results.getErrorMessages());
        List<ScenarioResult> res = new ArrayList<ScenarioResult>();
        res = results.getScenarioResults();
        try {
            BufferedWriter fw = new BufferedWriter(new FileWriter("Karate_feature_files.txt")) ;
            for(ScenarioResult abc : res){
                fw.write(abc.getScenario().getFeature().getResource().getPackageQualifiedName());
                //fw.write(System.getProperty("line.seperator"));
                //fw.write("   ---   ");
                fw.newLine();
                System.out.println("--->"+abc.getScenario().getFeature().getResource().getPackageQualifiedName());

            }
            fw.flush();
            fw.close();
        }catch (IOException e){
            e.printStackTrace();
        }

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
