text=input('Enter the message:','s');
n=input('Enter a number:');

while(mod(length(text),n)~=0)
    text=text+"Z";
    text=char(text);
end

text=upper(text);
key=randperm(n);
text=reshape(text,[length(text)/n,n]);

ciphertext=text;

[rows,cols]=size(text);
for i=1:rows
    for j=1:cols
        ciphertext(i,j)=text(i,key(j));
    end
end
ciphertext=transpose(ciphertext);
ciphertext=reshape(ciphertext,1,[]);
disp(ciphertext);
%Decryption
ciphertext=reshape(ciphertext,cols,[]);
ciphertext=transpose(ciphertext);
deciphertext=ciphertext;
for i=1:rows
    for j=1:cols
        deciphertext(i,j)=ciphertext(i,find(key==j));
    end
end
deciphertext=reshape(deciphertext,1,[]);
disp(deciphertext);