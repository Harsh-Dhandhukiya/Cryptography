clc;
clear all;
close all;
text=input('Enter the message:','s');
k=input('Enter the key: ');
while(mod(length(text),k)~=0)
    text=text+"Z";
    text=char(text);
end

intermediate=reshape(text,[k,length(text)/k]);
disp(intermediate);
intermediate=transpose(intermediate);
ciphertext=reshape(intermediate,[1,length(text)]);

disp(ciphertext);

%Decryption
intermediate1=reshape(ciphertext,[length(ciphertext)/k,k]);
intermediate1=transpose(intermediate1);
deciphertext=reshape(intermediate1,[1,length(ciphertext)]);

disp(deciphertext);