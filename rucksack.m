function rucksack
  clear;
  clc;
  file='C:\Users\Olga\Desktop\new_object\data\ks_4_0.txt';
  [n, k]=dlmread(file,' ',0,0)
  weight=dlmread(file, '\n', 1,0)
  cost=dlmread(file, '\n', 1,1)
 % n=4;
  m=5;
  %k=4;
  cmax=0;
  rfinal=zeros(1,10);
  %weight=[4, 5, 8, 3];
  %cost=[8, 10, 15, 4];
  W=11;
  C=sum(cost);
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
  while((cmax<C*0.8)&(it<6))
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
