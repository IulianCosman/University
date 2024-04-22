import org.junit.jupiter.api.Test;

import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.*;

class Problem1Test {
    @Test
    void nichtAusreichendeNoten1() {
        int[] input = {33, 55, 45, 34, 99, 32, 55};
        int[] expectedOutput = {33, 34, 32};
        int[] output = Problem1.nichtAusreichendeNoten(input);
        assertArrayEquals(expectedOutput, output);
        System.out.println("Problem1- nichtAusreichendeNoten Test1 successful");
    }
    @Test
    void nichtAusreichendeNoten2() {
        int[] input = {63, 55, 45, 54, 99, 72, 55};
        int[] expectedOutput = {};
        int[] output = Problem1.nichtAusreichendeNoten(input);
        assertArrayEquals(expectedOutput, output);
        System.out.println("Problem1- nichtAusreichendeNoten Test2 successful");
    }

    @Test
    void nichtAusreichendeNote3() {
        int[] input = {33, 55, 45, 34, 99, 32, 55};
        int[] falseOutput = {45, 55};
        int[] output = Problem1.nichtAusreichendeNoten(input);
        assertFalse(Arrays.equals(falseOutput, output));
        System.out.println("Problem1- nichtAusreichendeNoten Test3 successful");
    }
    @Test
    void durchschnittswert1() {
        int[] input = {33, 55, 45, 34, 99, 32, 55};
        double expectedOutput = 50.42857142857143;
        double output = Problem1.durchschnittswert(input);
        assertEquals(expectedOutput, output);
        System.out.println("Problem1- durchschnittswert Test1 successful");
    }
    @Test
    void durchschnittswert2() {
        int[] input = {33, 55, 45, 34, 99, 32, 55};
        double falseOutput = 40.42857142857143;
        double output = Problem1.durchschnittswert(input);
        assertNotEquals(falseOutput, output);
        System.out.println("Problem1- durchschnittswert Test2 successful");
    }
    @Test
    void durchschnittswert3() {
        int[] input = {};
        double expectedOutput = 0;
        double output = Problem1.durchschnittswert(input);
        assertNotEquals(expectedOutput, output);
        System.out.println("Problem1- durchschnittswert Test3 successful");
    }

    @Test
    void abgerundeteNoten1() {
        int[] input = {33, 55, 45, 34, 99, 32, 55, 58};
        int[] expectedOutput = {33, 55, 45, 34, 100, 32, 55, 60};
        int[] output = Problem1.abgerundeteNoten(input);
        assertArrayEquals(expectedOutput, output);
        System.out.println("Problem1- abgerundeteNoten Test1 successful");
    }

    @Test
    void abgerundeteNoten2() {
        int[] input = {33, 55, 45, 34, 99, 32, 55, 58};
        int[] falseOutput = {33, 55, 45, 34, 99, 32, 55, 58};
        int[] output = Problem1.abgerundeteNoten(input);
        assertFalse(Arrays.equals(falseOutput,output));
        System.out.println("Problem1- abgerundeteNoten Test2 successful");
    }
    @Test
    void abgerundeteNoten3() {
        int[] input = {};
        int[] expectedOutput = {} ;
        int[] output = Problem1.abgerundeteNoten(input);
        assertArrayEquals(expectedOutput, output);
        System.out.println("Problem1- abgerundeteNoten Test3 successful");
    }
}
