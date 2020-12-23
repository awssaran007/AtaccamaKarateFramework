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


    /***to run command line
     * mvn test -Dtest=CatsRunner
     *
     * Below example explains different way in which tags can be supported -
     * @tag1,@tag2 - anyOf('@tag1','@tag2')
     * @tag1+@tag2 - anyOf('@tag1') && anyOf('@tag2')
     * @tag1+@tag2+~tag3 - anyOf('@tag1') && anyOf('@tag2') && not('tag3')
     * @tag1,@tag2+~tag3 - anyOf('@tag1','@tag2') && not('tag3')
     *
     *    @Karate.Test
     *     Karate testTags() {
     *         return Karate.run("tags").tags("@second").relativeTo(getClass());
     *
     *         mvn test -Dtest=SampleTest#testTags
     *         mvn test "-Dkarate.options=--tags ~@ignore" -Dtest=AnimalsTest
     *
     *         @KarateOptions(features = "classpath:animals/cats", tags = "~@ignore")
     * // this will run all feature files in 'animals/cats'
     * // except the ones tagged as @ignore
     */

    @Test
    public void testRunner() {
        System.setProperty("karate.env", "qa");
        Results results = Runner.path("classpath:features").tags("@division").parallel(5);
        // Karate.run("classpath:features").tags("@addition").relativeTo(getClass());
        System.out.println("Total features run: " + results.getFeatureCount());
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
