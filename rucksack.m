function rucksack
  clear;
  clc;
  file="c:\\users\\olga\\desktop\\new_object\\data\\ks_100_2";
  m=25;
  limit=9816; %пусть уже выдаст ответ
  l=zeros(1,2);
  l=dlmread(file, " ",0,0);
  n=l(1,1);
  W=l(1,2);
  weight=zeros(1,n);
  cost=zeros(1,n);
  for(i=1:n)
    l=dlmread(file," ",i,0);
    weight(i)=l(1,2);
    cost(i)=l(1,1);
  endfor
  C=sum(cost);
  cmax=0;
  for i=1:m
    A(i,:)=randi(2,1,n)-ones(1,n);
    while(A(i,:)*weight'>W)
      A(i,:)=randi(2,1,n)-ones(1,n);
    endwhile
    if (A(i,:)*cost'>cmax)
      cmax=A(i,:)*cost';
      rfinal=A(i,:);
    endif
  endfor
  it=1;
  k=floor(n/2);
  while((cmax<C*0.8)&(it<6)&(cmax<limit))
    if(it==0)
      it=1;
    endif
    l=1;
    for i=1:m
      for j=1:m
        if(i!=j)
          B(l,:)=[A(i,1:k),A(j,k+1:n)];
          s=randi(n);
          B(l,s)=mod((B(l,s)+((randi(2))-1)),2);
          if(B(l,:)*weight'<=W)
            if(B(l,:)*cost'>cmax)
              cmax=B(l,:)*cost';
              rfinal=B(l,:);
              it=0;
            endif
            l=l+1;
          endif
         endif
         %cmax
      endfor
    endfor
    A=B;
    if(it>0)
      it=it+1;
    endif
  endwhile
  cmax
  rfinal
  'finished'
endfunction
