function enc(message,c)
  message = strtrim(message);
    m = length(message) * 8;
    AsciiCode = uint8(message); 
    binaryString = transpose(dec2bin(AsciiCode,8));
    binaryString = binaryString(:);
    N = length(binaryString);
    b = zeros(N,1); %b is a vector of bits
    for k = 1:N
        if(binaryString(k) == '1')
            b(k) = 1;
        else
            b(k) = 0;
        end
    end
    s = c;
    height = size(c,1);
    width = size(c,2);
    k = 1;v=1;
    for i = 1 : height
        for j = 1 : width
             if(k<=m && (mod(j,2)==0))
             s(i,j,v)=s(i,j,v)+b(k);
             k=k+1;
             end
        end
    end
     imwrite(s, 'encrypted.bmp');
end




