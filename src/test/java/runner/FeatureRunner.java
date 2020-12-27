package runner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


class FeatureRunner {


    /****
     * Below example explains different way in which tags can be supported -
     * @tag1,@tag2 - anyOf('@tag1','@tag2')
     * @tag1+@tag2 - anyOf('@tag1') && anyOf('@tag2')
     * @tag1+@tag2+~tag3 - anyOf('@tag1') && anyOf('@tag2') && not('tag3')
     * @tag1,@tag2+~tag3 - anyOf('@tag1','@tag2') && not('tag3')
     ****/

    @Test
    public void testRunner() {
        System.setProperty("karate.env", "qa");
        Results results = Runner.path("classpath:features").tags("@addition").parallel(5);
        System.out.println("Total features running: " + results.getFeatureCount());
        System.out.println("Total scenario run: " + results.getScenarioCount());
        System.out.println("Total failed scenario : " + results.getFailCount());
        generateReport(results.getReportDir());
    }


    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "qa");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}
