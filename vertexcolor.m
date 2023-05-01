function vertexcolor
  clear;
  clc;
  file=fopen("c:\\users\\olga\\desktop\\new_object\\datagraph\\gc_20_5","r");
  v=fscanf(file,"%d",1);
  e=fscanf(file,"%d",1);
  E=zeros(e,2);
  vertcol=zeros(1,v);
  vertex=zeros(1,v);
  for(k=1:v)
    vertex(k)=k;
  endfor
  for(k=1:e)
    E(k,1)=fscanf(file,"%d",1)+1;
    E(k,2)=fscanf(file,"%d",1)+1;
  endfor
  n=2;
  flag=1;
  eps=1e-2;
  %options= "ComplexEqn"="on";
  options=optimset("ComplexEqn","on","AutoScaling","on","MaxFunEvals", 200*(v+e),"TolFun",1e-9,"TolX",1e-9);
  while(flag)
    for(k=1:n)
      j(k)=k-1;
    endfor
    y=@(x) [x(1:v).^n-1 sum(x(E(:,1)).^(n-1-j(:)).*x(E(:,2)).^j(:))];
    [ans,fval,info]=fsolve(y,ones(1,v)*exp(2*pi*i/n),options);
    n
    info
    if(info==1)
      flag=0;
    else
      n++;
    endif
  endwhile
  for(k=1:v)
    ans(k)=ans(k)/abs(ans(k));
  endfor
  ans;
  vertcol=(real(log(ans)*n/(2*pi*i)));
  n
  vertcol'
endfunction

