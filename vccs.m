% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a voltage controlled 
%             current source. 
%
%Input Parameters:  - nd1: positive node of dependent current source
%                   - nd2: negative node of dependent current source
%                   - ni1: positive node of independent voltage source
%                   - ni2: negative node of independent voltage source
%                   - val: multiplying constant
% -------------------------------------------------------------------------

function [] = vccs(nd1,nd2,ni1,ni2,val)

    global G n;
    
    %check for invalid nodes
    if (nd1 < 0)||(nd1 > n)||(nd2 < 0)||(nd2 > n)||(ni1 < 0)||(ni1 > n)||(ni2 < 0)||(ni2 > n)||(nd1 == nd2)||(ni1 == ni2)
        error('Invalid input node numbers.');
    else
        %add vccs stamp to G
        if nd1 ~= 0
            if ni1 ~= 0
                G(nd1,ni1) = G(nd1,ni1) + val;
            end
        
            if ni2 ~= 0
                G(nd1,ni2) = G(nd1,ni2) - val;
            end
        end
        
        if nd2 ~= 0
            if ni1 ~= 0
                G(nd2,ni1) = G(nd2,ni1) - val;
            end
        
            if ni2 ~= 0
                G(nd2,ni2) = G(nd2,ni2) + val;
            end
        end
    end         
end
