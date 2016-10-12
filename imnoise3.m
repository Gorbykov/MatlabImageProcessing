function [r, R, S] = imnoise3(MN, C, A, B)
[K, n] = size(C);
M=MN(1);
N=MN(2);
if nargin == 2
    A(1:K) = 1.0;
    B(1:K, 1:2) = 0;
elseif nargin == 3
    B(1:K, 1:2) = 0;
end
% Generate R.
R = zeros(M, N);
for j = 1:K 
    u1 = fix(M/2) + 1 + C(j, 1);
    v1 = fix(N/2) + 1 + C(j, 2);
    R(u1, v1) = i * (A(j)/2) * exp(i*2*pi*C(j, 1) * B(j,1)/M);
    % Complex conjugate. 
    u2 = fix(M/2) + 1 - C(j, 1);
    v2 = fix(N/2) + 1 - C(j, 2);
    R(u2, v2) = -i * (A(j)/2) * exp(i*2*pi*C(j, 2) * B(j, 2)/N);
end
% Compute spectrum and spatial sinusoidal pattern. 
S = abs(R); 
r = real(ifft2(ifftshift(R)));
