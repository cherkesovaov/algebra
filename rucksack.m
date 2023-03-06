function rucksack
  clear;
  clc;
  n=10;
  m=5;
  k=4;
  cmax=0;
  rfinal=zeros(1,10);
  weight=[1:10];
  cost=[2:2:20];
  W=40;
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
    it=1;
    l=1;
    for i=1:m
      for j=1:m
        if(i!=j)
          B(l,:)=[A(i,1:k),A(j,k+1:n)];
          s=randi(n);
          B(l,s)=mod((B(l,s)+((randi(2))-1)),2);
          if(B(l,:)*weight'<=W)
            if(B(l,:)*cost'>cmax)
              cmax=B(l,:)*cost'
              rfinal=B(l,:)
              it=0;
            endif
            l=l+1;
          endif
         endif
      endfor
    endfor
    A=B;
    B;
    if(it>0)
      'plused'
      it=it+1
    endif
    it;
  endwhile
  cmax
  rfinal
  'finished'
endfunction
