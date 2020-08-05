function a = convert2basis(n, b)
% CONVERT_2_BASIS    - Berechnet zu einer gegebenen Zahl in
%                      Dezimaldarstellung (n) den Koeffizientenvektor in 
%                      einem anderen Stellenwertsystem (b)                      
%   Syntax:   a = convert2basis(n, b)
%   Input:    n - natürliche Zahl
%             b - Basis (möglich sind 2, 8, 16)
%   Output:   a - Koeffizientenvektor

switch(b)
    % Konvertierung ins Dualsystem 
    case 2
        j = floor(log2(n));         % round up
        a = zeros(j+1,1);           % preallocate coefficient vector (column) with n+1 zeros 
                                    % could also use 'ceil' instead
        for i=j:-1:0
            if pow2(i) <= n
                n = rem(n, pow2(i));    % get modulo of division: n div 2^i
                a(i+1) = 1;         % register an one in output vector
            end
        end
        a = flip(a)';               % transform column vector to row vector
        
    % octal
    case 8
        j = floor(log(n)/log(8));         % round up
        a = zeros(j+1,1);           % preallocate coefficient vector with n+1 zeros
        for i=j:-1:0
            if 8^i <= n
                a(i+1) = floor(n/(8^i));
                n = rem(n, 8^i);
            end
        end
        a = flip(a)';               
      
    % dezimal
    case 10
        j = floor(log10(n));        % round up
        a = zeros(j+1,1);           % preallocate coefficient vector with n+1 zeros
        
        for i=j:-1:0
            if 10^i <= n
                a(i+1) = floor(n/(10^i));
                n = rem(n, 10^i);
            end
        end
        a = flip(a)';

    % hex    
    case 16
        j = floor(log(n)/log(16));         % round up
        a = zeros(j+1,1);           % preallocate coefficient vector with n+1 zeros
        for i=j:-1:0
            if 16^i <= n
                a(i+1) = floor(n/(16^i));
                n = rem(n, 16^i);
            end
        end
        a = flip(a)';
   
end
