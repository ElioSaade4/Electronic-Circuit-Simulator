% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a short circuit 
%             between nodes n1 and n2.
%
%Input Parameters:  - n1, n2: short circuit node
% -------------------------------------------------------------------------

function [] = sckt(n1,n2)

    global G C F b n;
    
    %check for invalid nodes
    if (n1 < 0)||(n1 > n)||(n2 < 0)||(n2 > n)||(n1 == n2)
        error('Invalid input node numbers.');
    else
        %increase size of G, C, F and b
        new = length(G)+1;
        G = [G zeros(new-1,1)];
        G = [G; zeros(1,new)];
        C = [C zeros(new-1,1)];
        C = [C; zeros(1,new)];
        F(new) = sym(0);
        b(new) = 0;

        G(n2,n1) = 1;
        G(n1,n2) = 1;
    
        G(n2,new) = -1;
        G(new,n2) = -1;
    end 
end
