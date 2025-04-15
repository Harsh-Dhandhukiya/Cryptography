cipher=input("Enter cipher text:",'s');

for offset=1:25
    deciphertext=ciphertext;
    for i=1:length(text)
        temp = double(ciphertext(i));
        if(temp>=65 && temp<=90)
            %Converting character into ASCII value
            currascii=temp-65;
            %Shifting values by offset
            encryascii=mod(currascii-offset,26);
            %Converting ASCII value back into character
            deciphertext(i)=char(encryascii+65);
        else
            currascii=double(ciphertext(i))-97;
            encryascii=mod(currascii-offset,26);
            %Converting ASCII value back into character
            deciphertext(i)=char(encryascii+97);
        end
    end
    disp(deciphertext);
end