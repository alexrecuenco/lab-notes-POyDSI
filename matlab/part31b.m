% part 3 1

data_f = {
    {'triangular', @() triang(50)};
    {'Hanning', @() hann(50)};
    {'Blackman', @() blackman(50)};
    {'Weibull', @() chebwin(50)};
   };

% wvtool(blackman(50))

for window_data = data_f'
    [name, window_f] = window_data{1}{:};
    wvtool(window_f());
end


% https://www.mathworks.com/help/dsp/ref/firgr.html
% Use fvtool to visualize the filter or whateverz