function [data] = plotnorm(N,mu, sigma)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
   data = normrnd(mu, sigma, N);
   hist_pdf(data, @(x) normpdf(x, mu, sigma))
end

