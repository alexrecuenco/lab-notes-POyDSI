data_f = {
    {'log-norm', @(N) lognrnd(0,1, N), @(x) lognpdf(x, 0, 1)};
    {'t-student', @(N) trnd(3, N), @(x) tpdf(x, 3)};
    {'Rayleigh', @(N) raylrnd(1, N), @(x) raylpdf(x, 1)};
    {'Weibull', @(N) wblrnd(1, 2, N), @(x) wblpdf(x, 1,2)};
   };
N=1000;
hold off
for i=1:length(data_f)
   cell = data_f{i};
   title_text = cell{1};
   frnd = cell{2};
   pdf = cell{3};
   data = frnd(N);

   subplot(2, 2, i);
   hist_pdf(data, pdf);
   title(title_text);

end
hold off
