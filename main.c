#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

int main()
{
    FILE *file, *data, *ans, *output, *table,*names;
    //names=fopen("C:/Users/Olga/Desktop/progs/data/data/names","r");
    //int iter;
    //for(iter=0;iter<76;iter++){
    //char name[15];
    //fscanf(names,"%s", name);
    //char path[]="C:/Users/Olga/Desktop/progs/data/data/";
    //strcat(path,name);
    //strcat(path,".txt");
    char* path="C:/Users/Olga/Desktop/progs/data/data/tsp_70_1";
    //char* name="tsp_51_1";
    file=fopen(path,"r");
    int i,j,v;
    fscanf(file,"%d",&v);
    double x[v],y[v],d[v][v];
    for(i=0;i<v;i++){
        fscanf(file,"%lf",&x[i]);
        fscanf(file,"%lf", &y[i]);
    }
    for(i=0;i<v;i++){
        for(j=0;j<v;j++){
            d[i][j]=sqrt(pow((x[i]-x[j]),2)+pow((y[i]-y[j]),2));
        }
    }
    data=fopen("C:/Users/Olga/Desktop/progs/data/data/data.dzn","w+");
    fprintf(data,"v=");
    fprintf(data,"%d",v);
    fprintf(data,";");
    fprintf(data,"\n");
    fprintf(data,"d=[| ");
    for(i=0;i<v;i++){
        fprintf(data,"\n");
        for(j=0;j<v-1;j++){
           fprintf(data,"%lf",d[i][j]);
           fprintf(data," , ");
        }
        fprintf(data,"%lf",d[i][v-1]);
        fprintf(data,"|");
    }
    fprintf(data,"];");
    fclose(data);
    fclose(file);
    //system("minizinc --solver Gecode C:/Users/Olga/Desktop/progs/TSP.mzn C:/Users/Olga/Desktop/progs/data/data/data.dzn >C:/Users/Olga/Desktop/progs/data/data/output.log");
    //ans=fopen("C:/Users/Olga/Desktop/progs/data/data/ans","w+");
    //output=fopen("C:/Users/Olga/Desktop/progs/data/data/output.log","r");
    //printf("Done!");
    //int r;
    //double r1;
    //fscanf(output,"[%d, ",&r);
    //fprintf(ans,"%d ",r);
    //for(i=2;i<v+1;i++){
        //fscanf(output,"%d, ",&r);
        //fprintf(ans,"%d ",r);
    //}
    //fscanf(output,"%d]\n",&r);
    //fprintf(ans,"%d\n",r);
    //fscanf(output,"%lf",&r1);
    //fprintf(ans,"%lf",r1);
    //fclose(output);
    //fclose(ans);
    //table=fopen("C:/Users/Olga/Desktop/progs/data/data/table","w+");
    //fprintf(table,"%s",name);
    //fprintf(table,"     %lf\n",r1);
    //}
    return 0;
}
