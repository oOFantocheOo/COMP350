function root = secant(f,x0,x1,xtol,ftol,n_max,display)

n=0;
fx0=feval(f,x0);
fx1=feval(f,x1);


if display, 
   disp('   n             x                    f(x)           ')
   disp('-----------------------------------------------------')
   disp(sprintf('%4d %23.15e %23.15e %23.15e', n, x0, fx0))
   disp(sprintf('%4d %23.15e %23.15e %23.15e', n, x1, fx1))
end

for n = 1:n_max
    d =((x1-x0)/(fx1-fx0))*fx1;
    x0=x1;
    fx0=fx1;
    x1=x1-d;
    fx1=feval(f,x1);
    if display,
           disp(sprintf('%4d %23.15e %23.15e %23.15e', n, x1, fx1)), end
    if abs(d)<=xtol | abs(fx1)<=ftol
        root=x1;
        return
    end
end
root=x1;