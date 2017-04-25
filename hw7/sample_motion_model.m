function x_n = sample_motion_model(x,u)

d_r1 = u(1);
d_r2 = u(2);
d_t = u(3);

alpha = [0.1,0.1,0.01,0.01]';

d_r1_hat = d_r1 + sample_normal_distribution(alpha(1)*abs(d_r1)+alpha(2)*d_t);
d_t_hat = d_t + sample_normal_distribution(alpha(3)*d_t+alpha(4)*(abs(d_r1)+abs(d_r2)));
d_r2_hat = d_r2 + sample_normal_distribution(alpha(1)*abs(d_r2)+alpha(2)*d_t);

x_n(1) = x(1)+d_t_hat*cos(x(3)+d_r1_hat);
x_n(2) = x(2)+d_t_hat*sin(x(3)+d_r1_hat);
x_n(3) = x(3)+d_r1_hat+d_r2_hat;

end