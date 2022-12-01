n_mu_sigma = [
    [100, 0, 1]; 
    [500, 0, 1]; 
    [5000, 0, 1]; 
    [1000, -2, 1]; 
    [1000, 0, 3];
    [1000, 4, 0.5]
   ];

for i=1:length(n_mu_sigma)
   N  = n_mu_sigma(i, 1);
   mu  = n_mu_sigma(i, 2);
   sigma  = n_mu_sigma(i, 3);
   subplot(3, 2, i)
   plotnorm(N, mu, sigma);
   subtitle = "N=" + N + ", mu=" + mu+ ", sigma="+ sigma;
   title("Normal distribution", subtitle)
end
hold off