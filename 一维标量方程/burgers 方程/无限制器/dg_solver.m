function [xx,U_total,delta_t] = dg_solver(num,time)
global Center
global Element
global hstep
%% 
% 设置方程

u0 = @(x) sin(x);   % 初值
left = 0;           % 求解区间
right = 2*pi;       % 求解区间
%% 
% 分配内存

delta_t = 0.01*(right-left)/num;    % 时间步长
hstep = (right-left)/num;           % 每个区间的长度，这里设置成等长。
Element_l = left:hstep:right-hstep; % 每个区间的左边界，大小为 1xNum
Element_r = left+hstep:hstep:right; % 每个区间的右边界，大小为 1xNum
Element = [Element_l',Element_r'];  % 每个区间的左右边界，大小为 Numx2
Center = mean(Element,2);           % 每个区间的中心点，大小为 Numx1
n = ceil(time/hstep);
%% 
% 初始化

U_total = cell(1,n);
U = Uinitial(u0,num);
U_total{1} = U;
%% 
% 龙格库塔迭代

[U,~] = SolveStep(U);
now = 0;

% 初始化进度条
h = waitbar(0,'Please wait...');
i = 2;
while now<time
    if now+delta_t>time
        delta_t = time-now;
    end
    U = RungeKutta(U,delta_t);
    U_total{i} = U;
    now = now+delta_t;
    waitbar(now/time,h,'Processing...')
    i = i+1;
end
close(h)
%% 
% 

xx = Center;
fprintf('求解区间为[%d,%d]\n',left,right);
fprintf('小区间的个数为 %d\n',num)
fprintf('初值为 ');
syms x;
disp(u0(x))
fprintf('%c%c', 8, 8);%删掉两个换行符
end