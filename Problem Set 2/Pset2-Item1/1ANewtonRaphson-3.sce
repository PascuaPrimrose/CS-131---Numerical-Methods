clc
clear
//1iii
function [f,df]= newtonraphsonFunc(x)
    f = (x^3)-(x)-3;
    df =(3*x^2)-1;
endfunction
//main
x=[0.0];
maxIteration = 100;
Iteration=[0];
tolerance = 0.000001;
large = 10^200;
difference = 1;
while(1)
    if ((Iteration($)== maxIteration)||(difference<tolerance)||(abs(x($))>large)) then
        break;
    end
    [fx, dfx] = newtonraphsonFunc(x($));
    x($+1) = x($) - fx/dfx;
    difference = abs(x($)-x($-1));
    Iteration($+1) = Iteration($) + 1;
end

disp(x);
plot(Iteration, x);
