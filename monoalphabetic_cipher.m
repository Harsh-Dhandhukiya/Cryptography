clc;
clear all;
close all;
key=randperm(26);
text='ATTACK';
ciphertext=text;
%Encryption
for i=1:length(text)
    %Subtracting 64 to get index in range [1,26]
    charIndex=double(text(i))-64;
    %mapping characters from text to key
    ciphertext(i)=char(key(charIndex)+64);
end
disp(ciphertext);

%Decryption
deciphertext=ciphertext;
for i=1:length(ciphertext)
    charIndex=double(ciphertext(i))-64;
    %finding the index for ciphered character in the array key
    textIndex=find(key==charIndex);
    %adding 64 to map ciphered character back into original character
    deciphertext(i)=char(textIndex+64);
end
disp(deciphertext);