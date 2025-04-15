text="ATTACKNOW";
key=round(rand(1)*26);

key=char(key+65)+text;
key=char(key);
text=char(text);
ciphertext=text;
for i=1:length(text)
    a=double(text(i))-65;
    b=double(key(i))-65;
    ciphertext(i)=char(mod(a+b,26)+65);
end
disp(ciphertext);
%Decryption

deciphertext=ciphertext;
for i=1:length(ciphertext)
    a=double(ciphertext(i))-65;
    b=double(key(i))-65;
    deciphertext(i)=char(mod(a-b,26)+65);
end
disp(deciphertext);