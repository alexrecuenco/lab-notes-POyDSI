
data_f = {
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
   [h,x,y] = hist_pdf(data, pdf);
   title(title_text)
end
hold off
