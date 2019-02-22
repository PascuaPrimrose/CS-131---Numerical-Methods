clc
clear
//1Bii
function [f,df]= newtonraphsonFunc(x)
    f = (x^3)-(1.2*x^2)-(8.19*x)+13.23;
    df = (3*x^2)-(2.4*x)-8.19;
endfunction
//main
x=[4.0];
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
    x($+1) = x($) - 2*fx/dfx;
    difference = abs(x($)-x($-1));
    Iteration($+1) = Iteration($) + 1;
end

disp(x);
plot(Iteration, x);
