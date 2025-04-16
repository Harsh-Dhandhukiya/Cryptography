# Cryptography

Cryptographic algorithms implemented in MATLAB, including classical ciphers, modern techniques, and supporting functions like encryption/decryption, cryptanalysis, and mathematical utilities such as Euclidean algorithms and fast exponentiation.

---

## Caesar Cipher Cryptanalysis

```matlab
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
```
>Explanation: -

- **Input Cipher Text**:
  - `cipher=input("Enter cipher text:",'s');`
    - Prompts the user to enter the cipher text as a string.

- **Loop Through Offsets**:
  - `for offset=1:25`
    - Iterates through possible offsets from 1 to 25 for the Caesar cipher decryption.

- **Initialize Decrypted Text**:
  - `deciphertext=cipher;`
    - Initializes the decrypted text as a copy of the cipher text.

- **Process Each Character**:
  - `for i=1:length(cipher)`
    - Loops through each character in the cipher text.

- **Convert Character to ASCII**:
  - `temp = double(cipher(i));`
    - Converts the current character to its ASCII value.

- **Check Uppercase Characters**:
  - `if(temp>=65 && temp<=90)`
    - Checks if the character is an uppercase letter (ASCII 65-90).
    - Converts the character to its position in the alphabet (0-25).
    - Shifts the position by the offset.
    - Converts the shifted position back to an uppercase character.

- **Check Lowercase Characters**:
  - `elseif(temp>=97 && temp<=122)`
    - Checks if the character is a lowercase letter (ASCII 97-122).
    - Converts the character to its position in the alphabet (0-25).
    - Shifts the position by the offset.
    - Converts the shifted position back to a lowercase character.

- **Keep Non-Alphabetic Characters Unchanged**:
  - `else`
    - If the character is not a letter, it remains unchanged.

- **Display Decrypted Text**:
  - `disp(deciphertext);`
    - Displays the decrypted text for the current offset.

>Output Image: -
