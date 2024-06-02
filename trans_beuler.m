% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that performs transient analysis to a linear circuit
%             using Backward-Euler Method.
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

function [tpoints,res] = trans_beuler(t1,t2,h,in,out) 

    global G C b

    tpoints = t1:h:t2; %the time points at which the output was evaluated
    N = length(tpoints); 

    res = zeros(1,N); 
    x0 = zeros(length(b),1);    %initial condition of 0
    res(1) = x0(out); 

    I1 = G + C/h; %LHS of backward euler
    I2 = C/h; %RHS of backward euler
    [L,U,P] = lu(I1); %inverse of the LHS

    row_index = find(b); %finding at which rows the matrix b has non-zero elements
    pattern = b;

    %normalizing the values of non-zero elements of b 
    for j = 1:length(row_index)
        pattern(row_index(j)) = b(row_index(j)) / abs(b(row_index(j)));
    end

    %performing backward euler method and substituting in res
    for i=1:N-1
        b_nplus1 = pattern*in(tpoints(i+1));
        RHS = I2*x0 + b_nplus1;
  
        y = L\(P*RHS);        
        x1 = U\y;

        res(i+1) = x1(out);
        x0 = x1;
    end
end






