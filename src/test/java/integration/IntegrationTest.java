package integration;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class IntegrationTest {
	
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:integration").parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
        
        // mvn test -Dkarate.options="--tags @operaciones"
    }
}
