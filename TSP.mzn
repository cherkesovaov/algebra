% Use this editor as a MiniZinc scratch book
include "alldifferent.mzn";
include "gecode.mzn";
include "C:/Users/Olga/Desktop/progs/data/data/data.dzn";
int: v;
array [1..v,1..v] of float: d;
array [1..v+1] of var 1..v: track;
set of int: difrange=1..v;
constraint  track[v+1]=track[1];
constraint forall( [track[i]!=track[j] | i, j in difrange where i<j]) ;
solve minimize sum (j in difrange)(d[track[j],track[j+1]]);
output[show(track)++ "\n"++ show(sum (j in difrange)(d[track[j],track[j+1]]))++"\n"];