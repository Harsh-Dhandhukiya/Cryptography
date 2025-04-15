clear all;
key='SEKIRO';
text='SHADOWSDIETWICEE';
text=upper(text);

for i=1:length(text)
    if(text(i)=='J')
        text(i)='I';
    end
end
for i=1:length(text)-1
    if(text(i)==text(i+1))
        temp=text(i+1:length(text));
        text(i+1)='X';
        text=resize(text,i+1);
        text=string(text);
        text=text+temp;
        text=char(text);
    end
end

if(mod(length(text),2)~=0)
    text=text+"Z";
    text=char(text);
end

remainingchars=1:1:26;
remainingchars(10)=0;

for i=1:26
    for j=1:length(key)
        if(remainingchars(i)==(double(key(j))-64))
            remainingchars(i)=0;
        end
    end
end

matrix(5,5)=0;

k=1;
for i=1:5
    for j=1:5
        matrix(i,j)=double(key(k))-64;
        k=k+1;
        if(k>length(key))
            break;
        end
    end
    if(k>length(key))
        break;
    end
end

ch=1;
for i=1:5
    for j=1:5
        if(matrix(i,j)~=0)
            continue;
        end
        while(remainingchars(ch)==0)
            ch=ch+1;
        end
        matrix(i,j)=ch;
        ch=ch+1;
    end
end

textnum=double(text)-64;

ar1=0;
ar2=0;
ac1=0;
ac2=0;
ciphertext=textnum;
for k=1:2:length(text)-1
    p1=find(matrix==textnum(k));
    r1=mod(p1,5);
    c1=ceil(p1./5);
    p2=find(matrix==textnum(k+1));
    r2=mod(p2,5);
    c2=ceil(p2./5);

    if(r1==0)
        r1=5;
    end

    if(r2==0)
        r2=5;
    end

    if(r1==r2)
        ac1=mod(c1+1,5);
        if(ac1==0)
            ac1=5;
        end
        ac2=mod(c2+1,5);
        if(ac2==0)
            ac2=5;
        end
        ar1=r1;
        ar2=r2;
    elseif(c1==c2)
        ar1=mod(r1+1,5);
        if(ar1==0)
            ar1=5;
        end
        ar2=mod(r2+1,5);
        if(ar2==0)
            ar2=5;
        end
        ac2=c2;
        ac1=c1;
    else
        ar1=r1;
        ac1=c2;
        ar2=r2;
        ac2=c1;
    end
    ciphertext(k)=matrix(ar1,ac1);
    ciphertext(k+1)=matrix(ar2,ac2);
end
disp(char(ciphertext+64));
%Decryption

br1=0;
br2=0;
bc1=0;
bc2=0;
deciphertext=ciphertext;
for k=1:2:length(ciphertext)-1
    p1=find(matrix==ciphertext(k));
    r1=mod(p1,5);
    c1=ceil(p1./5);
    p2=find(matrix==ciphertext(k+1));
    r2=mod(p2,5);
    c2=ceil(p2./5);
    ciphertext(k)=0;
    ciphertext(k+1)=0;

    if(r1==0)
        r1=5;
    end

    if(r2==0)
        r2=5;
    end

    if(r1==r2)
        bc1=mod(c1-1,5);
        if(bc1==0)
            bc1=5;
        end
        bc2=mod(c2-1,5);
        if(bc2==0)
            bc2=5;
        end
        br1=r1;
        br2=r2;
    elseif(c1==c2)
        br1=mod(r1-1,5);
        if(br1==0)
            br1=5;
        end
        br2=mod(r2-1,5);
        if(br2==0)
            br2=5;
        end
        bc2=c2;
        bc1=c1;
    else
        br1=r1;
        bc1=c2;
        br2=r2;
        bc2=c1;
    end
    deciphertext(k)=matrix(br1,bc1);
    deciphertext(k+1)=matrix(br2,bc2);
end
disp(char(deciphertext+64));