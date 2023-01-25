function s = Compute_U(U,i,x)
global Center
global hstep


a1 = 1;
a2 = 12 / hstep;
a3 = 180 / hstep / hstep;
basefun1 = @(i,x) 1;
basefun2 = @(i,x) x-Center(i);
basefun3 = @(i,x) (x-Center(i)).^2-1/12*hstep^2;

s1 = a1 * U(i,1) * basefun1(i,x);
s2 = a2 * U(i,2) * basefun2(i,x);
s3 = a3 * U(i,3) * basefun3(i,x);
s = s1+s2+s3;
end