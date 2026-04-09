int removeDuplicates(int* nums, int numsSize) {
    if(numsSize==0){
        return 0;
    }
    int i;
    i=0;
    int j;
    for(j=0;j<numsSize;j++){
        if(nums[j]!=nums[i]){
            i=i+1;
            nums[i]=nums[j];
        }

    }
    return i+1;

}