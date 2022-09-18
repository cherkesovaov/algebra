#include <stdio.h>
#include <stdlib.h>

int main()//C=BA
{
    int n;
    scanf("%d",&n);
    int A[n],B[n],C[n];
    int i;
    for(i=0;i<n;i++){
        scanf("%d",&A[i]);
    }
    for(i=0;i<n;i++){
        scanf("%d",&B[i]);
    }
    for(i=0;i<n;i++){
        C[i]=B[A[i]-1];
    }
    for(i=0;i<n;i++){
        printf("%d ",C[i]);
    }
    return 0;
}
