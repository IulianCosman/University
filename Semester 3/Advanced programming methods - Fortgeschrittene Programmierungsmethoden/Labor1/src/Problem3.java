public class Problem3 {

    public static int[] summe(int[] number1, int[] number2){
        int[] sum = new int[number1.length];
        int carriedOver = 0;
        for(int i = number1.length - 1; i >= 0; i--){
            sum[i] = number1[i] + number2[i] + carriedOver;
            carriedOver = sum[i] / 10;
            sum[i] = sum[i] % 10;
        }
        if(carriedOver > 0){
            int[] newSum = new int[number1.length + 1];
            for(int i = 1; i <= number1.length; i++){
                newSum[i] = sum[i-1];
            }
            newSum[0] = carriedOver;
            return newSum;
        }
        return sum;
    }

    public static int[] differenz(int[] number1, int[] number2){
        int[] subtraction = new int[number1.length];
        int carriedOver = 0;
        boolean firstBigger = false;
        int cnt = 0;
        while(number1[cnt] == number2[cnt] && cnt < number1.length-1){
            cnt++;
        }
        if(number1[cnt] > number2[cnt]){
            firstBigger = true;
        }
        for(int i = number1.length - 1; i >= 0; i--){
            if(firstBigger) {
                subtraction[i] = number1[i] - number2[i] - carriedOver;
            }
            else{
                subtraction[i] = number2[i] - number1[i] - carriedOver;
            }
            if(subtraction[i] < 0){
                subtraction[i] += 10;
                carriedOver = 1;
            }
            else{
                carriedOver = 0;
            }
        }
        if(subtraction[0] == 0){
            int numberOfZeros = 1;
            while(subtraction[numberOfZeros] == 0){
                numberOfZeros++;
            }
            int[] newSubtraction = new int[number1.length - numberOfZeros];
            for(int i = numberOfZeros; i < number1.length; i++){
                newSubtraction[i-numberOfZeros] = subtraction[i];
            }
            return newSubtraction;
        }
        return subtraction;
    }

    public static int[] multiplikation(int[] number1, int number2){
        if(number2 == 0){
            int[] zero = {0};
            return zero;
        }
        int[] product = new int[number1.length];
        int carriedOver = 0;
        for(int i = number1.length - 1; i >= 0; i--){
            product[i] = number1[i] * number2;
            product[i] += carriedOver;
            carriedOver = product[i] / 10;
            product[i] = product[i] % 10;
        }
        if(carriedOver != 0){
            int[] newProduct = new int[number1.length + 1];
            for(int i = 1; i <= number1.length; i++){
                newProduct[i] = product[i-1];
            }
            newProduct[0] = carriedOver;
            return newProduct;
        }
        return product;
    }

    public  static int[] division(int[] number1, int number2){
        if(number2 == 0){
            int[] notOk = {};
            return notOk;
        }
        int[] division = new int[number1.length];
        int carriedOver = 0;
        for(int i = 0; i < number1.length; i++){
            division[i] = (number1[i] + carriedOver * 10) / number2;
            if((number1[i] + carriedOver * 10) % number2 != 0){
                carriedOver = (number1[i] + carriedOver * 10) % number2;
            }
            else{
                carriedOver = 0;
            }
        }
        if(division[0] == 0){
            int[] newDivision = new int[number1.length - 1];
            for(int i = 0; i < number1.length - 1; i++){
                newDivision[i] = division[i+1];
            }
            return newDivision;
        }
        return division;
    }

}