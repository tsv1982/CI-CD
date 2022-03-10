import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class MainTest {
    @Test
    void calculate() {
        assertEquals(9, new Main().calculate(4,5));

    }
}