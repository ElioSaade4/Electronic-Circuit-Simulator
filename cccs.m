% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a current controlled 
%             current source.   
%
%Input Parameters:  - nd1: positive node of dependent current source
%                   - nd2: negative node of dependent current source
%                   - ni1: positive node of independent current source
%                   - ni2: negative node of independent current source
%                   - val: multiplying constant
% -------------------------------------------------------------------------

function [] = cccs(nd1,nd2,ni1,ni2,val)

    global G C F b n;
    
    %check for invalid nodes
    if (nd1 < 0)||(nd1 > n)||(nd2 < 0)||(nd2 > n)||(ni1 < 0)||(ni1 > n)||(ni2 < 0)||(ni2 > n)||(nd1 == nd2)||(ni1 == ni2)
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
        
        %add cccs stamp to G
        if ni1 ~= 0
            G(ni1,new) = 1;
            G(new,ni1) = 1;
        end
    
        if ni2 ~= 0
            G(ni2,new) = -1;
            G(new,ni2) = -1;
        end
    
        if nd1 ~= 0
            G(nd1,new) = val;
        end
    
        if nd2 ~= 0
            G(nd2,new) = -val;
        end
    end
end