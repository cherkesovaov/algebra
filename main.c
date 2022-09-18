#include <stdio.h>
#include <stdlib.h>

int main() //B=A^(-1)
{
    int n;
    scanf("%d",&n);
    int A[n],B[n];
    int i;
    for(i=0;i<n;i++){
        scanf("%d",&A[i]);
    }
    for(i=0;i<n;i++){
        B[A[i]-1]=i+1;
    }
    for(i=0;i<n;i++){
        printf("%d ",B[i]);
    }
    return 0;
}
