import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class Problem2Test {
    @Test
    void maximaleZahl1() {
        int[] input = {3, 32, 423, 44, 66, 34, 55, 30};
        int expectedOutput = 423;
        int output = Problem2.maximaleZahl(input);
        assertEquals(expectedOutput, output);
        System.out.println("Problem2- maximaleZahl Test1 successful");
    }
    @Test
    void maximaleZahl2() {
        int[] input = {3, 32, 423, 44, 66, 34, 55, 30};
        int falseOutput = 66;
        int output = Problem2.maximaleZahl(input);
        assertNotEquals(falseOutput, output);
        System.out.println("Problem2- maximaleZahl Test2 successful");
    }
    @Test
    void maximaleZahl3() {
        int[] input = {};
        int expectedOutput = Integer.MIN_VALUE;
        int output = Problem2.maximaleZahl(input);
        assertEquals(expectedOutput, output);
        System.out.println("Problem2- maximaleZahl Test3 successful");
    }

    @Test
    void minimaleZahl1() {
        int[] input = {3, 32, 423, 44, 66, 34, 55, 30};
        int expectedOutput = 3;
        int output = Problem2.minimaleZahl(input);
        assertEquals(expectedOutput, output);
        System.out.println("Problem2- minimaleZahl Test1 successful");
    }
    @Test
    void minimaleZahl2() {
        int[] input = {3, 32, 423, 44, 66, 34, 55, 30};
        int falseOutput = 30;
        int output = Problem2.minimaleZahl(input);
        assertNotEquals(falseOutput, output);
        System.out.println("Problem2- minimaleZahl Test2 successful");
    }
    @Test
    void minimaleZahl3() {
        int[] input = {};
        int expectedOutput = Integer.MAX_VALUE;
        int output = Problem2.minimaleZahl(input);
        assertEquals(expectedOutput, output);
        System.out.println("Problem2- minimaleZahl Test3 successful");
    }
    @Test
    void maximaleSumme1() {
        int[] input = {3, 32, 423, 44, 66, 34, 55, 30};
        int expectedOutput = 684;
        int output = Problem2.maximaleSumme(input);
        assertEquals(expectedOutput, output);
        System.out.println("Problem2- maximaleSumme Test1 successful");
    }
    @Test
    void maximaleSumme2() {
        int[] input = {3, 32, 423, 44, 66, 34, 55, 30};
        int falseOutput = 60;
        int output = Problem2.maximaleSumme(input);
        assertNotEquals(falseOutput, output);
        System.out.println("Problem2- maximaleSumme Test2 successful");
    }
    @Test
    void maximaleSumme3() {
        int[] input = {};
        int expectedOutput = Integer.MIN_VALUE;
        int output = Problem2.maximaleSumme(input);
        assertEquals(expectedOutput, output);
        System.out.println("Problem2- maximaleSumme Test3 successful");
    }
    @Test
    void minimaleSumme1() {
        int[] input = {3, 32, 423, 44, 66, 34, 55, 30};
        int expectedOutput = 264;
        int output = Problem2.minimaleSumme(input);
        assertEquals(expectedOutput, output);
        System.out.println("Problem2- minimaleSumme Test1 successful");

    }
    @Test
    void minimaleSumme2() {
        int[] input = {3, 32, 423, 44, 66, 34, 55, 30};
        int falseOutput = 265;
        int output = Problem2.minimaleSumme(input);
        assertNotEquals(falseOutput, output);
        System.out.println("Problem2- minimaleSumme Test2 successful");

    }
    @Test
    void minimaleSumme3() {
        int[] input = {};
        int expectedOutput = Integer.MIN_VALUE;
        int output = Problem2.minimaleSumme(input);
        assertEquals(expectedOutput, output);
        System.out.println("Problem2- minimaleSumme Test3 successful");

    }

}