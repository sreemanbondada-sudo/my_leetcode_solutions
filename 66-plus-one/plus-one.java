class Solution {
    public int[] plusOne(int[] digits) {
        int n;
        n = digits.length;
        int i;
        for(i=n-1;i>=0;i--){
            if(digits[i]<9){
                digits[i]++;
                return digits;
            }
            digits[i]=0;
        }
        int[] result = new int[n+1];
        result[0] = 1;
        return result;
    }
}