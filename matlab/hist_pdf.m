function [h, x, y] = hist_pdf(data, pdf)
   h = histogram(data, 'Normalization','pdf');
   edges = h.BinLimits;
   xmin = max(edges(1), -4);
   xmax = min(edges(2), 4);
   x = xmin:0.1:xmax;
   y = pdf(x);
   hold on
   plot(x,y)
   med = median(data, 'all');
   mu = mean(data, 'all');
   [value, argmax] = max(h.BinCounts);
   mode = h.BinEdges(argmax);
   xline(med, 'b');
   xline(mu, 'r');
   xline(mode, 'g');
   % legend('Histogram', 'pdf', 'median', 'mean', 'mode');
end
