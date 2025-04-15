clear all;
x2=input('Enter the base of the number:');
x1=input('Enter the exponent of the number');
n=input('Enter the value for mod function:');
bits=dec2bin(x1);
result=x2;
if(length(bits)==1)
    result=mod(x2^x1,n);
end

for i=2:length(bits)
    if(bits(i)=='1')
        result=mod(result^2,n);
        result=mod(result*x2,n);
    else
        result=mod(result^2,n);
    end
end
disp(result);