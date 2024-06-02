% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a capacitor 
%             between nodes n1 and n2.
%
%Input Parameters:  - n1, n2: capacitor nodes
%                   - val: capacitance
% -------------------------------------------------------------------------

function [] = cap(n1,n2,val)

    global C n;
    
    %check for invalid nodes
    if (n1 < 0)||(n1 > n)||(n2 < 0)||(n2 > n)||(n1 == n2)
        error('Invalid input node numbers.');
    %check for negative capacitance
    elseif val < 0
        error('Invalid capacitance value. Make sure the value is positive.');
    else
        %add capacitor stamp to C
        if n1 == 0
            C(n2,n2) = C(n2,n2) + val;
        elseif n2 == 0
            C(n1,n1) = C(n1,n1) + val;
        else
            C([n1 n2],[n1 n2]) = C([n1 n2],[n1 n2]) + [val -val;-val val];
        end
    end  
end
