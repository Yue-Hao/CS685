function prob = measurementModel(d, p, x, b)
% d = mesurement
% p = position
% x = landmark
% b = sigma squre

prob = 1/(sqrt(2*pi*b))*exp(-(d-norm(p-x))^2/(2*b));

end