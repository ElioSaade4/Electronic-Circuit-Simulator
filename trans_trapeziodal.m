% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that performs transient analysis to a linear circuit
%             using Trapeziodal Rule.
%
%Input Parameters:  - t1: time start point
%                   - t2: time end point
%                   - h: time step size
%                   - in: input source function (anonymous function)
%                   - out: output node
%
%Output Parameters: - tpoints: time points
%                   - res: transient analysis result
% -------------------------------------------------------------------------

function [tpoints,res] = trans_trapeziodal(t1,t2,h,in,out)
    
    global G C b
    
    tpoints = t1:h:t2;      %time points
    N = length(tpoints);    %number of time points
     
    res = zeros(1,N); %value of the response at above time points %initial condition
    x0 = zeros(length(b),1);
    res(1) = x0(out); %initial conditions
    
    row_index = find(b); %finding at which rows the matrix b has non-zero elements
    pattern = b;

    %normalizing the values of non-zero elements of b 
    for j = 1:length(row_index)
        pattern(row_index(j)) = b(row_index(j)) / abs(b(row_index(j)));
    end
    
    bn = pattern*in(tpoints(1));
    
    lhs = G + ((2*C)/h); %LHS of the backward euler method
    [L,U,P] = lu(lhs); %inverse of the LHS
    
    rhs = ((2*C)/h) - G; %RHS
    
    %performing trapeziodal rule and substituting in res
    for i = 1:N-1
        b_nplus1 = pattern*in(tpoints(i+1));
          
        y = L\(P*(rhs*x0 + bn + b_nplus1));
        x1 = U\y;
        
        res(i+1) = x1(out);
        x0 = x1;
        bn = b_nplus1;
        
    end
end