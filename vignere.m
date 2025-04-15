text='ATTACKNOW';
n=3;
key=randperm(26,3);
key=char(key+65);
while (length(key)<length(text))
    key=key+string(key);
    key=char(key);
end
key=resize(key,length(text));
ciphertext=mod(double(text)-'A'+double(key)-'A',26);
ciphertext=char(ciphertext+'A');
disp(ciphertext);
%Decryption
deciphertext=ciphertext;
deciphertext=mod(double(ciphertext)-'A'-double(key)+'A',26);
deciphertext=char(deciphertext+'A');
disp(deciphertext);