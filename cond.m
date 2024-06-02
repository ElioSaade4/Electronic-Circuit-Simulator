% -------------------------------------------------------------------------
%Authors: Elio Saade
%
%Description: function that adds the stamp of a conductance 
%             between nodes n1 and n2. 
%
%Input Parameters:  - n1, n2: resistor nodes
%                   - val: conductance
% -------------------------------------------------------------------------

function [] = cond(n1,n2,val)

    global G n;
    
    %check for invalid nodes
    if (n1 < 0)||(n1 > n)||(n2 < 0)||(n2 > n)||(n1 == n2)
        error('Invalid input node numbers.');
    %check for negative conductance
    elseif val < 0
        error('Invalid conductance value. Make sure the value is positive.');
    else
        %add conductance stamp to G
        if n1 == 0
            G(n2,n2) = G(n2,n2) + val;
        elseif n2 == 0
            G(n1,n1) = G(n1,n1) + val;
        else
            G([n1 n2],[n1 n2]) = G([n1 n2],[n1 n2]) + [val,-val;-val,val];
        end
    end  
end