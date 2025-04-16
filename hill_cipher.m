clc;
clear all;
close all;
text='ATTACKNOW';
n=2;
while(mod(length(text),n)~=0)
    text=text+"Z";
    text=char(text);
end
%Encryption
key=[2 1; 3 4];
text=reshape(text,[length(text)/n,n]);
text1=transpose(text);
text1=double(text1)-65;
ciphertext=mod(key*text1,26);
ciphertext=char(ciphertext+65);
ciphertext=transpose(ciphertext);
ciphertext=reshape(ciphertext,1,[]);
disp("Encrypted text: " + ciphertext);

%Decryption
% Calculate inverse of key matrix manually without using adjoint
det_key = mod((key(1,1)*key(2,2) - key(1,2)*key(2,1)), 26);

% Find modular multiplicative inverse of determinant
k2 = 0;
for i=1:1:25
    if mod(det_key*i, 26) == 1
        k2 = i;
        break;
    end
end

% Calculate the adjugate matrix (often called adjoint) manually
adjugate = [key(2,2), -key(1,2); -key(2,1), key(1,1)];
% Ensure negative values are properly handled in modulo 26
adjugate = mod(adjugate + 26, 26);

% Calculate the inverse key matrix
key_inverse = mod(k2 * adjugate, 26);

% Reshape ciphertext for decryption
ciphertext_reshape = reshape(ciphertext, [length(ciphertext)/n, n]);
ciphertext_transpose = transpose(ciphertext_reshape);
ciphertext_num = double(ciphertext_transpose) - 65;

% Decrypt the message
deciphertext = mod(key_inverse * ciphertext_num, 26);
deciphertext = char(deciphertext + 65);
deciphertext = transpose(deciphertext);
deciphertext = reshape(deciphertext, 1, []);
disp("Decrypted text: " + deciphertext);