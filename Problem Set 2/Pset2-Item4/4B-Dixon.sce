////Linear Least Squares (ii) Dixon
clc
clear
C = [2.5, 5, 10, 15, 20];
v0 = [0.024, 0.036, 0.053, 0.060, 0.064];

function [a0, a1] = leastSq(x, y)
    nx = 5
    sumX = sum(x)
    sumY = sum(y)
    sumXY = sum(x.*y)
    sumXX = sum(x.^2)
    a1 = (nx*sumXY-sumX*sumY)/(nx*sumXX-sumX^2)
    a0 = (sumXX*sumY-sumXY*sumX)/(nx*sumXX-sumX^2)
endfunction

function [y] = func(a0,a1,x)
    y = a1*x + a0
endfunction

x = 0;
y = 0;

x = C
y = C./v0

[z,a] = leastSq(x, y);
disp(z, "Vmax");
disp(a, "Km");

yL = []
for i=1:5
    yL(i) = func(z, a, x(i))
end

plot(x, yL)
plot(x, y, ".")


