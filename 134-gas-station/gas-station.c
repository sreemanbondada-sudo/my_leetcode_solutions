int canCompleteCircuit(int* gas, int gasSize, int* cost, int costSize) {
    int total_surplus = 0;
    int current_tank = 0;
    int start_index = 0;
    int i;
    for(i=0;i<gasSize;i++){
        int diff = gas[i]-cost[i];
        total_surplus +=diff;
        current_tank=current_tank+diff;
        if(current_tank<0){
        start_index=i+1;
        current_tank=0;
        }
    }
    return (total_surplus<0)? -1 : start_index;
}