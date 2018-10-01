function dec(s)
    height = size(s,1);
    width = size(s,2);
    m = 24000;
    k = 1;v=1;
    for i = 1 : height
        for j = 1 : width
            if (k<=m && (mod(j,2)==0))
                b(k) = mod(double(s(i,j,v)),2);
                k = k + 1;
            end
        end
    end
    binaryVector = b;
    binValues = [ 128 64 32 16 8 4 2 1 ];
    binaryVector = binaryVector(:);
    if mod(length(binaryVector),8) ~= 0
        error('Length of binary vector must be a multiple of 8.');
    end
    binMatrix = reshape(binaryVector,8,3000);
   % display(binMatrix);
    textString = char(binValues*binMatrix); 
    fileID = fopen('out.txt','w');
    fwrite(fileID,textString);
    fclose(fileID);
end