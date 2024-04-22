import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class Problem4Test {

    @Test
    void billigsteTastatur1() {
        int[] keyboards = {5, 7, 8, 10, 33};
        int[] usbDrives = {7, 4, 22, 3};
        Problem4 shop = new Problem4(usbDrives, keyboards);
        int expectedOutput = 5;
        int output = Problem4.billigsteTastatur(shop);
        assertEquals(expectedOutput, output);
        System.out.println("Problem4- billigsteTastatur Test1 successful");
    }
    @Test
    void billigsteTastatur2() {
        int[] keyboards = {5, 7, 8, 10, 33};
        int[] usbDrives = {7, 4, 22, 3};
        Problem4 shop = new Problem4(usbDrives, keyboards);
        int falseOutput = 7;
        int output = Problem4.billigsteTastatur(shop);
        assertNotEquals(falseOutput, output);
        System.out.println("Problem4- billigsteTastatur Test1 successful");
    }

    @Test
    void teuersteGegenstand1() {
        int[] keyboards = {5, 7, 8, 10, 33};
        int[] usbDrives = {7, 4, 22, 3, 66};
        Problem4 shop = new Problem4(usbDrives, keyboards);
        int expectedOutput = 66;
        int output = Problem4.teuersteGegenstand(shop);
        assertEquals(expectedOutput, output);
        System.out.println("Problem4- teuersteGegenstand Test1 successful");
    }
    @Test
    void teuersteGegenstand2() {
        int[] keyboards = {5, 7, 8, 10, 33};
        int[] usbDrives = {7, 4, 22, 3, 66};
        Problem4 shop = new Problem4(usbDrives, keyboards);
        int falseOutput = 33;
        int output = Problem4.teuersteGegenstand(shop);
        assertNotEquals(falseOutput, output);
        System.out.println("Problem4- teuersteGegenstand Test2 successful");
    }

    @Test
    void teuersteUsbLaufwerk1() {
        int[] keyboards = {5, 7, 8, 10, 33};
        int[] usbDrives = {7, 4, 22, 3, 66};
        Problem4 shop = new Problem4(usbDrives, keyboards);
        int expectedOutput = 22;
        int output = Problem4.teuersteUsbLaufwerk(shop, 40);
        assertEquals(expectedOutput, output);
        System.out.println("Problem4- teuersteUsbLaufwerk Test1 successful");
    }
    @Test
    void teuersteUsbLaufwerk2() {
        int[] keyboards = {5, 7, 8, 10, 33};
        int[] usbDrives = {7, 4, 22, 3, 66};
        Problem4 shop = new Problem4(usbDrives, keyboards);
        int falseOutput = 66;
        int output = Problem4.teuersteUsbLaufwerk(shop, 40);
        assertNotEquals(falseOutput, output);
        System.out.println("Problem4- teuersteUsbLaufwerk Test2 successful");
    }

    @Test
    void geldbetrag1() {
        int[] keyboards = {5, 7, 8, 10, 33};
        int[] usbDrives = {6, 10, 22, 3};
        Problem4 shop = new Problem4(usbDrives, keyboards);
        int expectedOutput = 39;
        int output = Problem4.geldbetrag(shop, 40);
        assertEquals(expectedOutput, output);
        System.out.println("Problem4- geldbetrag Test1 successful");
    }
    @Test
    void geldbetrag2() {
        int[] keyboards = {5, 7, 8, 10, 33};
        int[] usbDrives = {6, 10, 22, 3};
        Problem4 shop = new Problem4(usbDrives, keyboards);
        int falseOutput = 55;
        int output = Problem4.geldbetrag(shop, 40);
        assertNotEquals(falseOutput, output);
        System.out.println("Problem4- geldbetrag Test2 successful");
    }
}