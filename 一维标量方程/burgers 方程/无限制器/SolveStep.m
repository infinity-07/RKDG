function [U,m_Hflux] = SolveStep(U)
U_tilde = GetUtilde(U);     % 计算 U 波浪
Upm = GetUpm(U,U_tilde);    % 计算间断点处两端的极限
m_Hflux = Getflux(Upm);     % 计算端点处通量
end