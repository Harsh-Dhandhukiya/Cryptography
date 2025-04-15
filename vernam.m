text='ATTACKNOW';
key=randperm(26,length(text));

text=double(text)-65;
ciphertext=bitxor(text,key);
%ciphertext=mod(ciphertext,26);
ciphertext=char(ciphertext+65);
disp(ciphertext);
%Decryption

ciphertext=double(ciphertext)-65;
deciphertext=ciphertext;
for i=1:length(ciphertext)
    deciphertext(i)=bitxor(key(i),ciphertext(i));
end
%deciphertext=mod(deciphertext,26);
deciphertext=char(deciphertext+65);
disp(deciphertext);