% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: function that performs transient analysis to a linear circuit
%             using Forward Euler Method.
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

function [tpoints,res] = trans_feuler(t1,t2,h,in,out) 

    global G C b

    %verifying whether the matrix we are using to solve the system with using
    %feuler is singular or not 
    %if the matric C is singular (noninvertible) then the system cannot be
    %solved using feuler and we should resort to other methods
    %a customized error will be reported to the user accordingly
    if det(C) == 0
        error('C is a singular matrix. This operation cannot be performed using feuler.');
    else
        tpoints = t1:h:t2; %the time points at which the output was evaluated
        N = length(tpoints);

        res = zeros(1,N); %value of the response at above time points %initial condition
        x0 = zeros(length(b),1);
        res(1) = x0(out); %initial conditions

        row_index = find(b); %finding at which rows the matrix b has non-zero elements
        pattern = b;

        %normalizing the values of non-zero elements of b 
        for j = 1:length(row_index)
            pattern(row_index(j)) = b(row_index(j)) / abs(b(row_index(j)));
        end

        I = (C/h)-G; %from the RHS of the backward euler method
        LHS = C/h; %the LHS
        [L,U,P] = lu(LHS); %inverse of the LHS

        %performing backward euler method and substituting in res
        for i = 1:N-1
            bn = pattern*in(tpoints(i));
            RHS = I*x0 + bn;
  
            y = L\(P*RHS);        
            x1 = U\y;

            res(i+1) = x1(out);
            x0 = x1;
        end
    end
end
