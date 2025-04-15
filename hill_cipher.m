clc;
clear all;
close all;
text='ATTACKNOW';
n=2;
while(mod(length(text),n)~=0)
    text=text+"Z";
    text=char(text);
end
%Encryption
key=[2 1; 3 4];

text=reshape(text,[length(text)/n,n]);

text1=transpose(text);
text1=double(text1)-65;

ciphertext=mod(key*text1,26);
ciphertext=char(ciphertext+65);
ciphertext=transpose(ciphertext);
ciphertext=reshape(ciphertext,1,[]);

disp(ciphertext);

%Decryption

key1=det(key);
for i=1:1:25
    a = mod(key1*i,26);
    if a==1
            k2=i;
    end
end

key_inverse=round(mod(k2*adjoint(key),26));

ciphertext=double(ciphertext)-65;

ciphertext=reshape(ciphertext,length(ciphertext)/n,[]);
ciphertext=transpose(ciphertext);

deciphertext=mod(key_inverse*ciphertext,26);
deciphertext=transpose(deciphertext);
deciphertext=reshape(deciphertext,1,[]);
deciphertext=char(deciphertext + 65);
disp(deciphertext);