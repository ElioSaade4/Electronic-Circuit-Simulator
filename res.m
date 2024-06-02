% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a resistor 
%             between nodes n1 and n2.
%
%Input Parameters:  - n1, n2: resistor nodes
%                   - val: resistance
% -------------------------------------------------------------------------

function [] = res(n1,n2,val)
    
    global G n;
    
    %check for invalid nodes
    if (n1 < 0)||(n1 > n)||(n2 < 0)||(n2 > n)||(n1 == n2)
        error('Invalid input node numbers.');
    %check for negative resistance
    elseif val < 0
        error('Invalid resistance value. Make sure the value is positive.');
    else
        g = 1/val;  %conductance
        
        %add resistor stamp to G
        if n1 == 0
            G(n2,n2) = G(n2,n2) + g;
        elseif n2 == 0
            G(n1,n1) = G(n1,n1) + g;
        else
            G([n1 n2],[n1 n2]) = G([n1 n2],[n1 n2]) + [g -g;-g g];
        end 
    end
end

