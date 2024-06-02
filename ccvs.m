% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a current controlled 
%             voltage source. 
%
%Input Parameters:  - nd1: positive node of dependent voltage source
%                   - nd2: negative node of dependent voltage source
%                   - ni1: positive node of independent current source
%                   - ni2: negative node of independent current source
%                   - val: multiplying constant
% -------------------------------------------------------------------------

function [] = ccvs(nd1,nd2,ni1,ni2,val)

    global G C F b n;
    
    %check for invalid nodes
    if (nd1 < 0)||(nd1 > n)||(nd2 < 0)||(nd2 > n)||(ni1 < 0)||(ni1 > n)||(ni2 < 0)||(ni2 > n)||(nd1 == nd2)||(ni1 == ni2)
        error('Invalid input node numbers.');
    else
        %increase size of G, C, F and b
        new1 = length(G)+1;
        G = [G zeros(new1-1,1)];
        G = [G; zeros(1,new1)];
        C = [C zeros(new1-1,1)];
        C = [C; zeros(1,new1)];
    
        new2 = new1 + 1;
        G = [G zeros(new2-1,1)];
        G = [G; zeros(1,new2)];
        C = [C zeros(new2-1,1)];
        C = [C; zeros(1,new2)];
    
        F([new1,new2]) = sym(0);
        b([new1,new2]) = 0;
    
        %add ccvs stamp to G
        if ni1 ~= 0
            G(ni1,new1) = 1;
            G(new1,ni1) = 1;
        end
    
        if ni2 ~= 0
            G(ni2,new1) = -1;
            G(new1,ni2) = -1;
        end
    
        if nd1 ~= 0
            G(nd1,new2) = 1;
            G(new2,nd1) = 1;
        end
    
        if nd2 ~= 0
            G(nd2,new2) = -1;
            G(new2,nd2) = -1;
        end
    
        G(new2,new1) = -val;
    end
end