public class Problem4 {
    int[] usbDrives;
    int[] keyboards;

    public int[] getUsbDrives() {
        return usbDrives;
    }
    public void setUsbDrives(int[] usbDrives) {
        this.usbDrives = usbDrives;
    }
    public int[] getKeyboards() {return keyboards;}
    public void setKeyboards(int[] keyboards) { this.keyboards = keyboards;}

    Problem4(int[] usbDrives, int[] keyboards){
        this.keyboards = keyboards;
        this.usbDrives = usbDrives;
    }
    public static int billigsteTastatur(Problem4 shop){
        int minimalKeyboard = Integer.MAX_VALUE;
        for(int keyboard : shop.keyboards){
            if(keyboard < minimalKeyboard) {
                minimalKeyboard = keyboard;
            }
        }
        return minimalKeyboard;
    }

    public static int teuersteGegenstand(Problem4 shop){
        int mostExpensiveObject = Integer.MIN_VALUE;
        for(int keyboard : shop.keyboards){
            if(keyboard > mostExpensiveObject){
                mostExpensiveObject = keyboard;
            }
        }
        for(int usbDrive : shop.usbDrives){
            if(usbDrive > mostExpensiveObject){
                mostExpensiveObject = usbDrive;
            }
        }
        return mostExpensiveObject;
    }

    public static int teuersteUsbLaufwerk(Problem4 shop, int budget){
        int mostExpensiveUsbDrive = Integer.MIN_VALUE;
        for(int usbDrive : shop.usbDrives){
            if(usbDrive > mostExpensiveUsbDrive && usbDrive <= budget){
                mostExpensiveUsbDrive = usbDrive;
            }
        }
        return mostExpensiveUsbDrive;
    }

    public static int geldbetrag(Problem4 shop, int budget){
        int neededKeyboard, neededUsbDrive, moneyAmount = -1;
        for(int keyboard : shop.keyboards){
            for(int usbDrive : shop.usbDrives){
                if(keyboard + usbDrive > moneyAmount && keyboard + usbDrive <budget){
                    moneyAmount = keyboard + usbDrive;
                }
            }
        }
        return moneyAmount;
    }


}