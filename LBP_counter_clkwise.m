function [g,v] = LBP_counter_clkwise(f)
[M,N] = size(f);

g = zeros(M,N, 'uint8');
v = zeros(1,256);

for x = 2:M-1
    cur_binary = '';
    for y = 2:N-1
        if f(x-1,y-1) > f(x,y)
            cur_binary = strcat(cur_binary, '1');
        else 
            cur_binary = strcat(cur_binary, '0');
        end
            
        if f(x,y-1) > f(x,y)
            cur_binary = strcat(cur_binary, '1');
        else 
            cur_binary = strcat(cur_binary, '0');
        end
        
        if f(x+1,y-1) > f(x,y)
            cur_binary = strcat(cur_binary, '1');
        else 
            cur_binary = strcat(cur_binary, '0');
        end
        
        if f(x+1,y) > f(x,y)
            cur_binary = strcat(cur_binary, '1');
        else 
            cur_binary = strcat(cur_binary, '0');
        end
        
        if f(x+1,y+1) > f(x,y)
            cur_binary = strcat(cur_binary, '1');
        else 
            cur_binary = strcat(cur_binary, '0');
        end
        
        if f(x,y+1) > f(x,y)
            cur_binary = strcat(cur_binary, '1');
        else 
            cur_binary = strcat(cur_binary, '0');
        end
        
        if f(x-1,y+1) > f(x,y)
            cur_binary = strcat(cur_binary, '1');
        else 
            cur_binary = strcat(cur_binary, '0');
        end
        
        if f(x-1,y) > f(x,y)
            cur_binary = strcat(cur_binary, '1');
        else 
            cur_binary = strcat(cur_binary, '0');
        end
        
        decimal = uint8(bin2dec(cur_binary));
        g(x,y) = decimal;
        
        if decimal > 0
            v(decimal) = v(decimal) + 1;
        end
        
        cur_binary = '';
    end
end


