function Upm = GetUpm(U,Utilde)
%  GETUPM $$u_{j+1 / 2}^{-}=u_{j}^{(0)}+6 u_{j}^{(1)}+30 u_{j}^{(2)}$$
% 
% $$u_{j-1 / 2}^{+}=u_{j}^{(0)}-6 u_{j}^{(1)}+30 u_{j}^{(2)}$$
% 
% $$u_{j+1 / 2}^{-}=u_{j}^{(0)}+\tilde{u}_{j}$$
% 
% $$u_{j-1 / 2}^{+}=u_{j}^{(0)}-\tilde{\tilde{u}}_{j}$$
num = size(Utilde,1);
Upm = zeros(num,2);
for i = 1:num
    Upm(i, 1) = U(i, 1) - Utilde(i, 2);  % U+    第 i 个区间上的左端点的极限值
    Upm(i, 2) = U(i, 1) + Utilde(i, 1);  % U-    第 i 个区间上的右端点的极限值
end
end