% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of an inductor
%             between nodes n1 and n2.
%
%Input Parameters:  - n1, n2: inductor nodes
%                   - val: inductance
% -------------------------------------------------------------------------

function [] = ind(n1,n2,val)

    global G C F b n;
    
    %check for invalid nodes
    if (n1 < 0)||(n1 > n)||(n2 < 0)||(n2 > n)||(n1 == n2)
        error('Invalid input node numbers.');
    %check for negative inductance
    elseif val < 0
        error('Invalid inductance value. Make sure the value is positive.');
    else
        %increase size of G, F and b
        new = length(G)+1;
        G = [G zeros(new-1,1)];
        G = [G; zeros(1,new)];
        b(new) = 0;
        F(new) = sym(0);
        
        %add inductor stamp to G and C
        C(new,new) = -val;
        
        if n1 ~= 0
            G(new,n1) = 1;
            G(n1,new) = 1;
        end
    
        if n2 ~= 0
            G(new,n2) = -1;
            G(n2,new) = -1;
        end 
    end
end
