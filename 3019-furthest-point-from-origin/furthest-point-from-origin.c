int furthestDistanceFromOrigin(char* moves) {
   int L = 0, R = 0, underscore = 0;
    for (int i = 0; moves[i] != '\0'; i++) {
        if (moves[i] == 'L') L++;
        else if (moves[i] == 'R') R++;
        else if (moves[i] == '_') underscore++;
    }
    int u;
    int diff = L - R;
    if (diff < 0) diff = -diff; // absolute value
    return diff + underscore;
}