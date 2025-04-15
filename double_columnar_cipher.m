text=input('Enter the message:','s');
n1=input('Enter a number:');

while(mod(length(text),n1)~=0)
    text=text+"Z";
    text=char(text);
end

text=upper(text);
n2=length(text)/n1;
key1=randperm(n1);
key2=randperm(n2);
text=reshape(text,n1,[]);

ciphertext=text;

[rows,cols]=size(text);
for i=1:rows
    for j=1:cols
        ciphertext(i,j)=text(key1(i),key2(j));
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
        deciphertext(i,j)=ciphertext(find(key1==i),find(key2==j));
    end
end
deciphertext=reshape(deciphertext,1,[]);
disp(deciphertext);