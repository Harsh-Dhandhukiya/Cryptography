%Taking the input from the users
text=input('Enter the plain text.','s');
offset=input('Enter the offset value.');
ciphertext=text;

for i=1:length(text)
    temp = double(text(i));
    if(temp>=65 && temp<=90)
        %Converting character into ASCII value
        currascii=temp-65;
        %Shifting values by offset
        encryascii=mod(currascii+offset,26);
        %Converting ASCII value back into character
        ciphertext(i)=char(encryascii+65);
    else
        currascii=double(text(i))-97;
        encryascii=mod(currascii+offset,26);
        ciphertext(i)=char(encryascii+97);
    end
end
disp("After encryption:");
disp(ciphertext);

%Decryption: Subtracting offset from ciphertext to decipher it.
deciphertext=ciphertext;
for i=1:length(ciphertext)
    temp = double(ciphertext(i));
    if(temp>=65 && temp<=90)
        currascii=temp-65;
        decryascii=mod(currascii-offset,26);
        deciphertext(i)=char(decryascii+65);
    else
        currascii=double(ciphertext(i))-97;
        decryascii=mod(currascii-offset,26);
        deciphertext(i)=char(decryascii+97);
    end
end
disp(deciphertext);