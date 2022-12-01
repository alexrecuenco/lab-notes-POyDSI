% part 3 1

data_f = {
    {'triangular', @(N) triang(50), @(x) lognpdf(x, 0, 1)};
    {'Hanning', @(N) hann(50), @(x) tpdf(x, 3)};
    {'Blackman', @(N) blackman(50), @(x) raylpdf(x, 1)};
    {'Weibull', @(N) chebwin(50), @(x) wblpdf(x, 1,2)};
   };

subplot(2,2,1)
wvtool(blackman(50))

