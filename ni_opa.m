% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that adds the stamp of a non-ideal op-amp with 
%             given values for A, Rin and Rout and using the equivalent 
%             op-amp circuit with a vcvs.
%
%Input Parameters:  - inplus: non-inverting node
%                   - inminus: inverting node
%                   - out: output node
%                   - A: multiplying gain
%                   - Rin: input resistance
%                   - Rout: output resistance
% -------------------------------------------------------------------------

function [] = ni_opa(inplus,inminus,out,A,Rin,Rout)

    global G C F b n;
    
    %check for invalid nodes
    if (inplus < 0)||(inplus > n)||(inminus < 0)||(inminus > n)||(inplus == inminus)||(out < 0)||(out > n)
        error('Invalid input node numbers.');
    else
        %input resistor
        res(inplus,inminus,Rin);
        
        %increase size of G, C, F and b to add a new node
        new = length(G)+1;
        G = [G zeros(new-1,1)];
        G = [G; zeros(1,new)];
        C = [C zeros(new-1,1)];
        C = [C; zeros(1,new)];
        F(new) = sym(0);
        b(new) = 0;
        
        %vcvs with gain A
        vcvs_mz_hh_es(new,0,inplus,inminus,A);
        
        %output resistor
        res_mz_hh_es(new,out,Rout);
    end
end
