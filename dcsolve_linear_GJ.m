% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that calculates the DC solution of a linear
%             circuit using Gauss-Jacobi Iteration.
%
%Input Parameters:  - x0: initial guess
%                   - error_tol: error tolerance
%                   - max_iter: maximum number of iterations
%
%Output Parameters: - r: output DC response
%                   - count: number of iterations
% -------------------------------------------------------------------------

function [r,count] = dcsolve_linear_GJ(x0,error_tol,max_iter)

    global G b;
    
    %check for negative error tolerance
    if error_tol < 0
        error('The error tolerance must be positive.');
    else
        G1 = G;
        b1 = b;
    
        max_rows = size(G,1);
    
        %switch rows to make sure the diag(G) is difeerent from 0
        while prod(diag(G1)) == 0
            G1 = G;
            b1 = b;
            row1 = randi(max_rows);
            row2 = randi(max_rows);
            G1([row1 row2],:) = G1([row2 row1],:);
            b1([row1 row2]) = b1([row2 row1]);
        end
        
        %decompose G into L, U and D
        L = tril(G1,-1);
        U = triu(G1,1);
        D = G1-L-U;
    
        %iterate until desired error or total iterations is reached
        for i = 1:max_iter
            r = D\(b1 - (L+U)*x0);
            count = i;
        
            if max(abs(r-x0)) < error_tol
                break;
            end
        
            x0 = r;
        end
    end

end