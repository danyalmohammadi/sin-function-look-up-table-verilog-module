function y = dec2binfrac( x,n )
% converts dec to binary

 
x=x(:);
points=repmat('.',length(x),1);
signs =repmat(' ',length(x),1);
idx=find(x<0);
signs(idx) = signs(idx) - ' ' + '-';
y=dec2bin(abs(x)*2^n,n);
 


return

end

