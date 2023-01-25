function U_tilde = GetUtilde(U)
%  GETUTILDE $$\tilde{u}_{j}=\sum_{l=1}^{k} a_{l} u_{j}^{(l)} v_{l}^{(j)}\left(x_{j+1 / 
% 2}\right)$$
% 
% $$\tilde{u}_{j}=-\sum_{l=1}^{k} a_{l} u_{j}^{(l)} v_{l}^{(j)}\left(x_{j-1 
% / 2}\right)$$
% 
% $$\tilde{u}_{j}=6 u_{j}^{(1)}+30 u_{j}^{(2)}$$
% 
% $$\widetilde{u}_{j}=6 u_{j}^{(1)}-30 u_{j}^{(2)}$$
num = size(U,1);
U_tilde = zeros(num,2); 
for i = 1:num
    U_tilde(i, 1) = 6 * U(i, 2) + 30 * U(i, 3);
    U_tilde(i, 2) = 6 * U(i, 2) - 30 * U(i, 3);
end
end