function greedy_rucksack
  clear;
  clc;
  file="c:\\users\\olga\\desktop\\new_object\\data\\ks_200_0";
  l=zeros(1,2);
  l=dlmread(file, " ",0,0);
  n=l(1,1);
  W=l(1,2);
  weight=zeros(1,n);
  cost=zeros(1,n);
  for(i=1:n)
    l=dlmread(file," ",[i,0,i,1]);
    weight(i)=l(1,2);
    cost(i)=l(1,1);
  endfor
  C=sum(cost);
  cmax=0;
  rkg=cost./weight;
  put=zeros(1,n);
  %sum(weight)
  f=1;
  S=0;
  while(f)
    f=0;
    M=0;
    p=0;
    for(i=1:n)
      if((rkg(i)>M)&&(put(i)==0)&&(weight(i)<W))
        M=rkg(i);
        p=i;
      endif
    endfor
    if(p>0)
      put(p)=1;
      W=W-weight(p);
      S=S+cost(p);
      f=1;
      M=0;
      p=0;
    endif
  endwhile
  S
  W
  %sum(cost)
  put
endfunction
