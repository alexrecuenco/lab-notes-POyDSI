
import matplotlib.pyplot as plt
#matplotlib.rcsetup.interactive_bk
#matplotlib.rcsetup.non_interactive_bk
# https://stackoverflow.com/a/5092255
# TODO: Might be broken -> from  matplotlib import pyplot as plt
from scipy.io.wavfile import read
from scipy import signal

fs, sig = read("./mel2_note.wav");
f, t, Sxx = signal.spectrogram(sig);
plt.pcolormesh(t, f, Sxx, shading='gouraud', snap=True, rasterized=True);
plt.ylabel('Frequency [Hz]');
plt.xlabel('Time [sec]');
plt.show();
plt.close();