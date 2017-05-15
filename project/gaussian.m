function gauss = gaussian(mu, sigma, x)

    gauss = exp(- ((x - mu).^2) ./ (sigma^2) ./ 2.0) ./ sqrt(2.0 * pi * (sigma^2));

end