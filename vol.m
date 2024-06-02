% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a voltage source
%             (positive polarity at n1).
%
%Input Parameters:  - n1: positive node 
%                   - n2 : negative node
%                   - val: voltage value
% -------------------------------------------------------------------------

function [] = vol(n1,n2,val)

    global G C F b n;
    
    %check for invalid nodes
    if (n1 < 0)||(n1 > n)||(n2 < 0)||(n2 > n)||(n1 == n2)
        error('Invalid input node numbers.');
    else
        %increase size of G, C and F 
        new = length(G)+1;
        G = [G zeros(new-1,1)];
        G = [G; zeros(1,new)];
        C = [C zeros(new-1,1)];
        C = [C; zeros(1,new)];
        F(new) = sym(0);
        
        %add voltage source stamp to G and b
        b(new) = val;
    
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
