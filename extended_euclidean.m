num1=input('Enter a number:');
num2=input('Enter a number:');
s1=1;
s2=0;
t1=0;
t2=1;
while(num2~=0)
    r=mod(num1,num2);
    q=floor(num1./num2);

    num1=num2;
    num2=r;

    s=s1-q*s2;
    t=t1-q*t2;
    s1=s2;
    s2=s;
    t1=t2;
    t2=t;
end
disp("GCD = " + num1);
disp("s = " + s1);
disp("t = " + t1);