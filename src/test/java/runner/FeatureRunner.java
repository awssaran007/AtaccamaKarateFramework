package runner;

import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

class FeatureRunner {

    @Karate.Test

/***to run command line
 * mvn test -Dtest=CatsRunner
 *
 * Below example explains different way in which tags can be supported -
 * @tag1,@tag2 - anyOf('@tag1','@tag2')
 * @tag1+@tag2 - anyOf('@tag1') && anyOf('@tag2')
 * @tag1+@tag2+~tag3 - anyOf('@tag1') && anyOf('@tag2') && not('tag3')
 * @tag1,@tag2+~tag3 - anyOf('@tag1','@tag2') && not('tag3')
 */

    Karate testFeature() {
        System.setProperty("tags", "@add+~@ignore");
        System.setProperty("karate.env","qa");
        return Karate.run("classpath:features/").relativeTo(getClass());
    }

}
