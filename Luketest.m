function Luketest
  %pkg install symbolic-3.0.1.zip
  %pkg load symbolic;
  clear;
  clc;
  p=[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 91, 97, 101, 103, 107, 109, 113, 127];
  k=randi([5 10]);
  arr(1)=2;
  deg(1)=20;

  for i=2:1:k
    arr(i)=p(randi([1 32]));
    deg(i)=randi([18 25]);
  endfor

  elem=max(arr);
  n=0;

  for i=1:1:k
    n=n+arr(i)^deg(i);
  endfor
%n
  while((n>2^128)&&(n<2^123))
  %1
    k=randi([5 10]);
    arr(1)=2;
    deg(1)=20;

    for i=2:1:k
      arr(i)=p(randi([1 32]));
     deg(i)=randi([18 25]);
    endfor

    elem=max(arr);
    n=0;

    for i=1:1:k
     n=n+arr(i)^deg(i);
    endfor
    log2(n);
  endwhile

 % if(n<2^123)
 %   n=ceil(n*elem^((123-log2(n))/log2(elem)))
 %   log2(n)
 % endif

  n=n+1;
  answer=0;
  for a=2:1:ceil(log2(n))
    if(mod(a^(n-1),n)==1)
      ans=1;
      for i=1:1:k
        if(mod(a^((n-1)/p(i)),n)==1)
          ans=0;
        endif
      endfor
      if(ans==1)
        answer=a;
      endif
    endif
  endfor

  if(answer!=0)
    %format(long);
    disp(sym(n));
    %n
    disp(" is prime");
  else
   %format(long);
   disp(sym(n));
   %n
   disp(" is not prime");
  endif
  Pollard(n,round(log2(n)));
endfunction

function Pollard(n,N)
  c=0;
  a=floor(n/2);
  for i=1:1:N
    b=mod(a^factorial(i)-1,n);
    if((gcd(b,n)!=1)&&(gcd(b,n)!=n))
      c=1;
      sym(b)
      %b
    endif
  endfor
  if(c==0)
    1
  endif
endfunction
