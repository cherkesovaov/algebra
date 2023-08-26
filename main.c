#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


int main()
{
    FILE *file, *data, *ans, *output, *table,*names;
    char* path="C:/Users/Olga/Desktop/progs/data/SC/SC/sc_6_1";
    //char* name="tsp_51_1";
    file=fopen(path,"r");
    int N,M;
    int i,j;
    int r,num;
    char* str;
    char string[2*N+1];
    fscanf(file,"%d %d",&N,&M);
    int c[M],S[M][N];
    for(i=0;i<M;i++){
        c[i]=0;
        for(j=0;j<N;j++){
            S[i][j]=0;
        }
    }
    for(i=0;i<M;i++){
        //printf("WEEEEEE\n");
        fscanf(file,"%d",&c[i]);
        str=fgets(string,2*N+1,file);
        ans=fopen("C:/Users/Olga/Desktop/progs/data/SC/SC/ans","w+");
        //printf("%s\n",string);
        fprintf(ans,"%s",string);
        fclose(ans);
        num=0;
        for(j=0;j<strlen(string);j++){
            if(isdigit(string[j])){
            //if(string[j]==" ")
                num++;
            }
        }
        ans=fopen("C:/Users/Olga/Desktop/progs/data/SC/SC/ans","r");
        for(j=0;j<num;j++){
            fscanf(ans,"%d",&r);
            S[i][r]=1;
        }
        //printf("WEEEEEE\n");
        fclose(ans);
        //printf("WEEEEEE\n");
        //free(str);
        //printf("WEEEEEE\n");
        //free(string);
        remove("C:/Users/Olga/Desktop/progs/data/SC/SC/ans");
        //printf("WEEEEEE\n");
    }


    data=fopen("C:/Users/Olga/Desktop/progs/data/SC/SC/data.dzn","w+");
    fprintf(data,"n=");
    fprintf(data,"%d",N);
    fprintf(data,";");
    fprintf(data,"\n");
    fprintf(data,"m=");
    fprintf(data,"%d",M);
    fprintf(data,";");
    fprintf(data,"\n");
    fprintf(data,"cost=[ ");
    //fprintf(data,"\n");
    for(i=0;i<M-1;i++){
        fprintf(data,"%d",c[i]);
        fprintf(data," , ");
    }
    fprintf(data,"%d",c[M-1]);
    //fprintf(data,"|");
    fprintf(data,"];");
    fprintf(data,"\n");
    fprintf(data,"S=[| ");
    for(i=0;i<M;i++){
        fprintf(data,"\n");
        for(j=0;j<N-1;j++){
           fprintf(data,"%d",S[i][j]);
           fprintf(data," , ");
        }
        fprintf(data,"%d",S[i][N-1]);
        fprintf(data,"|");
    }
    fprintf(data,"];");
    fclose(data);
    fclose(file);
    return 0;
}
