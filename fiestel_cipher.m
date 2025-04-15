clear all;
text='SHADOWSDIETWICE';
text=upper(text);

if(mod(length(text),2)~=0)
    text=text+"Z";
    text=char(text);
end

lefthalf=text(1:length(text)/2);
righthalf=text(length(text)/2+1:length(text));

cipherrighthalf=lefthalf;
key=randperm(26,length(text)/2);

righthalf=double(righthalf)-64;
cipherlefthalf=bitxor(righthalf,key);
ciphertext=string(char(cipherlefthalf+64))+cipherrighthalf;
disp(ciphertext);

%Decryption
ciphertext=char(ciphertext);
lefthalf=ciphertext(1:length(ciphertext)/2);
righthalf=ciphertext(length(ciphertext)/2+1:length(ciphertext));

decipherleft=righthalf;
lefthalf=double(lefthalf)-64;
decipherright=bitxor(lefthalf,key);
deciphertext=decipherleft+string(char(decipherright+64));
disp(deciphertext);