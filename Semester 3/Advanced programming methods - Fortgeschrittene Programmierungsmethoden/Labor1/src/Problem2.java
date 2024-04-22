public class Problem2 {

    public static int maximaleZahl(int[] array){
        int maximalNumber = Integer.MIN_VALUE;
        for(int element : array){
            if(element > maximalNumber){
                maximalNumber = element;
            }
        }
        return maximalNumber;
    }

    public static int minimaleZahl(int[] array){
        int minimalNumber = Integer.MAX_VALUE;
        for(int element : array){
            if(element < minimalNumber){
                minimalNumber = element;
            }
        }
        return minimalNumber;
    }

    public static int maximaleSumme(int[] array){
        if(array.length == 0){
            return Integer.MIN_VALUE;
        }
        int sum = 0;
        for(int element : array){
            sum += element;
        }
        return sum - minimaleZahl(array);
    }

    public static int minimaleSumme(int[] array){
        if(array.length == 0){
            return Integer.MIN_VALUE;
        }
        int sum = 0;
        for(int element : array){
            sum += element;
        }
        return sum - maximaleZahl(array);
    }

}