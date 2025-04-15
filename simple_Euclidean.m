num1=input('Enter a number:');
num2=input('Enter a number:');

while (num2~=0)
    temp=num2;
    num2=mod(num1,num2);
    num1=temp;
end
disp(num1);