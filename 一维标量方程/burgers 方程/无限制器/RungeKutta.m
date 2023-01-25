function U = RungeKutta(U,delta_t)
%  RUNGEKUTTA $$u^{(1)}=u^{n}+\Delta t L\left(u^{n}, t^{n}\right)$$
% 
% $$u^{(2)}=\frac{3}{4} u^{n}+\frac{1}{4} u^{(1)}+\frac{1}{4} \Delta t L\left(u^{(1)}, 
% t^{n}+\Delta t\right)$$
% 
% $$u^{n+1}=\frac{1}{3} u^{n}+\frac{2}{3} u^{(2)}+\frac{2}{3} \Delta t L\left(u^{(2)}, 
% t^{n}+\frac{1}{2} \Delta t\right)$$
[U,m_Hflux] = SolveStep(U);
U1 = U + delta_t * L(U,m_Hflux);
[U1,m_Hflux] = SolveStep(U1);
U2 = 3/4*U + 1/4*U1 + 1/4*delta_t*L(U1,m_Hflux);
[U2,m_Hflux] = SolveStep(U2);
Un = 1/3*U + 2/3*U2 + 2/3*delta_t*L(U2,m_Hflux);
[Un,~] = SolveStep(Un);
U = Un;
end