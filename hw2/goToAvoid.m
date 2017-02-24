function x = goToAvoid(x0,xg,xo)

x = x0;
d0 = 10;
rho_0 = 8;

xi = 1;
v = 100;
delta = 0.1;

i = 1;
while(1)

    if(norm(x(:,i) - xg) < 0.1 || i > 100000)
        break;
    end

    DUatt = xi*(x(:,i) - xg);
    
    F = -DUatt;
    
    for j = 1:size(xo,2)     
        DUrep = [0;0];
        %Closest point on obstacle
        op = d0*(x(:,i) - xo(:,j))/norm(x(:,i) - xo(:,j)) + xo(:,j);
        rho_q = norm(x(:,i)-op);
        if rho_q < rho_0
            DUrep = - v * (1/rho_q - 1/rho_0) * 1/rho_q^2 * (x(:,i)-op)/rho_q;
        end
        F = F - DUrep;
    end
    xn = x(:,i) + delta * F / norm(F);
    x = [x xn];
    i = i+1;
end

end
