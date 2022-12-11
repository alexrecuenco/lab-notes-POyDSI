[phi,psi,xval] = wavefun('db4');
subplot(211);
plot(xval,phi);
title('db4 Scaling Function');
subplot(212);
plot(xval,psi);
title('db4 Wavelet');

dwt(signal, 'db4')

plot(a)

[w, ref] = wavedec(signal, 20, 'db4');

lvl=detcoef(w, ref, 5);
plot(lvl)