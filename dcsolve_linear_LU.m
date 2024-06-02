% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that calculates the DC solution of a linear
%             circuit using LU factorization.
%
%Output Parameters: - r: output DC solution
% -------------------------------------------------------------------------

function r = dcsolve_linear_LU()

    global G b;

    A = G;
    [L,U,P] = lu(A);
    y = L\(P*b);
    r = U\y;
end