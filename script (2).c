#include <stdio.h>

#define C_N 100
#define C_M 100

void second_function(int N, int M, int x[C_N][C_M]) {
    for (int i = 0; i < N-1; i++) {
        for (int j = 0; j < M-1; j++) {
            x[i][j] = (i+j) % 2;
        }
    }
    for (int i = 0; i < N-1; i++) {
        for (int j = 0; j < M-1; j++) {
            x[i][j] = x[i][j] + 1;
        }
    }
}

int main() {
    int x[C_N][C_M];
    second_function(C_N, C_M, x);
    return 0;
}
