function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
if nargin < 3
    error('At least 3 input arguments are needed')
end
if nargin < 4
    es = 0.0001;
end
if nargin < 5
    maxit = 200;
end

iter = 0;
rootest = func(xu)*func(xl);
if rootest > 0
    error('Cannot bracket the root')
end
if rootest == 0
    if func(xu) == 0
        root = xu;
        fx = func(xu);
        maxit  = iter;
        ea = 0;
        return
    end
    if func(xl) == 0;
        root = xl;
        fx = func(xl);
        maxit = iter;
        ea = 0;
        return
    end
end
ea = 100;
xr = xl;
while ea > es
    previousxr = xr;
    xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));
    upperbound = func(xu)*(func(xr));
    lowerbound = func(xl)*func(xr);
    if upperbound < 0
        xu = xu;
        xl = xr;
        ea = abs((xr-previousxr)/xr)*100;
        iter = iter + 1;
    elseif lowerbound < 0
        xu = xr;
        xl = xl;
        ea = abs((xr-previousxr)/xr)*100;
        iter = iter + 1;
    elseif upperbound || lowerbound == 0
        root = xr;
        fx = func(xr);
        iter = iter + 1;
        maxit = iter;
        ea = 0;
    end
        if ea <= es || iter >= maxit
        break
    end
end
root = xr;
fx = func(xr);
maxit = iter + 1;
ea = ea;