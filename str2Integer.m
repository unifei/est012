%Function to convert a string of binary numbers
%in an integer of n bits
function [num] = str2Integer(str, n)
    %variable that will have the result
    num = 0;
    tam = length(str);
    %loop for each bit
    for i=2:tam,
        %calculate the expoent of the bit
        pow = (2^(tam-i));
        %calculate the number and add to the result
        num = num + ((str(i)-48)*pow);
    end
    %convert the number to an integer of 8 bits
    if str(1)==49
        num = -num;
    end
    if n == 16
        num = int16(num);
    else num = int8(num);
    end
end