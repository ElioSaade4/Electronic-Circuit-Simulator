% -------------------------------------------------------------------------
%Authors: Elio Saade
%
%Description: function that adds the stamp of a current source 
%             (current flowing from n1 to n2).
%
%Input Parameters:  - n1: positive node 
%                   - n2 : negative node
%                   - val: current value
% -------------------------------------------------------------------------

function [] = cur(n1,n2,val)

    global b n;
    
    %check for invalid nodes
    if (n1 < 0) ||  (n1 > n) || (n2 < 0) || (n2 > n) || (n1 == n2)
        error('Invalid input node numbers.');
    else
        %add current source stamp to b
        if n1~=0
            b(n1,1)= b(n1,1) - val;
        end
        if n2 ~= 0
            b(n2,1) = b(n2,1) + val;
        end
    end
end