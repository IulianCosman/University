import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class Problem3Test {

    @Test
    void summe1() {
        int[] number1 = {3, 4, 5, 3, 4, 8, 9, 0};
        int[] number2 = {5, 2, 3, 2, 6, 4, 9, 7};
        int[] expectedOutput = {8, 6, 8, 6, 1, 3, 8, 7};
        int[] output = Problem3.summe(number1, number2);
        assertArrayEquals(expectedOutput, output);
        System.out.println("Problem3- summe Test1 successful");
    }
    @Test
    void summe2() {
        int[] number1 = {9, 4, 5, 3, 4, 8, 9, 0};
        int[] number2 = {9, 2, 3, 2, 6, 4, 9, 7};
        int[] expectedOutput = {1, 8, 6, 8, 6, 1, 3, 8, 7};
        int[] output = Problem3.summe(number1, number2);
        assertArrayEquals(expectedOutput, output);
        System.out.println("Problem3- summe Test2 successful");
    }
    @Test
    void differenz1() {
        int[] number1 = {7, 4, 5, 3, 4, 8, 9, 9};
        int[] number2 = {5, 2, 3, 2, 6, 4, 9, 7};
        int[] expectedOutput = {2, 2, 2, 0, 8, 4, 0, 2};
        int[] output = Problem3.differenz(number1, number2);
        assertArrayEquals(expectedOutput, output);
        System.out.println("Problem3- differenz Test1 successful");
    }
    @Test
    void differenz2() {
        int[] number1 = {7, 4, 5, 3, 4, 8, 9, 9};
        int[] number2 = {7, 2, 3, 2, 1, 2, 7, 8};
        int[] expectedOutput = {2, 2, 1, 3, 6, 2, 1};
        int[] output = Problem3.differenz(number1, number2);
        assertArrayEquals(expectedOutput, output);
        System.out.println("Problem3- differenz Test1 successful");
    }

    @Test
    void multiplikation1() {
        int[] number1 = {7, 4, 5, 3, 4, 8, 9, 9};
        int number2 = 2;
        int[] expectedOutput = {1, 4, 9, 0, 6, 9, 7, 9, 8};
        int[] output = Problem3.multiplikation(number1, number2);
        assertArrayEquals(expectedOutput,output);
        System.out.println("Problem3- multiplikation Test1 successful");
    }
    @Test
    void multiplikation2() {
        int[] number1 = {7, 4, 5, 3, 4, 8, 9, 9};
        int number2 = 9;
        int[] expectedOutput = {6, 7, 0, 8, 1, 4, 0, 9, 1};
        int[] output = Problem3.multiplikation(number1, number2);
        assertArrayEquals(expectedOutput,output);
        System.out.println("Problem3- multiplikation Test2 successful");
    }
    @Test
    void multiplikation3() {
        int[] number1 = {7, 4, 5, 3, 4, 8, 9, 9};
        int number2 = 0;
        int[] expectedOutput = {0};
        int[] output = Problem3.multiplikation(number1, number2);
        assertArrayEquals(expectedOutput,output);
        System.out.println("Problem3- multiplikation Test2 successful");
    }


    @Test
    void division1() {
        int[] number1 = {2, 8, 3, 9, 3, 9, 5};
        int number2 = 3;
        int[] expectedOutput = {9, 4, 6, 4, 6, 5};
        int[] output = Problem3.division(number1, number2);
        assertArrayEquals(expectedOutput,output);
        System.out.println("Problem3- division Test1 successful");
    }
    @Test
    void division2() {
        int[] number1 = {8, 0, 6, 0, 4};
        int number2 = 9;
        int[] expectedOutput = {8, 9, 5, 6};
        int[] output = Problem3.division(number1, number2);
        assertArrayEquals(expectedOutput,output);
        System.out.println("Problem3- division Test2 successful");
    }
    @Test
    void division3() {
        int[] number1 = {2, 8, 3, 9, 3, 9, 5};
        int number2 = 0;
        int[] expectedOutput = {};
        int[] output = Problem3.division(number1, number2);
        assertArrayEquals(expectedOutput,output);
        System.out.println("Problem3- division Test3 successful");
    }
}