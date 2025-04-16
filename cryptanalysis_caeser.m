cipher=input("Enter cipher text:",'s');
for offset=1:25
    deciphertext=cipher;  % Changed ciphertext to cipher
    for i=1:length(cipher)  % Changed text to cipher
        temp = double(cipher(i));  % Changed ciphertext to cipher
        if(temp>=65 && temp<=90)
            %Converting character into ASCII value
            currascii=temp-65;
            %Shifting values by offset
            encryascii=mod(currascii-offset,26);
            %Converting ASCII value back into character
            deciphertext(i)=char(encryascii+65);
        elseif(temp>=97 && temp<=122)  % Added elseif condition to check lowercase range
            currascii=double(cipher(i))-97;  % Changed ciphertext to cipher
            encryascii=mod(currascii-offset,26);
            %Converting ASCII value back into character
            deciphertext(i)=char(encryascii+97);
        else  % Keep non-alphabetic characters unchanged
            deciphertext(i)=cipher(i);  % Changed ciphertext to cipher
        end
    end
    disp(deciphertext);
end