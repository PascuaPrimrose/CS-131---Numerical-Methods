//GaussNewton
clc
clear
C = [2.5, 5, 10, 15, 20];
v0 = [0.024, 0.036, 0.053, 0.060, 0.064];
vm = 1;
Km = 1;

function [v0] = func(vm, Km, C) 
       v0 = (vm)/(1+(Km/C));
endfunction
    
for j=1:10
       A = []
       b = []
    for i=1:5
        dF0 = C(i)/(C(i)+Km)
        dF1 = -C(i)*vm/((C(i)+Km)^2)
        row = [dF0, dF1]
        A = cat(1, A, row)
        bn = v0(i) - func(vm, Km, C(i))
        b = cat(1, b, bn)
     end
     
     z = linsolve(A'*A, -(A'*b))
     disp(A)
     disp(b)
     vm = vm + z(1)
     Km = Km + z(2)
end

disp(vm)
disp(Km)
plot(C, v0, ".")
newV = []

for i=1:5
    v = func(vm, Km, C(i))
    newV(i)= v
end
disp(newV)
plot(C, newV)




