function [R,T,K] = calibration2Dto3D(X,x)

h = 1;

for k =1:size(x, 2)

A(h, :) = [X(1, k) X(2, k) X(3, k) 1 ...
           0 0 0 0 ...
           -x(1, k)*X(1, k) -x(1, k)*X(2, k) ...
           -x(1, k)*X(3, k) -x(1, k)];
A(h + 1, :) = [0 0 0 0 ...
               X(1, k) X(2, k) X(3, k) 1 ...
               -x(2, k)*X(1, k) -x(2, k)*X(2, k) ...
               -x(2, k)*X(3, k) -x(2, k)];
h = h + 2;
end;

[U S V] = svd(A);

% camera matrix
P = V(:, size(V,2));
P = reshape(P, 4, 3)';

[K,R] = rq(P(:,1:3));

% make diagonal of K positive
S = diag(sign(diag(K)));

K = K * S;
R = S * R;

T = inv(K)*P(:,4);

end