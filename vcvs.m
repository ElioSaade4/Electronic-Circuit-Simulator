% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a voltage controlled 
%             voltage source. 
%
%Input Parameters:  - nd1: positive node of dependent voltage source
%                   - nd2: negative node of dependent volateg source
%                   - ni1: positive node of independent voltage source
%                   - ni2: negative node of independent voltage source
%                   - val: multiplying constant
% -------------------------------------------------------------------------

function [] = vcvs(nd1,nd2,ni1,ni2,val)

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
    
        %add vcvs stamp to G
        if nd1 ~= 0
            G(nd1,new) = 1;
            G(new,nd1) = 1;
        end
    
        if nd2 ~= 0
            G(nd2,new) = -1;
            G(new,nd2) = -1;
        end
    
        if ni1 ~= 0
            G(new,ni1) = -val;
        end
    
        if ni2 ~= 0
            G(new,ni2) = val;
        end
    end
end
