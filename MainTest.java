import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeAll;

class MainTest {

    @BeforeAll
    public static void BeforeClass(){System.out.println("TEST TEST TEST");}
    

    @Test
    void calculate() {
        assertEquals(9, new Main().calculate(4,5));

    }
}