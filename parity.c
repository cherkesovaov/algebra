#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n;
    scanf("%d",&n);
    int A[n];
    int i;
    int c;
    int p;
    p=0;
    for(i=0;i<n;i++){
        scanf("%d",&A[i]);
    }
    i=0;
    while(i<n){
        if(A[i]==i+1){
            i++;
        }
        else{
            c=A[A[i]-1];
            A[A[i]-1]=A[i];
            A[i]=c;
            p++;
        }
    }
    if(p%2){
        printf("Odd");
    }
    else{
        printf("Even");
    }
    return 0;
}
