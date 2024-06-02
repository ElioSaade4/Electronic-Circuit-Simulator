% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that calculates the frequency response of a linear
%             circuit. 
%
%Input Parameters:  - fL: lower frequency point
%                   - fH: upper frequency point
%                   - N: number of frequency points
%                   - out: output node
%
%Output Parameters: - fpoints: frequency points
%                   - r: frequency response points
% -------------------------------------------------------------------------

function [fpoints, r] = fsolve_linear(fL,fH,N,out)

    global G C b n;
    
    %check for invalid frequency range boudaries
    if (fL < 0) || (fH < 0) || (fL > fH)
        error('Invalid frequency range boudaries. fL and fH must be positive, with fL < fH.');
    elseif N <= 0
        error('The number of frequency points N must be strictly positive.');
    elseif (out < 1)||(out > n)
        error('Invalid output node.');
    else
        %frequency points 
        fpoints = linspace(fL,fH,N);
        
        r = zeros(1,N);
    
        for i = 1:N
            A = G + (2j*pi*fpoints(i))*C;   %A at every frequency point
            [L,U,P] = lu(A);
            y = L\(P*b);
            x = U\y;
            r(i) = abs(x(out)); %voltage at node 'out' for every frequency point
        end
    end
end