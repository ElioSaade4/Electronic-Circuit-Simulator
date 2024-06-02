function [L,U] = lu_factorization(A)

    for i = 1:length(A)-1
        for j = i+1:length(A)
            A(j,i)=A(j,i)/A(i,i);
        end
        for m = i+1:length(A)
            for n = i+1:length(A)
                A(m,n)=A(m,n)-A(i,n)*A(m,i);
            end
        end
    end

    L =  eye(length(A)) + tril(A,-1);
    U = triu(A);
end
