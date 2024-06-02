% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of an ideal opamp  
%             (infinite gain, infinite Rin, zero Rout)
%
%Input Parameters:  - inplus: non-inverting node
%                   - inminus: inverting node
%                   - out: output node
% -------------------------------------------------------------------------

function [] = opa(inplus,inminus,out)

    global G C F b n;
    
    %check for invalid nodes
    if (inplus < 0)||(inplus > n)||(inminus < 0)||(inminus > n)||(inplus == inminus)||(out < 0)||(out > n)
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
        
        %add ideal op-amp stamp to G
        if inplus ~= 0
            G(new,inplus) = 1;
        end
    
        if inminus ~= 0
            G(new,inminus) = -1;
        end
    
        G(out,new) = 1;
    end
end
