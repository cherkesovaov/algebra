function greedy_rucksack
  clear;
  clc;
  n=6;
  weight=[5, 15, 78, 56, 1, 9];
  cost=[67, 6767, 5786, 445, 999, 2122];
  rkg=cost./weight;
  put=zeros(1,n);
  %sum(weight)
  V=100;
  f=1;
  S=0;
  while(f)
    f=0;
    M=0;
    p=0;
    for(i=1:n)
      if((rkg(i)>M)&&(put(i)==0)&&(weight(i)<V))
        M=rkg(i);
        p=i;
      endif
    endfor
    if(p>0)
      put(p)=1;
      V=V-weight(p);
      S=S+cost(p);
      f=1;
      M=0;
      p=0;
    endif
  endwhile
  S
  %sum(cost)
  put
endfunction
