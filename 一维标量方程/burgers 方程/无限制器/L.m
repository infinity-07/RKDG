function dU = L(U,m_Hflux)
%  L $$\frac{d}{d t} u_{j}^{(0)}=-\frac{1}{\Delta x_{j}}\left(h_{j+1 / 2}-h_{j-1 
% / 2}\right)$$
% 
% $$\frac{d}{d t} u_{j}^{(1)}=-\frac{1}{2 \Delta x_{j}}\left(h_{j+1 / 2}+h_{j-1 
% / 2}\right)+\frac{1}{\Delta x_{j}^{2}} \int_{I_{j}} f\left(u^{h}(x, t)\right) 
% d x$$
% 
% $$\frac{d}{d t} u_{j}^{(2)} = -\frac{1}{6 \Delta x_{j}}\left(h_{j+1 / 2}-h_{j-1 
% / 2}\right)+\frac{2}{\Delta x_{j}^{3}} \int_{I_{j}} f\left(u^{h}(x, t)\right) 
% v_{1}^{(j)}(x) d x$$
global hstep
global Element
global Center
[num,K] = size(U);
dU = zeros(num,K);
fu
for i = 1:num
    a = Element(i,1);
    b = Element(i,2);
    dU(i,1) = -(m_Hflux(i+1) - m_Hflux(i)) / hstep;
    int1 = quadgk(@(x) f(Compute_U(U,i,x)),a,b);
    dU(i,2) = -(m_Hflux(i+1) + m_Hflux(i)) / (2 * hstep) + int1 / hstep^2;
    
    int2 = quadgk(@(x) f(Compute_U(U,i,x)).*(x-Center(i)),a,b);
    dU(i,3) =  -(m_Hflux(i+1) - m_Hflux(i)) / (6 * hstep) + 2 * int2 / hstep^3;
end
end